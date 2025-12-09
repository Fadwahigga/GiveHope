import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../l10n/generated/app_localizations.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';

/// Terms of Service screen
class TermsOfServiceScreen extends StatelessWidget {
  const TermsOfServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.termsTitle),
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
                    Icons.description,
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
                        l10n.termsTitle,
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                        ),
                      ),
                      const SizedBox(height: AppTheme.spaceXs),
                      Text(
                        l10n.termsLastUpdated,
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
              title: l10n.termsIntroduction,
              content: l10n.termsIntroductionDesc,
              theme: theme,
              isDark: isDark,
            ),

            // Acceptance of Terms
            _Section(
              title: l10n.termsAcceptance,
              content: l10n.termsAcceptanceDesc,
              theme: theme,
              isDark: isDark,
            ),

            // Use of Service
            _Section(
              title: l10n.termsUseOfService,
              content: l10n.termsUseOfServiceDesc,
              theme: theme,
              isDark: isDark,
            ),

            // User Accounts
            _Section(
              title: l10n.termsUserAccounts,
              content: l10n.termsUserAccountsDesc,
              theme: theme,
              isDark: isDark,
            ),

            // Donations and Payments
            _Section(
              title: l10n.termsDonations,
              content: l10n.termsDonationsDesc,
              theme: theme,
              isDark: isDark,
            ),

            // Prohibited Activities
            _Section(
              title: l10n.termsProhibited,
              content: l10n.termsProhibitedDesc,
              theme: theme,
              isDark: isDark,
            ),

            // Intellectual Property
            _Section(
              title: l10n.termsIntellectual,
              content: l10n.termsIntellectualDesc,
              theme: theme,
              isDark: isDark,
            ),

            // Limitation of Liability
            _Section(
              title: l10n.termsLiability,
              content: l10n.termsLiabilityDesc,
              theme: theme,
              isDark: isDark,
            ),

            // Termination
            _Section(
              title: l10n.termsTermination,
              content: l10n.termsTerminationDesc,
              theme: theme,
              isDark: isDark,
            ),

            // Changes to Terms
            _Section(
              title: l10n.termsChanges,
              content: l10n.termsChangesDesc,
              theme: theme,
              isDark: isDark,
            ),

            // Contact Us
            _Section(
              title: l10n.termsContact,
              content: l10n.termsContactDesc,
              theme: theme,
              isDark: isDark,
            ),

            const SizedBox(height: AppTheme.spaceXl),

            // Contact Email Button
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () => _launchEmail(l10n.termsContactEmail),
                icon: const Icon(Icons.email),
                label: Text(l10n.termsContactUs),
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
        'subject': 'Terms of Service Inquiry',
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

