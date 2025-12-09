import 'package:flutter/material.dart';
import '../models/cause.dart';
import '../services/api_service.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../utils/formatters.dart';
import '../widgets/widgets.dart';
import 'cause_detail_screen.dart';
import 'create_cause_screen.dart';

/// Screen displaying list of all causes
class CausesListScreen extends StatefulWidget {
  const CausesListScreen({super.key});

  @override
  State<CausesListScreen> createState() => _CausesListScreenState();
}

class _CausesListScreenState extends State<CausesListScreen> {
  final ApiService _apiService = ApiService();
  final ScrollController _scrollController = ScrollController();

  List<Cause> _causes = [];
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadCauses();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _apiService.dispose();
    super.dispose();
  }

  Future<void> _loadCauses() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final causes = await _apiService.fetchCauses();
      setState(() {
        _causes = causes;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  void _navigateToCause(Cause cause) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CauseDetailScreen(causeId: cause.id),
      ),
    );
  }

  Future<void> _createCause() async {
    final result = await Navigator.of(context).push<Cause>(
      MaterialPageRoute(
        builder: (context) => const CreateCauseScreen(),
      ),
    );

    if (result != null) {
      _loadCauses();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _loadCauses,
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              // Header
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(AppTheme.spaceMd),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Discover Causes',
                                  style: theme.textTheme.headlineMedium?.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: AppTheme.spaceXs),
                                Text(
                                  'Support causes that matter',
                                  style: theme.textTheme.bodyLarge?.copyWith(
                                    color: theme.colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton.filled(
                            onPressed: _createCause,
                            icon: const Icon(Icons.add),
                            style: IconButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              foregroundColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Content
              if (_isLoading)
                const SliverFillRemaining(
                  child: LoadingState(message: 'Loading causes...'),
                )
              else if (_error != null)
                SliverFillRemaining(
                  child: EmptyState.error(
                    description: _error,
                    onAction: _loadCauses,
                  ),
                )
              else if (_causes.isEmpty)
                SliverFillRemaining(
                  child: EmptyState.noCauses(
                    title: 'No causes yet',
                    description: 'Be the first to create a cause!',
                    actionText: 'Create Cause',
                    onAction: _createCause,
                  ),
                )
              else
                SliverPadding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppTheme.spaceMd,
                  ),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final cause = _causes[index];
                        return Padding(
                          padding: const EdgeInsets.only(
                            bottom: AppTheme.spaceMd,
                          ),
                          child: _CauseListItem(
                            cause: cause,
                            onTap: () => _navigateToCause(cause),
                          ),
                        );
                      },
                      childCount: _causes.length,
                    ),
                  ),
                ),

              // Bottom padding
              const SliverToBoxAdapter(
                child: SizedBox(height: AppTheme.spaceXxl),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Simple cause list item widget
class _CauseListItem extends StatelessWidget {
  final Cause cause;
  final VoidCallback? onTap;

  const _CauseListItem({
    required this.cause,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: AppTheme.elevationSm,
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(AppTheme.spaceMd),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header row
              Row(
                children: [
                  // Icon
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
                  // Title and owner
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cause.name,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'by ${Formatters.maskPhone(cause.ownerPhone)}',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.chevron_right),
                ],
              ),

              // Description
              if (cause.description != null && cause.description!.isNotEmpty) ...[
                const SizedBox(height: AppTheme.spaceSm),
                Text(
                  cause.description!,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],

              const SizedBox(height: AppTheme.spaceSm),

              // Date
              Row(
                children: [
                  Icon(
                    Icons.access_time,
                    size: 14,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: AppTheme.spaceXs),
                  Text(
                    'Created ${Formatters.formatRelativeTime(cause.createdAt)}',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
