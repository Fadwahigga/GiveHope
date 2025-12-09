import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../l10n/generated/app_localizations.dart';
import '../services/auth_service.dart';
import '../services/settings_provider.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../utils/constants.dart';
import 'login_screen.dart';

/// Settings screen for app preferences
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final settingsProvider = context.watch<SettingsProvider>();
    final authService = context.watch<AuthService>();
    final isLoggedIn = authService.isAuthenticated;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settingsTitle),
      ),
      body: ListView(
        children: [
          // Appearance section
          _SectionHeader(title: l10n.settingsAppearance),

          // Theme setting
          _SettingsTile(
            icon: Icons.palette_outlined,
            title: l10n.settingsTheme,
            subtitle: _getThemeName(settingsProvider.themeMode, l10n),
            onTap: () => _showThemeDialog(context, settingsProvider, l10n),
          ),

          // Language setting
          _SettingsTile(
            icon: Icons.language,
            title: l10n.settingsLanguage,
            subtitle: _getLanguageName(settingsProvider.locale, l10n),
            onTap: () => _showLanguageDialog(context, settingsProvider, l10n),
          ),

          const Divider(height: 32),

          // About section
          _SectionHeader(title: l10n.settingsAbout),

          _SettingsTile(
            icon: Icons.info_outline,
            title: l10n.settingsAboutTitle,
            subtitle: l10n.settingsAboutDesc,
            onTap: () => _showAboutDialog(context, l10n),
          ),

          _SettingsTile(
            icon: Icons.privacy_tip_outlined,
            title: l10n.settingsPrivacy,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(l10n.settingsPrivacyComingSoon)),
              );
            },
          ),

          _SettingsTile(
            icon: Icons.description_outlined,
            title: l10n.settingsTerms,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(l10n.settingsTermsComingSoon)),
              );
            },
          ),

          const Divider(height: 32),

          // Support section
          _SectionHeader(title: l10n.settingsContact),

          _SettingsTile(
            icon: Icons.help_outline,
            title: l10n.settingsContact,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(l10n.settingsHelpComingSoon)),
              );
            },
          ),

          _SettingsTile(
            icon: Icons.email_outlined,
            title: l10n.settingsContact,
            subtitle: 'support@givehope.example.com',
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(l10n.settingsContactComingSoon)),
              );
            },
          ),

          _SettingsTile(
            icon: Icons.star_outline,
            title: l10n.settingsRate,
            subtitle: l10n.settingsAboutDesc,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(l10n.settingsRateComingSoon)),
              );
            },
          ),

          const Divider(height: 32),

          // Account section (only if logged in)
          if (isLoggedIn) ...[
            _SectionHeader(title: l10n.settingsProfile),
            _SettingsTile(
              icon: Icons.logout,
              title: l10n.settingsLogout,
              titleColor: AppColors.error,
              onTap: () => _showLogoutDialog(context, l10n),
            ),
            const SizedBox(height: AppTheme.spaceLg),
          ],

          const SizedBox(height: AppTheme.spaceLg),

          // Version info
          Builder(
            builder: (context) {
              final theme = Theme.of(context);
              return Center(
                child: Column(
                  children: [
                    Text(
                      l10n.appName,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: AppTheme.spaceXs),
                    Text(
                      l10n.settingsVersion(AppConstants.appVersion),
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),

          const SizedBox(height: AppTheme.spaceXxl),
        ],
      ),
    );
  }

  String _getThemeName(ThemeMode mode, AppLocalizations l10n) {
    switch (mode) {
      case ThemeMode.light:
        return l10n.settingsThemeLight;
      case ThemeMode.dark:
        return l10n.settingsThemeDark;
      case ThemeMode.system:
        return l10n.settingsThemeSystem;
    }
  }

  String _getLanguageName(Locale locale, AppLocalizations l10n) {
    switch (locale.languageCode) {
      case 'ar':
        return l10n.settingsLanguageAr;
      case 'en':
      default:
        return l10n.settingsLanguageEn;
    }
  }

  void _showThemeDialog(BuildContext context, SettingsProvider provider, AppLocalizations l10n) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.settingsChooseTheme),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _ThemeOption(
              title: l10n.settingsThemeLight,
              icon: Icons.light_mode,
              isSelected: provider.themeMode == ThemeMode.light,
              onTap: () {
                provider.setThemeMode(ThemeMode.light);
                Navigator.pop(context);
              },
            ),
            _ThemeOption(
              title: l10n.settingsThemeDark,
              icon: Icons.dark_mode,
              isSelected: provider.themeMode == ThemeMode.dark,
              onTap: () {
                provider.setThemeMode(ThemeMode.dark);
                Navigator.pop(context);
              },
            ),
            _ThemeOption(
              title: l10n.settingsThemeSystem,
              icon: Icons.settings_suggest,
              isSelected: provider.themeMode == ThemeMode.system,
              onTap: () {
                provider.setThemeMode(ThemeMode.system);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showLanguageDialog(BuildContext context, SettingsProvider provider, AppLocalizations l10n) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.settingsChooseLanguage),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _LanguageOption(
              title: l10n.settingsLanguageEn,
              isSelected: provider.locale.languageCode == 'en',
              onTap: () {
                provider.setLocale(const Locale('en'));
                Navigator.pop(context);
              },
            ),
            _LanguageOption(
              title: l10n.settingsLanguageAr,
              isSelected: provider.locale.languageCode == 'ar',
              onTap: () {
                provider.setLocale(const Locale('ar'));
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showAboutDialog(BuildContext context, AppLocalizations l10n) {
    showDialog(
      context: context,
      builder: (context) => AboutDialog(
        applicationName: l10n.appName,
        applicationVersion: AppConstants.appVersion,
        applicationIcon: Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(AppTheme.radiusMd),
          ),
          child: const Icon(
            Icons.volunteer_activism,
            color: AppColors.primary,
            size: 32,
          ),
        ),
        children: [
          Text(l10n.settingsAboutDesc),
          const SizedBox(height: AppTheme.spaceMd),
          Text(l10n.settingsAboutMission),
        ],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context, AppLocalizations l10n) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTheme.radiusLg),
        ),
        title: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.error.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.logout,
                color: AppColors.error,
                size: 20,
              ),
            ),
            const SizedBox(width: AppTheme.spaceMd),
            Expanded(
              child: Text(
                l10n.settingsLogout,
                style: const TextStyle(
                  color: AppColors.error,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.settingsLogoutConfirm),
            const SizedBox(height: AppTheme.spaceSm),
            Text(
              l10n.settingsLogoutConfirmDesc,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(l10n.commonCancel),
          ),
          FilledButton(
            onPressed: () async {
              Navigator.of(context).pop();
              await _handleLogout(context);
            },
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.error,
              foregroundColor: Colors.white,
            ),
            child: Text(l10n.settingsLogout),
          ),
        ],
      ),
    );
  }

  Future<void> _handleLogout(BuildContext context) async {
    final authService = context.read<AuthService>();
    await authService.logout();

    if (context.mounted) {
      // Navigate to login screen and clear navigation stack
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const LoginScreen()),
        (route) => false,
      );
    }
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppTheme.spaceMd,
        AppTheme.spaceMd,
        AppTheme.spaceMd,
        AppTheme.spaceSm,
      ),
      child: Text(
        title,
        style: theme.textTheme.labelLarge?.copyWith(
          color: AppColors.primary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final Color? titleColor;
  final VoidCallback? onTap;

  const _SettingsTile({
    required this.icon,
    required this.title,
    this.subtitle,
    this.titleColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(AppTheme.radiusSm),
        ),
        child: Icon(
          icon,
          color: titleColor ?? theme.colorScheme.onSurfaceVariant,
          size: 20,
        ),
      ),
      title: Text(
        title,
        style: titleColor != null
            ? TextStyle(color: titleColor, fontWeight: FontWeight.w600)
            : null,
      ),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}

class _ThemeOption extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _ThemeOption({
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      leading: Icon(
        icon,
        color: isSelected ? AppColors.primary : theme.colorScheme.onSurfaceVariant,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isSelected ? AppColors.primary : null,
          fontWeight: isSelected ? FontWeight.w600 : null,
        ),
      ),
      trailing: isSelected
          ? const Icon(Icons.check, color: AppColors.primary)
          : null,
      onTap: onTap,
    );
  }
}

class _LanguageOption extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const _LanguageOption({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: isSelected ? AppColors.primary : null,
          fontWeight: isSelected ? FontWeight.w600 : null,
        ),
      ),
      trailing: isSelected
          ? const Icon(Icons.check, color: AppColors.primary)
          : null,
      onTap: onTap,
    );
  }
}
