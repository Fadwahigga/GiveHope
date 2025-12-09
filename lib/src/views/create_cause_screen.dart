import 'package:flutter/material.dart';
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

  Future<void> _createCause() async {
    if (!_formKey.currentState!.validate()) return;

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
          const SnackBar(
            content: Text('Cause created successfully!'),
            backgroundColor: AppColors.success,
          ),
        );
        Navigator.of(context).pop(cause);
      }
    } on ApiException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.message),
            backgroundColor: AppColors.error,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to create cause. Please try again.'),
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Cause'),
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
                            'Start a Cause',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Create a cause to receive donations',
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
                label: 'Cause Name',
                hint: 'e.g., Help Build a School',
                prefixIcon: Icons.title,
                textCapitalization: TextCapitalization.words,
                validator: (value) => Validators.validateRequired(
                  value,
                  message: 'Cause name is required',
                ),
              ),

              const SizedBox(height: AppTheme.spaceMd),

              // Description field
              CustomInputField(
                controller: _descriptionController,
                label: 'Description (Optional)',
                hint: 'Describe your cause and how the funds will be used...',
                prefixIcon: Icons.description_outlined,
                maxLines: 4,
                maxLength: 500,
                textCapitalization: TextCapitalization.sentences,
              ),

              const SizedBox(height: AppTheme.spaceMd),

              // Phone field
              PhoneInputField(
                controller: _phoneController,
                label: 'Owner Phone Number',
                hint: 'e.g., +237670000001',
                validator: Validators.validatePhone,
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
                        'This phone number will receive payouts via MTN MoMo. Make sure it\'s an active MTN Mobile Money account.',
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
                text: 'Create Cause',
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

