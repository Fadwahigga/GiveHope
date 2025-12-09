import 'package:flutter/material.dart';
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

  Future<void> _submitDonation() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final request = DonationRequest(
        causeId: widget.cause.id,
        amount: _amountController.text.trim(),
        currency: AppConstants.defaultCurrency,
        donorPhone: _phoneController.text.trim(),
        payerMessage: _messageController.text.trim().isEmpty
            ? null
            : _messageController.text.trim(),
      );

      final response = await _apiService.makeDonation(request);

      if (response.paymentInitiated) {
        setState(() {
          _isPolling = true;
        });
        
        // Show waiting dialog
        if (mounted) {
          _showPaymentPendingDialog(response);
        }
        
        // Start polling for status
        await _pollPaymentStatus(response.donationId);
      } else {
        if (mounted) {
          _showErrorDialog(response.paymentError ?? 'Payment initiation failed');
        }
      }
    } on ApiException catch (e) {
      if (mounted) {
        _showErrorDialog(e.message);
      }
    } catch (e) {
      if (mounted) {
        _showErrorDialog('An unexpected error occurred. Please try again.');
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _pollPaymentStatus(String donationId) async {
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
            _showSuccessDialog();
          }
          return;
        } else if (donation.status == DonationStatus.failed) {
          setState(() {
            _isPolling = false;
          });
          if (mounted) {
            Navigator.of(context).pop(); // Close pending dialog
            _showErrorDialog('Payment was declined or failed. Please try again.');
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
      _showTimeoutDialog();
    }
  }

  void _showPaymentPendingDialog(DonationResponse response) {
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
                'Waiting for Payment',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: AppTheme.spaceSm),
              Text(
                'A payment request has been sent to your phone.\n\nPlease approve the MTN MoMo payment of ${response.amount} ${response.currency}.',
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
                child: const Text('Cancel'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSuccessDialog() {
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
                'Thank You!',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: AppTheme.spaceSm),
              Text(
                'Your donation of ${_amountController.text} ${AppConstants.defaultCurrency} to "${widget.cause.name}" has been processed successfully.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppTheme.spaceLg),
              PrimaryButton(
                text: 'Done',
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

  void _showErrorDialog(String message) {
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
                'Payment Failed',
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
                text: 'Try Again',
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showTimeoutDialog() {
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
                'Payment Pending',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: AppTheme.spaceSm),
              Text(
                'The payment is still pending. Please check your phone and approve the MTN MoMo payment request.\n\nIf you\'ve already approved, it may take a moment to process.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppTheme.spaceLg),
              PrimaryButton(
                text: 'OK',
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
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Make a Donation'),
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
                            'Donating to',
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
                'Quick amounts (${AppConstants.defaultCurrency})',
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: AppTheme.spaceSm),
              QuickAmountChips(
                amounts: AppConstants.quickDonationAmounts,
                selectedAmount: _selectedQuickAmount,
                onSelected: _onQuickAmountSelected,
                currencySymbol: '',
              ),

              const SizedBox(height: AppTheme.spaceLg),

              // Custom amount
              CustomInputField(
                controller: _amountController,
                label: 'Amount (${AppConstants.defaultCurrency})',
                hint: 'Enter amount',
                prefixIcon: Icons.monetization_on_outlined,
                keyboardType: TextInputType.number,
                validator: (value) => Validators.validateAmount(
                  value,
                  min: AppConstants.minDonationAmount,
                  minMessage: 'Minimum donation is ${AppConstants.minDonationAmount.toStringAsFixed(0)} ${AppConstants.defaultCurrency}',
                ),
                onChanged: _onAmountChanged,
              ),

              const SizedBox(height: AppTheme.spaceMd),

              // Phone number
              PhoneInputField(
                controller: _phoneController,
                label: 'MTN MoMo Phone Number',
                hint: 'e.g., +237670000001',
                validator: Validators.validatePhone,
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
                        'A payment request will be sent to this MTN MoMo number',
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
                label: 'Message (Optional)',
                hint: 'Write a message of support...',
                prefixIcon: Icons.message_outlined,
                maxLines: 3,
                maxLength: AppConstants.maxMessageLength,
                textCapitalization: TextCapitalization.sentences,
              ),

              const SizedBox(height: AppTheme.spaceLg),

              // Submit button
              PrimaryButton(
                text: 'Donate via MTN MoMo',
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
