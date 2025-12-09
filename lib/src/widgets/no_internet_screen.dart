import 'package:flutter/material.dart';
import '../l10n/generated/app_localizations.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import 'primary_button.dart';

/// Beautiful no internet connection screen
class NoInternetScreen extends StatelessWidget {
  final VoidCallback? onRetry;
  final String? customTitle;
  final String? customDescription;

  const NoInternetScreen({
    super.key,
    this.onRetry,
    this.customTitle,
    this.customDescription,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: isDark
              ? LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xFF0F1419),
                    const Color(0xFF1A2530),
                  ],
                )
              : LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.primary.withValues(alpha: 0.1),
                    AppColors.info.withValues(alpha: 0.05),
                  ],
                ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppTheme.spaceXl),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Animated icon
                  _AnimatedWifiIcon(isDark: isDark),

                  const SizedBox(height: AppTheme.spaceXl),

                  // Title
                  Text(
                    customTitle ?? l10n.commonNoInternet,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: isDark ? Colors.white : AppColors.primary,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: AppTheme.spaceMd),

                  // Description
                  Text(
                    customDescription ?? l10n.commonNoInternetDesc,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: AppTheme.spaceXl),

                  // Tips
                  Container(
                    padding: const EdgeInsets.all(AppTheme.spaceMd),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                      border: Border.all(
                        color: theme.colorScheme.outline.withValues(alpha: 0.2),
                      ),
                    ),
                    child: Column(
                      children: [
                        _TipItem(
                          icon: Icons.wifi_find,
                          text: l10n.noInternetTip1,
                          theme: theme,
                        ),
                        const SizedBox(height: AppTheme.spaceSm),
                        _TipItem(
                          icon: Icons.signal_wifi_off,
                          text: l10n.noInternetTip2,
                          theme: theme,
                        ),
                        const SizedBox(height: AppTheme.spaceSm),
                        _TipItem(
                          icon: Icons.refresh,
                          text: l10n.noInternetTip3,
                          theme: theme,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: AppTheme.spaceXl),

                  // Retry button
                  if (onRetry != null)
                    PrimaryButton(
                      text: l10n.commonRetry,
                      icon: Icons.refresh,
                      onPressed: onRetry,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AnimatedWifiIcon extends StatefulWidget {
  final bool isDark;

  const _AnimatedWifiIcon({required this.isDark});

  @override
  State<_AnimatedWifiIcon> createState() => _AnimatedWifiIconState();
}

class _AnimatedWifiIconState extends State<_AnimatedWifiIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 0.9, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _rotationAnimation = Tween<double>(begin: 0.0, end: 0.1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Transform.rotate(
            angle: _rotationAnimation.value,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: widget.isDark
                    ? Colors.white.withValues(alpha: 0.1)
                    : AppColors.primary.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.wifi_off_rounded,
                size: 64,
                color: widget.isDark ? Colors.white70 : AppColors.primary,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _TipItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final ThemeData theme;

  const _TipItem({
    required this.icon,
    required this.text,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: AppColors.primary,
        ),
        const SizedBox(width: AppTheme.spaceSm),
        Expanded(
          child: Text(
            text,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ],
    );
  }
}

