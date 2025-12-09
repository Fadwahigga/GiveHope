import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'primary_button.dart';

/// An empty state widget for displaying when there's no data
class EmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? description;
  final String? actionText;
  final VoidCallback? onAction;
  final bool isError;

  const EmptyState({
    super.key,
    this.icon = Icons.inbox_outlined,
    required this.title,
    this.description,
    this.actionText,
    this.onAction,
    this.isError = false,
  });

  /// Factory for no results state
  factory EmptyState.noResults({
    String title = 'No results found',
    String? description,
    String? actionText,
    VoidCallback? onAction,
  }) {
    return EmptyState(
      icon: Icons.search_off_outlined,
      title: title,
      description: description,
      actionText: actionText,
      onAction: onAction,
    );
  }

  /// Factory for error state
  factory EmptyState.error({
    String title = 'Something went wrong',
    String? description,
    String actionText = 'Try Again',
    VoidCallback? onAction,
  }) {
    return EmptyState(
      icon: Icons.error_outline,
      title: title,
      description: description ?? 'An unexpected error occurred. Please try again.',
      actionText: actionText,
      onAction: onAction,
      isError: true,
    );
  }

  /// Factory for no internet state
  factory EmptyState.noInternet({
    String title = 'No internet connection',
    String? description,
    String actionText = 'Retry',
    VoidCallback? onAction,
  }) {
    return EmptyState(
      icon: Icons.wifi_off_outlined,
      title: title,
      description: description ?? 'Please check your connection and try again.',
      actionText: actionText,
      onAction: onAction,
      isError: true,
    );
  }

  /// Factory for no donations state
  factory EmptyState.noDonations({
    String title = 'No donations yet',
    String? description,
    String? actionText,
    VoidCallback? onAction,
  }) {
    return EmptyState(
      icon: Icons.volunteer_activism_outlined,
      title: title,
      description: description ?? 'Be the first to donate!',
      actionText: actionText,
      onAction: onAction,
    );
  }

  /// Factory for no causes state
  factory EmptyState.noCauses({
    String title = 'No causes found',
    String? description,
    String? actionText,
    VoidCallback? onAction,
  }) {
    return EmptyState(
      icon: Icons.campaign_outlined,
      title: title,
      description: description ?? 'There are no active causes at the moment.',
      actionText: actionText,
      onAction: onAction,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final iconColor = isError 
        ? theme.colorScheme.error 
        : theme.colorScheme.primary.withOpacity(0.5);
    
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spaceLg),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 40,
                color: iconColor,
              ),
            ),
            
            const SizedBox(height: AppTheme.spaceLg),
            
            // Title
            Text(
              title,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            
            if (description != null) ...[
              const SizedBox(height: AppTheme.spaceSm),
              Text(
                description!,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
            ],
            
            if (actionText != null && onAction != null) ...[
              const SizedBox(height: AppTheme.spaceLg),
              PrimaryButton(
                text: actionText!,
                onPressed: onAction,
                isFullWidth: false,
                isOutlined: !isError,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// A loading state widget
class LoadingState extends StatelessWidget {
  final String? message;

  const LoadingState({
    super.key,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(),
          if (message != null) ...[
            const SizedBox(height: AppTheme.spaceMd),
            Text(
              message!,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

