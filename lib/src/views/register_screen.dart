import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../l10n/generated/app_localizations.dart';
import '../services/api_service.dart';
import '../services/auth_service.dart';
import '../services/settings_provider.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../utils/constants.dart';
import '../utils/validators.dart';
import '../widgets/widgets.dart';
import 'main_screen.dart';

/// Registration screen
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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

  Future<void> _register() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    final authService = context.read<AuthService>();
    String? errorMessage;

    try {
      final success = await authService.register(
        email: _emailController.text.trim(),
        password: _passwordController.text,
        name: _nameController.text.trim().isNotEmpty 
            ? _nameController.text.trim() 
            : null,
        phone: _phoneController.text.trim().isNotEmpty 
            ? _phoneController.text.trim() 
            : null,
      );

      if (success && mounted) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const MainScreen()),
          (route) => false,
        );
        return;
      } else if (mounted && authService.error != null) {
        errorMessage = authService.error;
      }
    } catch (e) {
      if (mounted) {
        final l10n = AppLocalizations.of(context)!;
        errorMessage = _getErrorMessage(e, l10n);
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });

        if (errorMessage != null) {
          final l10n = AppLocalizations.of(context)!;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(_getErrorMessage(errorMessage, l10n)),
              backgroundColor: AppColors.error,
            ),
          );
        }
      }
    }
  }

  String? _validateConfirmPassword(String? value) {
    final l10n = AppLocalizations.of(context)!;
    if (value == null || value.isEmpty) {
      return l10n.authRequired;
    }
    if (value != _passwordController.text) {
      return l10n.authPasswordMismatch;
    }
    return null;
  }

  String? _validatePassword(String? value) {
    final l10n = AppLocalizations.of(context)!;
    if (value == null || value.isEmpty) {
      return l10n.authRequired;
    }
    if (value.length < AppConstants.minPasswordLength) {
      return l10n.authPasswordMin(AppConstants.minPasswordLength);
    }
    return null;
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

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.authRegister),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: _showLanguageDialog,
            tooltip: l10n.settingsLanguage,
          ),
          IconButton(
            icon: Icon(
              theme.brightness == Brightness.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
            onPressed: _showThemeDialog,
            tooltip: l10n.settingsTheme,
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppTheme.spaceLg),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header
                Text(
                  l10n.authRegisterTitle,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const SizedBox(height: AppTheme.spaceSm),

                Text(
                  l10n.authRegisterSubtitle,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),

                const SizedBox(height: AppTheme.spaceLg),

                // Name field (optional)
                CustomInputField(
                  controller: _nameController,
                  label: l10n.authName,
                  hint: l10n.authNameHint,
                  prefixIcon: Icons.person_outlined,
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                  validator: (value) => Validators.validateName(
                    value,
                    required: false,
                    emptyMessage: l10n.validationNameRequired,
                    invalidMessage: l10n.validationNameInvalid,
                  ),
                ),

                const SizedBox(height: AppTheme.spaceMd),

                // Email field
                CustomInputField(
                  controller: _emailController,
                  label: l10n.authEmail,
                  hint: l10n.authEmailHint,
                  prefixIcon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: (value) => Validators.validateEmail(
                    value,
                    emptyMessage: l10n.authRequired,
                    invalidMessage: l10n.authInvalidEmail,
                  ),
                ),

                const SizedBox(height: AppTheme.spaceMd),

                // Phone field (optional)
                PhoneInputField(
                  controller: _phoneController,
                  label: l10n.authPhone,
                  hint: l10n.authPhoneHint,
                ),

                const SizedBox(height: AppTheme.spaceMd),

                // Password field
                CustomInputField(
                  controller: _passwordController,
                  label: l10n.authPassword,
                  hint: l10n.authPasswordHint,
                  prefixIcon: Icons.lock_outlined,
                  obscureText: _obscurePassword,
                  suffixIcon: _obscurePassword 
                      ? Icons.visibility_outlined 
                      : Icons.visibility_off_outlined,
                  onSuffixTap: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                  textInputAction: TextInputAction.next,
                  validator: _validatePassword,
                ),

                const SizedBox(height: AppTheme.spaceMd),

                // Confirm Password field
                CustomInputField(
                  controller: _confirmPasswordController,
                  label: l10n.authConfirmPassword,
                  hint: l10n.authConfirmPasswordHint,
                  prefixIcon: Icons.lock_outlined,
                  obscureText: _obscureConfirmPassword,
                  suffixIcon: _obscureConfirmPassword 
                      ? Icons.visibility_outlined 
                      : Icons.visibility_off_outlined,
                  onSuffixTap: () {
                    setState(() {
                      _obscureConfirmPassword = !_obscureConfirmPassword;
                    });
                  },
                  textInputAction: TextInputAction.done,
                  validator: _validateConfirmPassword,
                ),

                const SizedBox(height: AppTheme.spaceLg),

                // Info box
                Container(
                  padding: const EdgeInsets.all(AppTheme.spaceMd),
                  decoration: BoxDecoration(
                    color: AppColors.info.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                    border: Border.all(
                      color: AppColors.info.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.info_outline,
                        color: AppColors.info,
                        size: 20,
                      ),
                      const SizedBox(width: AppTheme.spaceSm),
                      Expanded(
                        child: Text(
                          l10n.authMoMoInfo,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: AppColors.info,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: AppTheme.spaceLg),

                // Register button
                PrimaryButton(
                  text: l10n.authRegister,
                  isLoading: authService.isLoading,
                  onPressed: _register,
                ),

                const SizedBox(height: AppTheme.spaceMd),

                // Login link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      l10n.authAlreadyAccount,
                      style: theme.textTheme.bodyMedium,
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(l10n.authSignIn),
                    ),
                  ],
                ),

                const SizedBox(height: AppTheme.spaceLg),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
