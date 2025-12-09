import 'package:flutter/material.dart';
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

  @override
  void dispose() {
    _phoneController.dispose();
    _scrollController.dispose();
    _apiService.dispose();
    super.dispose();
  }

  Future<void> _searchHistory() async {
    final validation = Validators.validatePhone(_phoneController.text);
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
    });

    try {
      final donations =
          await _apiService.fetchDonorHistory(_phoneController.text.trim());

      setState(() {
        _donations = donations;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Donation History'),
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
                  'Enter your phone number to view your donation history',
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
                        hint: 'e.g., +237670000001',
                      ),
                    ),
                    const SizedBox(width: AppTheme.spaceMd),
                    PrimaryButton(
                      text: 'Search',
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
            child: _buildContent(theme),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(ThemeData theme) {
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
              'View your donation history',
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: AppTheme.spaceSm),
            Text(
              'Enter your phone number above to get started',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      );
    }

    if (_isLoading) {
      return const LoadingState(message: 'Loading history...');
    }

    if (_error != null) {
      return EmptyState.error(
        description: _error,
        onAction: _searchHistory,
      );
    }

    if (_donations.isEmpty) {
      return EmptyState.noDonations(
        title: 'No donations found',
        description: 'You haven\'t made any donations yet. Start giving today!',
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
                            'Total Donated',
                            style: theme.textTheme.labelMedium?.copyWith(
                              color: Colors.white.withValues(alpha: 0.8),
                            ),
                          ),
                          const SizedBox(height: AppTheme.spaceXs),
                          Text(
                            '${_totalDonated.toStringAsFixed(0)} XAF',
                            style: theme.textTheme.headlineMedium?.copyWith(
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
                        '${_donations.length} donations',
                        style: theme.textTheme.labelLarge?.copyWith(
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
                        donation.cause?.name ?? 'Unknown Cause',
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
                        _getStatusText(donation.status),
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

  String _getStatusText(DonationStatus status) {
    switch (status) {
      case DonationStatus.success:
        return 'Success';
      case DonationStatus.pending:
        return 'Pending';
      case DonationStatus.failed:
        return 'Failed';
    }
  }
}
