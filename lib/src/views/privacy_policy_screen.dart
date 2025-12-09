import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../l10n/generated/app_localizations.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';

/// Privacy Policy screen
class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.privacyTitle),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppTheme.spaceLg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                  ),
                  child: const Icon(
                    Icons.privacy_tip,
                    color: AppColors.primary,
                    size: 28,
                  ),
                ),
                const SizedBox(width: AppTheme.spaceMd),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.privacyTitle,
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                        ),
                      ),
                      const SizedBox(height: AppTheme.spaceXs),
                      Text(
                        l10n.privacyLastUpdated,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppTheme.spaceXl),

            // Introduction
            _Section(
              title: l10n.privacyIntroduction,
              content: l10n.privacyIntroductionDesc,
              theme: theme,
              isDark: isDark,
            ),

            // Information We Collect
            _Section(
              title: l10n.privacyInformationWeCollect,
              content: l10n.privacyInformationWeCollectDesc,
              theme: theme,
              isDark: isDark,
            ),

            // How We Use Your Information
            _Section(
              title: l10n.privacyHowWeUse,
              content: l10n.privacyHowWeUseDesc,
              theme: theme,
              isDark: isDark,
            ),

            // Data Security
            _Section(
              title: l10n.privacyDataSecurity,
              content: l10n.privacyDataSecurityDesc,
              theme: theme,
              isDark: isDark,
            ),

            // Third-Party Services
            _Section(
              title: l10n.privacyThirdParty,
              content: l10n.privacyThirdPartyDesc,
              theme: theme,
              isDark: isDark,
            ),

            // Your Rights
            _Section(
              title: l10n.privacyYourRights,
              content: l10n.privacyYourRightsDesc,
              theme: theme,
              isDark: isDark,
            ),

            // Children's Privacy
            _Section(
              title: l10n.privacyChildren,
              content: l10n.privacyChildrenDesc,
              theme: theme,
              isDark: isDark,
            ),

            // Changes to Privacy Policy
            _Section(
              title: l10n.privacyChanges,
              content: l10n.privacyChangesDesc,
              theme: theme,
              isDark: isDark,
            ),

            // Contact Us
            _Section(
              title: l10n.privacyContact,
              content: l10n.privacyContactDesc,
              theme: theme,
              isDark: isDark,
            ),

            const SizedBox(height: AppTheme.spaceXl),

            // Contact Email Button
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () => _launchEmail(l10n.privacyContactEmail),
                icon: const Icon(Icons.email),
                label: Text(l10n.privacyContactUs),
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: AppTheme.spaceMd),
                ),
              ),
            ),

            const SizedBox(height: AppTheme.spaceXl),
          ],
        ),
      ),
    );
  }

  Future<void> _launchEmail(String email) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {
        'subject': 'Privacy Policy Inquiry',
      },
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    }
  }
}

class _Section extends StatelessWidget {
  final String title;
  final String content;
  final ThemeData theme;
  final bool isDark;

  const _Section({
    required this.title,
    required this.content,
    required this.theme,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppTheme.spaceXl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: AppTheme.spaceSm),
          Text(
            content,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}

