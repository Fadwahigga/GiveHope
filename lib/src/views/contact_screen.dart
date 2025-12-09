import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../l10n/generated/app_localizations.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
// import '../widgets/primary_button.dart';
// import '../widgets/custom_input_field.dart';

/// Contact screen
class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  // final _formKey = GlobalKey<FormState>();
  // final _nameController = TextEditingController();
  // final _emailController = TextEditingController();
  // final _subjectController = TextEditingController();
  // final _messageController = TextEditingController();
  // bool _isSubmitting = false;

  // @override
  // void dispose() {
  //   _nameController.dispose();
  //   _emailController.dispose();
  //   _subjectController.dispose();
  //   _messageController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.contactTitle)),
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
                    Icons.email,
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
                        l10n.contactTitle,
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: isDark
                              ? AppColors.darkTextPrimary
                              : AppColors.lightTextPrimary,
                        ),
                      ),
                      const SizedBox(height: AppTheme.spaceXs),
                      Text(
                        l10n.contactSubtitle,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: isDark
                              ? AppColors.darkTextSecondary
                              : AppColors.lightTextSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppTheme.spaceXl),

            // Contact Information Card
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppTheme.radiusLg),
                side: BorderSide(
                  color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(AppTheme.spaceLg),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.email_outlined,
                          color: AppColors.primary,
                          size: 24,
                        ),
                        const SizedBox(width: AppTheme.spaceMd),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                l10n.contactEmailLabel,
                                style: theme.textTheme.labelMedium?.copyWith(
                                  color: isDark
                                      ? AppColors.darkTextSecondary
                                      : AppColors.lightTextSecondary,
                                ),
                              ),
                              const SizedBox(height: AppTheme.spaceXs),
                              SelectableText(
                                l10n.contactEmail,
                                style: theme.textTheme.bodyLarge?.copyWith(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.copy),
                          onPressed: () {
                            Clipboard.setData(
                              ClipboardData(text: l10n.contactEmail),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(l10n.contactEmailCopied),
                                duration: const Duration(seconds: 2),
                              ),
                            );
                          },
                          tooltip: l10n.contactCopyEmail,
                        ),
                      ],
                    ),
                    const SizedBox(height: AppTheme.spaceMd),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () => _launchEmail(l10n.contactEmail),
                        icon: const Icon(Icons.open_in_new),
                        label: Text(l10n.contactOpenEmail),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.primary,
                          side: const BorderSide(color: AppColors.primary),
                          padding: const EdgeInsets.symmetric(
                            vertical: AppTheme.spaceMd,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppTheme.spaceXl),

            // Contact Form
            // Text(
            //   l10n.contactFormTitle,
            //   style: theme.textTheme.titleLarge?.copyWith(
            //     fontWeight: FontWeight.w700,
            //     color: isDark
            //         ? AppColors.darkTextPrimary
            //         : AppColors.lightTextPrimary,
            //   ),
            // ),
            // const SizedBox(height: AppTheme.spaceMd),

            // CustomInputField(
            //   controller: _nameController,
            //   label: l10n.contactFormName,
            //   hint: l10n.contactFormNameHint,
            //   prefixIcon: Icons.person_outline,
            //   validator: (value) {
            //     if (value == null || value.trim().isEmpty) {
            //       return l10n.contactFormNameRequired;
            //     }
            //     return null;
            //   },
            // ),
            // const SizedBox(height: AppTheme.spaceMd),

            // CustomInputField(
            //   controller: _emailController,
            //   label: l10n.contactFormEmail,
            //   hint: l10n.contactFormEmailHint,
            //   prefixIcon: Icons.email_outlined,
            //   keyboardType: TextInputType.emailAddress,
            //   validator: (value) {
            //     if (value == null || value.trim().isEmpty) {
            //       return l10n.contactFormEmailRequired;
            //     }
            //     if (!value.contains('@')) {
            //       return l10n.contactFormEmailInvalid;
            //     }
            //     return null;
            //   },
            // ),
            // const SizedBox(height: AppTheme.spaceMd),

            // CustomInputField(
            //   controller: _subjectController,
            //   label: l10n.contactFormSubject,
            //   hint: l10n.contactFormSubjectHint,
            //   prefixIcon: Icons.subject_outlined,
            //   validator: (value) {
            //     if (value == null || value.trim().isEmpty) {
            //       return l10n.contactFormSubjectRequired;
            //     }
            //     return null;
            //   },
            // ),
            // const SizedBox(height: AppTheme.spaceMd),

            // CustomInputField(
            //   controller: _messageController,
            //   label: l10n.contactFormMessage,
            //   hint: l10n.contactFormMessageHint,
            //   prefixIcon: Icons.message_outlined,
            //   maxLines: 6,
            //   validator: (value) {
            //     if (value == null || value.trim().isEmpty) {
            //       return l10n.contactFormMessageRequired;
            //     }
            //     if (value.trim().length < 10) {
            //       return l10n.contactFormMessageMinLength;
            //     }
            //     return null;
            //   },
            // ),
            // const SizedBox(height: AppTheme.spaceXl),

            // Submit Button
            // PrimaryButton(
            //   text: l10n.contactFormSubmit,
            //   icon: Icons.send,
            //   onPressed: _isSubmitting ? null : _handleSubmit,
            //   isLoading: _isSubmitting,
            // ),
            const SizedBox(height: AppTheme.spaceXl),
          ],
        ),
      ),
    );
  }

  // Future<void> _handleSubmit() async {
  //   if (!_formKey.currentState!.validate()) {
  //     return;
  //   }

  //   setState(() {
  //     _isSubmitting = true;
  //   });

  //   final l10n = AppLocalizations.of(context)!;

  //   // Create email with form data
  //   final subject = _subjectController.text.trim();
  //   final body =
  //       '''
  // Name: ${_nameController.text.trim()}
  // Email: ${_emailController.text.trim()}

  // Message:
  // ${_messageController.text.trim()}
  // ''';

  //   final Uri emailUri = Uri(
  //     scheme: 'mailto',
  //     path: l10n.contactEmail,
  //     queryParameters: {'subject': subject, 'body': body},
  //   );

  //   try {
  //     if (await canLaunchUrl(emailUri)) {
  //       await launchUrl(emailUri);
  //       if (mounted) {
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(
  //             content: Text(l10n.contactFormSuccess),
  //             backgroundColor: AppColors.success,
  //             duration: const Duration(seconds: 3),
  //           ),
  //         );
  //         // Clear form
  //         _nameController.clear();
  //         _emailController.clear();
  //         _subjectController.clear();
  //         _messageController.clear();
  //       }
  //     } else {
  //       throw Exception('Cannot launch email');
  //     }
  //   } catch (e) {
  //     if (mounted) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text(l10n.contactFormError),
  //           backgroundColor: AppColors.error,
  //           duration: const Duration(seconds: 3),
  //         ),
  //       );
  //     }
  //   } finally {
  //     if (mounted) {
  //       setState(() {
  //         _isSubmitting = false;
  //       });
  //     }
  //   }
  // }

  Future<void> _launchEmail(String email) async {
    final Uri emailUri = Uri(scheme: 'mailto', path: email);

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    }
  }
}
