import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../l10n/generated/app_localizations.dart';
import '../models/cause.dart';
import '../services/api_service.dart';
import '../services/auth_service.dart';
import '../services/settings_provider.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../utils/formatters.dart';
import '../utils/network_helper.dart';
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
  bool _isNoInternet = false;

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
      _isNoInternet = false;
    });

    try {
      final causes = await _apiService.fetchCauses();
      setState(() {
        _causes = causes;
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

  void _showLanguageDialog() {
    final l10n = AppLocalizations.of(context)!;
    final settingsProvider = context.read<SettingsProvider>();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.settingsChooseLanguage),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text(l10n.settingsLanguageEn),
              leading: const Icon(Icons.language),
              selected: settingsProvider.locale.languageCode == 'en',
              trailing: settingsProvider.locale.languageCode == 'en'
                  ? const Icon(Icons.check, color: AppColors.primary)
                  : null,
              onTap: () {
                settingsProvider.setLocale(const Locale('en'));
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(l10n.settingsLanguageAr),
              leading: const Icon(Icons.language),
              selected: settingsProvider.locale.languageCode == 'ar',
              trailing: settingsProvider.locale.languageCode == 'ar'
                  ? const Icon(Icons.check, color: AppColors.primary)
                  : null,
              onTap: () {
                settingsProvider.setLocale(const Locale('ar'));
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showThemeDialog() {
    final l10n = AppLocalizations.of(context)!;
    final settingsProvider = context.read<SettingsProvider>();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.settingsChooseTheme),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text(l10n.settingsThemeLight),
              leading: const Icon(Icons.light_mode),
              selected: settingsProvider.themeMode == ThemeMode.light,
              trailing: settingsProvider.themeMode == ThemeMode.light
                  ? const Icon(Icons.check, color: AppColors.primary)
                  : null,
              onTap: () {
                settingsProvider.setThemeMode(ThemeMode.light);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(l10n.settingsThemeDark),
              leading: const Icon(Icons.dark_mode),
              selected: settingsProvider.themeMode == ThemeMode.dark,
              trailing: settingsProvider.themeMode == ThemeMode.dark
                  ? const Icon(Icons.check, color: AppColors.primary)
                  : null,
              onTap: () {
                settingsProvider.setThemeMode(ThemeMode.dark);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(l10n.settingsThemeSystem),
              leading: const Icon(Icons.settings_suggest),
              selected: settingsProvider.themeMode == ThemeMode.system,
              trailing: settingsProvider.themeMode == ThemeMode.system
                  ? const Icon(Icons.check, color: AppColors.primary)
                  : null,
              onTap: () {
                settingsProvider.setThemeMode(ThemeMode.system);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final authService = context.watch<AuthService>();
    final currentUser = authService.currentUser;

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
                      // User greeting (if logged in)
                      if (currentUser != null && currentUser.name != null && currentUser.name!.isNotEmpty) ...[
                        Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: AppColors.primary.withValues(alpha: 0.1),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.person,
                                color: AppColors.primary,
                                size: 20,
                              ),
                            ),
                            const SizedBox(width: AppTheme.spaceSm),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${l10n.commonWelcome}, ${currentUser.name}!',
                                    style: theme.textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                  Text(
                                    l10n.homeSubtitle,
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: theme.colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppTheme.spaceMd),
                      ],

                      // Title
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  currentUser != null && currentUser.name != null && currentUser.name!.isNotEmpty
                                      ? l10n.homeTitle
                                      : l10n.homeTitle,
                                  style: theme.textTheme.headlineMedium?.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                if (currentUser == null || currentUser.name == null || currentUser.name!.isEmpty) ...[
                                  const SizedBox(height: AppTheme.spaceXs),
                                  Text(
                                    l10n.homeSubtitle,
                                    style: theme.textTheme.bodyLarge?.copyWith(
                                      color: theme.colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: _showLanguageDialog,
                                icon: const Icon(Icons.language),
                                tooltip: l10n.settingsLanguage,
                              ),
                              IconButton(
                                onPressed: _showThemeDialog,
                                icon: Icon(
                                  theme.brightness == Brightness.dark
                                      ? Icons.light_mode
                                      : Icons.dark_mode,
                                ),
                                tooltip: l10n.settingsTheme,
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
                    ],
                  ),
                ),
              ),

              // App Banner
              const SliverToBoxAdapter(
                child: SizedBox(height: AppTheme.spaceMd),
              ),
              const SliverToBoxAdapter(
                child: AppBanner(),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: AppTheme.spaceLg),
              ),

              // Content
              if (_isLoading)
                SliverFillRemaining(
                  child: LoadingState(message: l10n.homeLoading),
                )
              // COMMENTED OUT: No internet screen disabled
              // else if (_isNoInternet)
              //   SliverFillRemaining(
              //     child: NoInternetScreen(onRetry: _loadCauses),
              //   )
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
                    title: l10n.homeNoCausesYet,
                    description: l10n.homeNoCausesYetDesc,
                    actionText: l10n.homeCreateCause,
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
    final l10n = AppLocalizations.of(context)!;

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
                          '${l10n.causeBy} ${Formatters.maskPhone(cause.ownerPhone)}',
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
                    '${l10n.commonCreated} ${Formatters.formatRelativeTime(cause.createdAt)}',
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
