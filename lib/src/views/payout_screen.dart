import 'package:flutter/material.dart';
import '../l10n/generated/app_localizations.dart';
import '../models/models.dart';
import '../services/api_service.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../utils/constants.dart';
import '../utils/formatters.dart';
import '../utils/network_helper.dart';
import '../utils/validators.dart';
import '../widgets/widgets.dart';

/// Screen for cause owners to manage payouts
class PayoutScreen extends StatefulWidget {
  final String causeId;
  final String causeName;

  const PayoutScreen({
    super.key,
    required this.causeId,
    required this.causeName,
  });

  @override
  State<PayoutScreen> createState() => _PayoutScreenState();
}

class _PayoutScreenState extends State<PayoutScreen> {
  final ApiService _apiService = ApiService();
  final TextEditingController _amountController = TextEditingController();

  CauseSummary? _summary;
  List<Payout> _payouts = [];
  bool _isLoading = true;
  bool _isSubmitting = false;
  String? _error;
  bool _isNoInternet = false;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void dispose() {
    _amountController.dispose();
    _apiService.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    setState(() {
      _isLoading = true;
      _error = null;
      _isNoInternet = false;
    });

    try {
      final results = await Future.wait([
        _apiService.getPayoutSummary(widget.causeId),
        _apiService.fetchPayoutsByCause(widget.causeId),
      ]);

      setState(() {
        _summary = results[0] as CauseSummary;
        _payouts = results[1] as List<Payout>;
        _isLoading = false;
        _isNoInternet = false;
      });
    } catch (e) {
      final isNoInternet = NetworkHelper.isNoInternetError(e);
      setState(() {
        _error = NetworkHelper.getErrorMessage(e);
        _isLoading = false;
        _isNoInternet = isNoInternet;
      });
    }
  }

  void _showRequestPayoutDialog() {
    _amountController.clear();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _PayoutRequestBottomSheet(
        summary: _summary!,
        amountController: _amountController,
        isSubmitting: _isSubmitting,
        onSubmit: _submitPayoutRequest,
      ),
    );
  }

  Future<void> _submitPayoutRequest() async {
    final l10n = AppLocalizations.of(context)!;
    final amountStr = _amountController.text.trim();
    final amount = double.tryParse(amountStr);
    
    if (amount == null || amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.payoutAmountError)),
      );
      return;
    }

    if (_summary != null && amount > _summary!.availableBalance) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.payoutAmountMax('${_summary!.availableBalance.toStringAsFixed(0)} ${_summary!.currency}')),
        ),
      );
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    try {
      final request = PayoutRequest(
        causeId: widget.causeId,
        amount: amountStr,
        currency: _summary?.currency ?? AppConstants.defaultCurrency,
      );

      final response = await _apiService.requestPayout(request);

      if (mounted) {
        Navigator.of(context).pop(); // Close bottom sheet
        
        if (response.transferInitiated) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(l10n.payoutSuccessDesc),
              backgroundColor: AppColors.success,
            ),
          );
          _loadData(); // Refresh data
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(response.transferError ?? l10n.payoutFailedDesc),
              backgroundColor: AppColors.error,
            ),
          );
        }
      }
    } on ApiException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.message),
            backgroundColor: AppColors.error,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.payoutFailedDesc),
            backgroundColor: AppColors.error,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(title: Text(l10n.payoutTitle)),
        body: LoadingState(message: l10n.payoutLoading),
      );
    }

    if (_error != null) {
      return Scaffold(
        appBar: AppBar(title: Text(l10n.payoutTitle)),
        body: EmptyState.error(
          description: _error,
          onAction: _loadData,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.payoutTitle),
      ),
      body: RefreshIndicator(
        onRefresh: _loadData,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppTheme.spaceMd),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Cause name
              Text(
                widget.causeName,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: AppTheme.spaceMd),

              // Balance cards
              if (_summary != null) ...[
                Row(
                  children: [
                    Expanded(
                      child: _BalanceCard(
                        title: l10n.causeTotalReceived,
                        amount: _summary!.totalDonations,
                        currency: _summary!.currency,
                        color: AppColors.success,
                        icon: Icons.arrow_downward,
                      ),
                    ),
                    const SizedBox(width: AppTheme.spaceMd),
                    Expanded(
                      child: _BalanceCard(
                        title: l10n.causeAvailable,
                        amount: _summary!.availableBalance,
                        currency: _summary!.currency,
                        color: AppColors.primary,
                        icon: Icons.account_balance_wallet,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: AppTheme.spaceLg),

                // Request payout button
                if (_summary!.availableBalance > 0)
                  PrimaryButton(
                    text: l10n.payoutRequest,
                    icon: Icons.payments_outlined,
                    onPressed: _showRequestPayoutDialog,
                  )
                else
                  Container(
                    padding: const EdgeInsets.all(AppTheme.spaceMd),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: theme.colorScheme.onSurfaceVariant,
                          size: 20,
                        ),
                        const SizedBox(width: AppTheme.spaceSm),
                        Expanded(
                          child: Text(
                            l10n.payoutNoFunds,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],

              const SizedBox(height: AppTheme.spaceLg),

              // Payout history
              Text(
                l10n.payoutHistory,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: AppTheme.spaceSm),

              if (_payouts.isEmpty)
                Container(
                  padding: const EdgeInsets.all(AppTheme.spaceLg),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Icon(
                          Icons.payments_outlined,
                          size: 48,
                          color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
                        ),
                        const SizedBox(height: AppTheme.spaceSm),
                        Text(
                          l10n.payoutNoHistory,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              else
                ...List.generate(
                  _payouts.length,
                  (index) {
                    final payout = _payouts[index];
                    return _PayoutListItem(payout: payout);
                  },
                ),

              const SizedBox(height: AppTheme.spaceXxl),
            ],
          ),
        ),
      ),
    );
  }
}

class _BalanceCard extends StatelessWidget {
  final String title;
  final double amount;
  final String currency;
  final Color color;
  final IconData icon;

  const _BalanceCard({
    required this.title,
    required this.amount,
    required this.currency,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(AppTheme.spaceMd),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 16),
              const SizedBox(width: AppTheme.spaceXs),
              Text(
                title,
                style: theme.textTheme.labelMedium?.copyWith(
                  color: color,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppTheme.spaceSm),
          Text(
            '${amount.toStringAsFixed(0)} $currency',
            style: theme.textTheme.titleMedium?.copyWith(
              color: color,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _PayoutListItem extends StatelessWidget {
  final Payout payout;

  const _PayoutListItem({required this.payout});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final statusColor = _getStatusColor(payout.status);

    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: AppTheme.spaceSm),
      color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spaceMd),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: statusColor.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.payments_outlined,
                color: statusColor,
                size: 20,
              ),
            ),
            const SizedBox(width: AppTheme.spaceMd),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${payout.amount} ${payout.currency}',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    Formatters.formatDate(payout.createdAt),
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppTheme.spaceSm,
                vertical: AppTheme.spaceXs,
              ),
              decoration: BoxDecoration(
                color: statusColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppTheme.radiusRound),
              ),
              child: Text(
                _getStatusText(payout.status, l10n),
                style: theme.textTheme.labelSmall?.copyWith(
                  color: statusColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(PayoutStatus status) {
    switch (status) {
      case PayoutStatus.completed:
        return AppColors.success;
      case PayoutStatus.pending:
        return AppColors.warning;
      case PayoutStatus.failed:
        return AppColors.error;
    }
  }

  String _getStatusText(PayoutStatus status, AppLocalizations l10n) {
    switch (status) {
      case PayoutStatus.completed:
        return l10n.payoutStatusCompleted;
      case PayoutStatus.pending:
        return l10n.payoutStatusPending;
      case PayoutStatus.failed:
        return l10n.payoutStatusFailed;
    }
  }
}

class _PayoutRequestBottomSheet extends StatelessWidget {
  final CauseSummary summary;
  final TextEditingController amountController;
  final bool isSubmitting;
  final VoidCallback onSubmit;

  const _PayoutRequestBottomSheet({
    required this.summary,
    required this.amountController,
    required this.isSubmitting,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final mediaQuery = MediaQuery.of(context);

    return Container(
      padding: EdgeInsets.only(
        left: AppTheme.spaceMd,
        right: AppTheme.spaceMd,
        top: AppTheme.spaceMd,
        bottom: mediaQuery.viewInsets.bottom + AppTheme.spaceMd,
      ),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(AppTheme.radiusLg),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Handle
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),

            const SizedBox(height: AppTheme.spaceMd),

            // Title
            Text(
              l10n.payoutRequest,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: AppTheme.spaceSm),

            Text(
              l10n.payoutAmountMax('${summary.availableBalance.toStringAsFixed(0)} ${summary.currency}'),
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),

            const SizedBox(height: AppTheme.spaceMd),

            // Amount field
            CustomInputField(
              controller: amountController,
              label: '${l10n.payoutAmount} (${summary.currency})',
              hint: l10n.payoutAmountHint,
              prefixIcon: Icons.monetization_on_outlined,
              keyboardType: TextInputType.number,
              validator: (value) => Validators.validateAmount(
                value,
                max: summary.availableBalance,
                maxMessage: l10n.payoutAmountError,
              ),
            ),

            const SizedBox(height: AppTheme.spaceSm),

            // Info
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
                      l10n.payoutMoMoInfo(summary.cause.ownerPhone),
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: AppColors.info,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppTheme.spaceLg),

            // Submit button
            PrimaryButton(
              text: l10n.payoutSubmit,
              isLoading: isSubmitting,
              onPressed: onSubmit,
            ),

            SizedBox(height: mediaQuery.padding.bottom),
          ],
        ),
      ),
    );
  }
}
