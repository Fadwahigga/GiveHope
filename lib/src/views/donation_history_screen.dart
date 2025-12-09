import 'package:flutter/material.dart';
import '../l10n/generated/app_localizations.dart';
import '../models/donation.dart';
import '../services/api_service.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../utils/formatters.dart';
import '../utils/validators.dart';
import '../widgets/widgets.dart';

/// Screen displaying donation history for a donor
class DonationHistoryScreen extends StatefulWidget {
  const DonationHistoryScreen({super.key});

  @override
  State<DonationHistoryScreen> createState() => _DonationHistoryScreenState();
}

class _DonationHistoryScreenState extends State<DonationHistoryScreen> {
  final ApiService _apiService = ApiService();
  final TextEditingController _phoneController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  List<Donation> _donations = [];
  bool _isLoading = false;
  bool _hasSearched = false;
  String? _error;
  bool _isNoInternet = false;

  @override
  void dispose() {
    _phoneController.dispose();
    _scrollController.dispose();
    _apiService.dispose();
    super.dispose();
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

  Future<void> _searchHistory() async {
    final l10n = AppLocalizations.of(context)!;
    final validation = Validators.validatePhone(
      _phoneController.text,
      emptyMessage: l10n.validationPhoneRequired,
      invalidMessage: l10n.validationPhoneInvalid,
    );
    if (validation != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(validation)),
      );
      return;
    }

    setState(() {
      _isLoading = true;
      _error = null;
      _hasSearched = true;
      _isNoInternet = false;
    });

    try {
      final donations =
          await _apiService.fetchDonorHistory(_phoneController.text.trim());

      setState(() {
        _donations = donations;
        _isLoading = false;
        _isNoInternet = false;
      });
    } catch (e) {
      final l10n = AppLocalizations.of(context)!;
      setState(() {
        _error = _getErrorMessage(e, l10n);
        _isLoading = false;
        _isNoInternet = false; // Always false - no internet check
      });
    }
  }

  double get _totalDonated {
    double total = 0;
    for (final donation in _donations) {
      if (donation.status == DonationStatus.success) {
        total += donation.amountValue;
      }
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.historyTitle),
      ),
      body: Column(
        children: [
          // Search section
          Container(
            padding: const EdgeInsets.all(AppTheme.spaceMd),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.historyEnterPhone,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: AppTheme.spaceMd),
                Row(
                  children: [
                    Expanded(
                      child: PhoneInputField(
                        controller: _phoneController,
                        hint: l10n.historyPhoneHint,
                      ),
                    ),
                    const SizedBox(width: AppTheme.spaceMd),
                    PrimaryButton(
                      text: l10n.historySearch,
                      isFullWidth: false,
                      isLoading: _isLoading,
                      onPressed: _searchHistory,
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Results
          Expanded(
            child: _buildContent(theme, l10n),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(ThemeData theme, AppLocalizations l10n) {
    if (!_hasSearched) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.history,
              size: 64,
              color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
            ),
            const SizedBox(height: AppTheme.spaceMd),
            Text(
              l10n.historyGetStarted,
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: AppTheme.spaceSm),
            Text(
              l10n.historyGetStartedDesc,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      );
    }

    if (_isLoading) {
      return LoadingState(message: l10n.historyLoading);
    }

    // COMMENTED OUT: No internet screen disabled
    // if (_isNoInternet) {
    //   return NoInternetScreen(onRetry: _searchHistory);
    // }

    if (_error != null) {
      return EmptyState.error(
        description: _error,
        onAction: _searchHistory,
      );
    }

    if (_donations.isEmpty) {
      return EmptyState.noDonations(
        title: l10n.historyNoResults,
        description: l10n.historyNoResultsDesc,
      );
    }

    return RefreshIndicator(
      onRefresh: _searchHistory,
      child: CustomScrollView(
        controller: _scrollController,
        slivers: [
          // Summary card
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(AppTheme.spaceMd),
              child: Container(
                padding: const EdgeInsets.all(AppTheme.spaceMd),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: AppColors.progressGradient,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n.historyTotal,
                            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                              color: Colors.white.withValues(alpha: 0.8),
                            ),
                          ),
                          const SizedBox(height: AppTheme.spaceXs),
                          Text(
                            '${_totalDonated.toStringAsFixed(0)} XAF',
                            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppTheme.spaceMd,
                        vertical: AppTheme.spaceSm,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius:
                            BorderRadius.circular(AppTheme.radiusRound),
                      ),
                      child: Text(
                        l10n.historyCount(_donations.length),
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Donations list
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: AppTheme.spaceMd),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final donation = _donations[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: AppTheme.spaceMd),
                    child: _DonationHistoryItem(donation: donation),
                  );
                },
                childCount: _donations.length,
              ),
            ),
          ),

          // Bottom padding
          const SliverToBoxAdapter(
            child: SizedBox(height: AppTheme.spaceXxl),
          ),
        ],
      ),
    );
  }
}

class _DonationHistoryItem extends StatelessWidget {
  final Donation donation;

  const _DonationHistoryItem({required this.donation});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final statusColor = _getStatusColor(donation.status);

    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spaceMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header row
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.volunteer_activism,
                    color: AppColors.primary,
                    size: 20,
                  ),
                ),
                const SizedBox(width: AppTheme.spaceMd),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        donation.cause?.name ?? l10n.commonError,
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        Formatters.formatDate(donation.createdAt),
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${donation.amount} ${donation.currency}',
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppTheme.spaceSm,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: statusColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(AppTheme.radiusRound),
                      ),
                      child: Text(
                        _getStatusText(donation.status, l10n),
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: statusColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            // Message
            if (donation.payerMessage != null && donation.payerMessage!.isNotEmpty) ...[
              const SizedBox(height: AppTheme.spaceSm),
              Text(
                '"${donation.payerMessage}"',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                  fontStyle: FontStyle.italic,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(DonationStatus status) {
    switch (status) {
      case DonationStatus.success:
        return AppColors.success;
      case DonationStatus.pending:
        return AppColors.warning;
      case DonationStatus.failed:
        return AppColors.error;
    }
  }

  String _getStatusText(DonationStatus status, AppLocalizations l10n) {
    switch (status) {
      case DonationStatus.success:
        return l10n.historyStatusSuccess;
      case DonationStatus.pending:
        return l10n.historyStatusPending;
      case DonationStatus.failed:
        return l10n.historyStatusFailed;
    }
  }
}
