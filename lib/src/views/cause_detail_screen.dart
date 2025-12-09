import 'package:flutter/material.dart';
import '../l10n/generated/app_localizations.dart';
import '../models/models.dart';
import '../services/api_service.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../utils/formatters.dart';
import '../utils/network_helper.dart';
import '../widgets/widgets.dart';
import 'donation_screen.dart';
import 'payout_screen.dart';

/// Screen displaying detailed information about a cause
class CauseDetailScreen extends StatefulWidget {
  final String causeId;

  const CauseDetailScreen({
    super.key,
    required this.causeId,
  });

  @override
  State<CauseDetailScreen> createState() => _CauseDetailScreenState();
}

class _CauseDetailScreenState extends State<CauseDetailScreen> {
  final ApiService _apiService = ApiService();

  Cause? _cause;
  CauseSummary? _summary;
  List<Donation> _recentDonations = [];
  bool _isLoading = true;
  String? _error;
  bool _isNoInternet = false;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void dispose() {
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
      final cause = await _apiService.getCauseById(widget.causeId);
      
      // Load summary and donations in parallel
      CauseSummary? summary;
      try {
        summary = await _apiService.getPayoutSummary(widget.causeId);
      } catch (_) {
        // Summary may not be available
      }
      
      final donations = await _apiService.fetchDonationsByCause(widget.causeId);

      setState(() {
        _cause = cause;
        _summary = summary;
        _recentDonations = donations;
        _isLoading = false;
        _isNoInternet = false;
      });
    } catch (e) {
      // COMMENTED OUT: Internet connection check disabled
      // final isNoInternet = NetworkHelper.isNoInternetError(e);
      setState(() {
        _error = NetworkHelper.getErrorMessage(e);
        _isLoading = false;
        _isNoInternet = false; // Always false - no internet check
      });
    }
  }

  void _navigateToDonate() {
    if (_cause == null) return;

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DonationScreen(cause: _cause!),
      ),
    ).then((_) => _loadData());
  }

  void _navigateToPayouts() {
    if (_cause == null) return;

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PayoutScreen(
          causeId: _cause!.id,
          causeName: _cause!.name,
        ),
      ),
    ).then((_) => _loadData());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final mediaQuery = MediaQuery.of(context);

    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(),
        body: LoadingState(message: l10n.causeLoading),
      );
    }

    // COMMENTED OUT: No internet screen disabled
    // if (_isNoInternet) {
    //   return Scaffold(
    //     appBar: AppBar(),
    //     body: NoInternetScreen(onRetry: _loadData),
    //   );
    // }

    if (_error != null) {
      return Scaffold(
        appBar: AppBar(),
        body: EmptyState.error(
          description: _error,
          onAction: _loadData,
        ),
      );
    }

    if (_cause == null) {
      return Scaffold(
        appBar: AppBar(),
        body: EmptyState(
          icon: Icons.search_off,
          title: l10n.causeNotFound,
          description: l10n.causeNotFoundDesc,
          actionText: l10n.causeGoBack,
          onAction: () => Navigator.of(context).pop(),
        ),
      );
    }

    final cause = _cause!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.causeDetailTitle),
        actions: [
          // Payout management button (for cause owner)
          IconButton(
            icon: const Icon(Icons.account_balance_wallet_outlined),
            onPressed: _navigateToPayouts,
            tooltip: l10n.causeManagePayouts,
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _loadData,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppTheme.spaceMd),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header card
              Container(
                padding: const EdgeInsets.all(AppTheme.spaceMd),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: AppColors.featuredGradient,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(AppTheme.radiusSm),
                          ),
                          child: const Icon(
                            Icons.volunteer_activism,
                            color: Colors.white,
                            size: 32,
                          ),
                        ),
                        const SizedBox(width: AppTheme.spaceMd),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cause.name,
                                style: theme.textTheme.titleLarge?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: AppTheme.spaceXs),
                              Text(
                                '${l10n.causeBy} ${Formatters.maskPhone(cause.ownerPhone)}',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: Colors.white.withValues(alpha: 0.8),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: AppTheme.spaceLg),

              // Summary stats
              if (_summary != null) ...[
                Row(
                  children: [
                    Expanded(
                      child: _StatCard(
                        label: l10n.causeTotalReceived,
                        value: '${_summary!.totalDonations.toStringAsFixed(0)} ${_summary!.currency}',
                        icon: Icons.arrow_downward,
                        color: AppColors.success,
                      ),
                    ),
                    const SizedBox(width: AppTheme.spaceMd),
                    Expanded(
                      child: _StatCard(
                        label: l10n.causeAvailable,
                        value: '${_summary!.availableBalance.toStringAsFixed(0)} ${_summary!.currency}',
                        icon: Icons.account_balance_wallet,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppTheme.spaceLg),
              ],

              // Description
              if (cause.description != null && cause.description!.isNotEmpty) ...[
                Text(
                  l10n.causeAbout,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: AppTheme.spaceSm),
                Text(
                  cause.description!,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: AppTheme.spaceLg),
              ],

              // Recent donations
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    l10n.causeRecentDonations,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '${_recentDonations.length} ${l10n.commonDonations}',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: AppTheme.spaceSm),

              if (_recentDonations.isEmpty)
                Container(
                  padding: const EdgeInsets.all(AppTheme.spaceLg),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.volunteer_activism_outlined,
                        size: 48,
                        color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
                      ),
                      const SizedBox(height: AppTheme.spaceSm),
                      Text(
                        l10n.causeNoDonations,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      Text(
                        l10n.causeBeFirst,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                )
              else
                ...List.generate(
                  _recentDonations.length > 5 ? 5 : _recentDonations.length,
                  (index) {
                    final donation = _recentDonations[index];
                    return _DonationItem(donation: donation);
                  },
                ),

              // Bottom padding for the button
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),

      // Donate button
      bottomSheet: Container(
        padding: EdgeInsets.only(
          left: AppTheme.spaceMd,
          right: AppTheme.spaceMd,
          top: AppTheme.spaceMd,
          bottom: mediaQuery.padding.bottom + AppTheme.spaceMd,
        ),
        decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: PrimaryButton(
          text: l10n.donateTitle,
          icon: Icons.favorite,
          onPressed: _navigateToDonate,
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  const _StatCard({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
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
                label,
                style: theme.textTheme.labelMedium?.copyWith(
                  color: color,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppTheme.spaceSm),
          Text(
            value,
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

class _DonationItem extends StatelessWidget {
  final Donation donation;

  const _DonationItem({required this.donation});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final statusColor = _getStatusColor(donation.status);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppTheme.spaceSm),
      child: Row(
        children: [
          // Avatar
          CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.primary.withValues(alpha: 0.1),
            child: Icon(
              Icons.person_outline,
              color: AppColors.primary,
              size: 20,
            ),
          ),
          const SizedBox(width: AppTheme.spaceMd),
          // Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      donation.donorPhone,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '${donation.amount} ${donation.currency}',
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Formatters.formatRelativeTime(donation.createdAt),
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
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
          ),
        ],
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
