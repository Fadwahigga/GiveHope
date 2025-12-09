import 'package:flutter/material.dart';
import '../l10n/generated/app_localizations.dart';
import '../models/cause.dart';
import '../services/api_service.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../utils/validators.dart';
import '../widgets/widgets.dart';

/// Screen for creating a new cause
class CreateCauseScreen extends StatefulWidget {
  const CreateCauseScreen({super.key});

  @override
  State<CreateCauseScreen> createState() => _CreateCauseScreenState();
}

class _CreateCauseScreenState extends State<CreateCauseScreen> {
  final _formKey = GlobalKey<FormState>();
  final _apiService = ApiService();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _phoneController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _phoneController.dispose();
    _apiService.dispose();
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

  Future<void> _createCause() async {
    if (!_formKey.currentState!.validate()) return;

    final l10n = AppLocalizations.of(context)!;

    setState(() {
      _isLoading = true;
    });

    try {
      final request = CreateCauseRequest(
        name: _nameController.text.trim(),
        description: _descriptionController.text.trim().isNotEmpty
            ? _descriptionController.text.trim()
            : null,
        ownerPhone: _phoneController.text.trim(),
      );

      final cause = await _apiService.createCause(request);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.causeCreateSuccess),
            backgroundColor: AppColors.success,
          ),
        );
        Navigator.of(context).pop(cause);
      }
    } on ApiException catch (e) {
      if (mounted) {
        final l10n = AppLocalizations.of(context)!;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(_getErrorMessage(e, l10n)),
            backgroundColor: AppColors.error,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.causeCreateFailed),
            backgroundColor: AppColors.error,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.causeCreateTitle),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppTheme.spaceMd),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header
              Container(
                padding: const EdgeInsets.all(AppTheme.spaceMd),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(AppTheme.radiusSm),
                      ),
                      child: const Icon(
                        Icons.campaign_outlined,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(width: AppTheme.spaceMd),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n.causeCreateHeader,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            l10n.causeCreateSubtitle,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: AppTheme.spaceLg),

              // Name field
              CustomInputField(
                controller: _nameController,
                label: l10n.causeCreateName,
                hint: l10n.causeCreateNameHint,
                prefixIcon: Icons.title,
                textCapitalization: TextCapitalization.words,
                validator: (value) => Validators.validateRequired(
                  value,
                  message: l10n.causeCreateNameRequired,
                ),
              ),

              const SizedBox(height: AppTheme.spaceMd),

              // Description field
              CustomInputField(
                controller: _descriptionController,
                label: l10n.causeCreateDescription,
                hint: l10n.causeCreateDescriptionHint,
                prefixIcon: Icons.description_outlined,
                maxLines: 4,
                maxLength: 500,
                textCapitalization: TextCapitalization.sentences,
              ),

              const SizedBox(height: AppTheme.spaceMd),

              // Phone field
              PhoneInputField(
                controller: _phoneController,
                label: l10n.causeCreateOwnerPhone,
                hint: l10n.causeCreateOwnerPhoneHint,
                validator: (value) => Validators.validatePhone(
                  value,
                  emptyMessage: l10n.validationPhoneRequired,
                  invalidMessage: l10n.validationPhoneInvalid,
                ),
              ),

              const SizedBox(height: AppTheme.spaceSm),

              // Info about phone
              Container(
                padding: const EdgeInsets.all(AppTheme.spaceMd),
                decoration: BoxDecoration(
                  color: AppColors.warning.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                  border: Border.all(
                    color: AppColors.warning.withValues(alpha: 0.3),
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.warning_amber_outlined,
                      color: AppColors.warning,
                      size: 20,
                    ),
                    const SizedBox(width: AppTheme.spaceSm),
                    Expanded(
                      child: Text(
                        l10n.causeCreateMoMoWarning,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: AppColors.warningDark,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: AppTheme.spaceLg),

              // Create button
              PrimaryButton(
                text: l10n.causeCreateTitle,
                icon: Icons.add,
                isLoading: _isLoading,
                onPressed: _createCause,
              ),

              const SizedBox(height: AppTheme.spaceLg),
            ],
          ),
        ),
      ),
    );
  }
}
