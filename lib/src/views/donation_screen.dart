import 'package:flutter/material.dart';
import '../l10n/generated/app_localizations.dart';
import '../models/models.dart';
import '../services/api_service.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../utils/constants.dart';
import '../utils/validators.dart';
import '../widgets/widgets.dart';

/// Screen for making a donation to a cause
class DonationScreen extends StatefulWidget {
  final Cause cause;

  const DonationScreen({
    super.key,
    required this.cause,
  });

  @override
  State<DonationScreen> createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _apiService = ApiService();

  final _amountController = TextEditingController();
  final _phoneController = TextEditingController();
  final _messageController = TextEditingController();

  double? _selectedQuickAmount;
  bool _isLoading = false;
  bool _isPolling = false;
  
  // Sandbox only supports EUR
  static const String _donationCurrency = 'EUR';

  @override
  void dispose() {
    _amountController.dispose();
    _phoneController.dispose();
    _messageController.dispose();
    _apiService.dispose();
    super.dispose();
  }

  void _onQuickAmountSelected(double amount) {
    setState(() {
      _selectedQuickAmount = amount;
      _amountController.text = amount.toStringAsFixed(0);
    });
  }

  void _onAmountChanged(String value) {
    final amount = double.tryParse(value);
    setState(() {
      if (amount != null &&
          AppConstants.quickDonationAmounts.contains(amount)) {
        _selectedQuickAmount = amount;
      } else {
        _selectedQuickAmount = null;
      }
    });
  }

  String _getErrorMessage(dynamic error, AppLocalizations l10n) {
    if (error is ApiException) {
      final message = error.message.toLowerCase();
      if (message.contains('unable to connect') ||
          message.contains('connection') ||
          message.contains('connect to server')) {
        return l10n.errorConnectionFailed;
      }
      if (message.contains('timeout') || message.contains('timed out')) {
        return l10n.errorRequestTimeout;
      }
      if (message.contains('network error')) {
        return l10n.errorNetworkError;
      }
      if (message.contains('an error occurred') ||
          message.contains('error occurred')) {
        return l10n.errorAnErrorOccurred;
      }
      return error.message;
    }
    if (error is String) {
      return error;
    }
    return l10n.errorUnexpected;
  }

  Future<void> _submitDonation() async {
    if (!_formKey.currentState!.validate()) return;

    final l10n = AppLocalizations.of(context)!;

    setState(() {
      _isLoading = true;
    });

    try {
      // Clean amount - remove any formatting characters (spaces, commas, currency symbols)
      final cleanAmount = _amountController.text
          .trim()
          .replaceAll(RegExp(r'[^\d.]'), '');
      
      if (cleanAmount.isEmpty) {
        if (mounted) {
          final l10n = AppLocalizations.of(context)!;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(l10n.validationAmountRequired),
              backgroundColor: AppColors.error,
            ),
          );
        }
        return;
      }

      final request = DonationRequest(
        causeId: widget.cause.id,
        amount: cleanAmount,
        currency: _donationCurrency, // Sandbox only supports EUR
        donorPhone: _phoneController.text.trim(),
        payerMessage: _messageController.text.trim().isEmpty
            ? null
            : _messageController.text.trim(),
      );

      final response = await _apiService.makeDonation(request);

      // Check if there's a payment error - show it immediately
      if (response.paymentError != null && response.paymentError!.isNotEmpty) {
        if (mounted) {
          _showErrorDialog(response.paymentError!, l10n);
        }
        return;
      }

      // Only proceed with payment flow if payment was successfully initiated
      if (response.paymentInitiated) {
        setState(() {
          _isPolling = true;
        });
        
        // Show waiting dialog
        if (mounted) {
          _showPaymentPendingDialog(response, l10n);
        }
        
        // Start polling for status
        await _pollPaymentStatus(response.donationId, l10n);
      } else {
        // Payment was not initiated - show error
        if (mounted) {
          _showErrorDialog(
            response.paymentError ?? l10n.donateFailedDesc,
            l10n,
          );
        }
      }
    } on ApiException catch (e) {
      if (mounted) {
        _showErrorDialog(_getErrorMessage(e, l10n), l10n);
      }
    } catch (e) {
      if (mounted) {
        _showErrorDialog(l10n.commonUnknownErrorDesc, l10n);
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _pollPaymentStatus(String donationId, AppLocalizations l10n) async {
    int polls = 0;
    
    while (polls < AppConstants.paymentStatusMaxPolls && _isPolling) {
      await Future.delayed(
        Duration(seconds: AppConstants.paymentStatusPollInterval),
      );
      
      if (!_isPolling || !mounted) return;

      try {
        final donation = await _apiService.checkDonationStatus(donationId);
        
        if (donation.status == DonationStatus.success) {
          setState(() {
            _isPolling = false;
          });
          if (mounted) {
            Navigator.of(context).pop(); // Close pending dialog
            _showSuccessDialog(l10n);
          }
          return;
        } else if (donation.status == DonationStatus.failed) {
          setState(() {
            _isPolling = false;
          });
          if (mounted) {
            Navigator.of(context).pop(); // Close pending dialog
            _showErrorDialog(l10n.donateFailedDesc, l10n);
          }
          return;
        }
      } catch (_) {
        // Continue polling even if one request fails
      }
      
      polls++;
    }
    
    // Timeout reached
    if (_isPolling && mounted) {
      setState(() {
        _isPolling = false;
      });
      Navigator.of(context).pop(); // Close pending dialog
      _showTimeoutDialog(l10n);
    }
  }

  void _showPaymentPendingDialog(DonationResponse response, AppLocalizations l10n) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => PopScope(
        canPop: false,
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppTheme.radiusLg),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: AppTheme.spaceLg),
              Text(
                l10n.donateWaiting,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: AppTheme.spaceSm),
              Text(
                l10n.donateWaitingDesc(response.amount, response.currency),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppTheme.spaceMd),
              TextButton(
                onPressed: () {
                  setState(() {
                    _isPolling = false;
                  });
                  Navigator.of(context).pop();
                },
                child: Text(l10n.donateCancel),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSuccessDialog(AppLocalizations l10n) {
    final theme = Theme.of(context);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTheme.radiusLg),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppTheme.spaceLg),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: AppColors.success.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_circle,
                  color: AppColors.success,
                  size: 48,
                ),
              ),
              const SizedBox(height: AppTheme.spaceMd),
              Text(
                l10n.donateSuccess,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: AppTheme.spaceSm),
              Text(
                l10n.donateSuccessDesc(
                  _amountController.text,
                  _donationCurrency,
                  widget.cause.name,
                ),
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppTheme.spaceLg),
              PrimaryButton(
                text: l10n.donateDone,
                onPressed: () {
                  Navigator.of(context).pop(); // Close dialog
                  Navigator.of(context).pop(); // Go back to cause detail
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showErrorDialog(String message, AppLocalizations l10n) {
    final theme = Theme.of(context);

    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTheme.radiusLg),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppTheme.spaceLg),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: AppColors.error.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.error_outline,
                  color: AppColors.error,
                  size: 48,
                ),
              ),
              const SizedBox(height: AppTheme.spaceMd),
              Text(
                l10n.donateFailed,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: AppTheme.spaceSm),
              Text(
                message,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppTheme.spaceLg),
              PrimaryButton(
                text: l10n.donateRetry,
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showTimeoutDialog(AppLocalizations l10n) {
    final theme = Theme.of(context);

    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTheme.radiusLg),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppTheme.spaceLg),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: AppColors.warning.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.access_time,
                  color: AppColors.warning,
                  size: 48,
                ),
              ),
              const SizedBox(height: AppTheme.spaceMd),
              Text(
                l10n.donatePending,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: AppTheme.spaceSm),
              Text(
                l10n.donatePendingDesc,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppTheme.spaceLg),
              PrimaryButton(
                text: l10n.commonOk,
                onPressed: () {
                  Navigator.of(context).pop(); // Close dialog
                  Navigator.of(context).pop(); // Go back
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.donateTitle),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppTheme.spaceMd),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Cause info card
              Container(
                padding: const EdgeInsets.all(AppTheme.spaceMd),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(AppTheme.radiusSm),
                      ),
                      child: const Icon(
                        Icons.volunteer_activism,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(width: AppTheme.spaceMd),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n.donateDonatingTo,
                            style: theme.textTheme.labelMedium?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                          Text(
                            widget.cause.name,
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: AppTheme.spaceLg),

              // Quick amounts
              Text(
                l10n.donateQuickAmount(_donationCurrency),
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: AppTheme.spaceSm),
              QuickAmountChips(
                amounts: AppConstants.quickDonationAmounts,
                selectedAmount: _selectedQuickAmount,
                onSelected: _onQuickAmountSelected,
                currencySymbol: AppConstants.getCurrencySymbol(_donationCurrency),
              ),

              const SizedBox(height: AppTheme.spaceLg),

              // Custom amount
              CustomInputField(
                controller: _amountController,
                label: '${l10n.donateAmount} ($_donationCurrency)',
                hint: l10n.donateAmountHint,
                prefixIcon: Icons.monetization_on_outlined,
                keyboardType: TextInputType.number,
                validator: (value) => Validators.validateAmount(
                  value,
                  min: AppConstants.minDonationAmount,
                  emptyMessage: l10n.validationAmountRequired,
                  invalidMessage: l10n.validationAmountInvalid,
                  minMessage: l10n.validationAmountMin(
                    AppConstants.getCurrencySymbol(_donationCurrency),
                    AppConstants.minDonationAmount.toStringAsFixed(0),
                  ),
                ),
                onChanged: _onAmountChanged,
              ),

              const SizedBox(height: AppTheme.spaceMd),

              // Phone number
              PhoneInputField(
                controller: _phoneController,
                label: l10n.donatePhone,
                hint: l10n.donatePhoneHint,
                validator: (value) => Validators.validatePhone(
                  value,
                  emptyMessage: l10n.validationPhoneRequired,
                  invalidMessage: l10n.validationPhoneInvalid,
                ),
              ),

              const SizedBox(height: AppTheme.spaceSm),

              // Info about MoMo
              Container(
                padding: const EdgeInsets.all(AppTheme.spaceMd),
                decoration: BoxDecoration(
                  color: AppColors.info.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                  border: Border.all(
                    color: AppColors.info.withValues(alpha: 0.3),
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.info_outline,
                      color: AppColors.info,
                      size: 20,
                    ),
                    const SizedBox(width: AppTheme.spaceSm),
                    Expanded(
                      child: Text(
                        l10n.donateMoMoInfo,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: AppColors.info,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: AppTheme.spaceMd),

              // Message
              CustomInputField(
                controller: _messageController,
                label: l10n.donateMessage,
                hint: l10n.donateMessageHint,
                prefixIcon: Icons.message_outlined,
                maxLines: 3,
                maxLength: AppConstants.maxMessageLength,
                textCapitalization: TextCapitalization.sentences,
              ),

              const SizedBox(height: AppTheme.spaceLg),

              // Submit button
              PrimaryButton(
                text: l10n.donateContinue,
                icon: Icons.payment,
                isLoading: _isLoading,
                onPressed: _submitDonation,
              ),

              SizedBox(height: mediaQuery.padding.bottom + AppTheme.spaceMd),
            ],
          ),
        ),
      ),
    );
  }
}
