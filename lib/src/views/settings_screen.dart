import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../utils/constants.dart';

/// Settings screen for app preferences
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final settingsProvider = context.watch<SettingsProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          // Appearance section
          _SectionHeader(title: 'Appearance'),

          // Theme setting
          _SettingsTile(
            icon: Icons.palette_outlined,
            title: 'Theme',
            subtitle: _getThemeName(settingsProvider.themeMode),
            onTap: () => _showThemeDialog(context, settingsProvider),
          ),

          // Language setting
          _SettingsTile(
            icon: Icons.language,
            title: 'Language',
            subtitle: _getLanguageName(settingsProvider.locale),
            onTap: () => _showLanguageDialog(context, settingsProvider),
          ),

          const Divider(height: 32),

          // About section
          _SectionHeader(title: 'About'),

          _SettingsTile(
            icon: Icons.info_outline,
            title: 'About GiveHope',
            subtitle: 'Learn more about our mission',
            onTap: () => _showAboutDialog(context),
          ),

          _SettingsTile(
            icon: Icons.privacy_tip_outlined,
            title: 'Privacy Policy',
            onTap: () {
              // TODO: Navigate to privacy policy
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Privacy Policy coming soon')),
              );
            },
          ),

          _SettingsTile(
            icon: Icons.description_outlined,
            title: 'Terms of Service',
            onTap: () {
              // TODO: Navigate to terms of service
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Terms of Service coming soon')),
              );
            },
          ),

          const Divider(height: 32),

          // Support section
          _SectionHeader(title: 'Support'),

          _SettingsTile(
            icon: Icons.help_outline,
            title: 'Help & FAQ',
            onTap: () {
              // TODO: Navigate to help
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Help & FAQ coming soon')),
              );
            },
          ),

          _SettingsTile(
            icon: Icons.email_outlined,
            title: 'Contact Us',
            subtitle: 'support@givehope.example.com',
            onTap: () {
              // TODO: Open email or contact form
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Contact form coming soon')),
              );
            },
          ),

          _SettingsTile(
            icon: Icons.star_outline,
            title: 'Rate App',
            subtitle: 'Love GiveHope? Rate us!',
            onTap: () {
              // TODO: Open app store
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('App store rating coming soon')),
              );
            },
          ),

          const SizedBox(height: AppTheme.spaceLg),

          // Version info
          Center(
            child: Column(
              children: [
                Text(
                  'GiveHope',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: AppTheme.spaceXs),
                Text(
                  'Version ${AppConstants.appVersion}',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: AppTheme.spaceXxl),
        ],
      ),
    );
  }

  String _getThemeName(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'Light';
      case ThemeMode.dark:
        return 'Dark';
      case ThemeMode.system:
        return 'System';
    }
  }

  String _getLanguageName(Locale locale) {
    switch (locale.languageCode) {
      case 'ar':
        return 'العربية';
      case 'en':
      default:
        return 'English';
    }
  }

  void _showThemeDialog(BuildContext context, SettingsProvider provider) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Choose Theme'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _ThemeOption(
              title: 'Light',
              icon: Icons.light_mode,
              isSelected: provider.themeMode == ThemeMode.light,
              onTap: () {
                provider.setThemeMode(ThemeMode.light);
                Navigator.pop(context);
              },
            ),
            _ThemeOption(
              title: 'Dark',
              icon: Icons.dark_mode,
              isSelected: provider.themeMode == ThemeMode.dark,
              onTap: () {
                provider.setThemeMode(ThemeMode.dark);
                Navigator.pop(context);
              },
            ),
            _ThemeOption(
              title: 'System',
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

  void _showLanguageDialog(BuildContext context, SettingsProvider provider) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Choose Language'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _LanguageOption(
              title: 'English',
              isSelected: provider.locale.languageCode == 'en',
              onTap: () {
                provider.setLocale(const Locale('en'));
                Navigator.pop(context);
              },
            ),
            _LanguageOption(
              title: 'العربية',
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

  void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AboutDialog(
        applicationName: 'GiveHope',
        applicationVersion: AppConstants.appVersion,
        applicationIcon: Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(AppTheme.radiusMd),
          ),
          child: const Icon(
            Icons.volunteer_activism,
            color: AppColors.primary,
            size: 32,
          ),
        ),
        children: [
          const Text(
            'GiveHope is a donation and micro-payments app designed to make charitable giving easy and accessible.',
          ),
          const SizedBox(height: AppTheme.spaceMd),
          const Text(
            'Our mission is to connect generous donors with causes that matter, empowering communities one donation at a time.',
          ),
        ],
      ),
    );
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
  final VoidCallback? onTap;

  const _SettingsTile({
    required this.icon,
    required this.title,
    this.subtitle,
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
        child: Icon(icon, color: theme.colorScheme.onSurfaceVariant, size: 20),
      ),
      title: Text(title),
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

/// Provider for managing app settings (theme, locale)
class SettingsProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  Locale _locale = const Locale('en');

  ThemeMode get themeMode => _themeMode;
  Locale get locale => _locale;

  void setThemeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
    // TODO: Persist to SharedPreferences
  }

  void setLocale(Locale locale) {
    _locale = locale;
    notifyListeners();
    // TODO: Persist to SharedPreferences
  }

  /// Load settings from SharedPreferences
  Future<void> loadSettings() async {
    // TODO: Load from SharedPreferences
    // final prefs = await SharedPreferences.getInstance();
    // final themeModeIndex = prefs.getInt(AppConstants.keyThemeMode) ?? 0;
    // final localeCode = prefs.getString(AppConstants.keyLocale) ?? 'en';
    // _themeMode = ThemeMode.values[themeModeIndex];
    // _locale = Locale(localeCode);
    notifyListeners();
  }
}

