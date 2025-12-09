import 'package:flutter/material.dart';
import '../l10n/generated/app_localizations.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';

/// Beautiful scrollable banner showing app features and value
class AppBanner extends StatefulWidget {
  const AppBanner({super.key});

  @override
  State<AppBanner> createState() => _AppBannerState();
}

class _AppBannerState extends State<AppBanner> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isRTL = Localizations.localeOf(context).languageCode == 'ar';

    final banners = [
      _BannerData(
        title: l10n.bannerTitle1,
        description: l10n.bannerDesc1,
        icon: Icons.volunteer_activism,
        gradient: LinearGradient(
          colors: AppColors.featuredGradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      _BannerData(
        title: l10n.bannerTitle2,
        description: l10n.bannerDesc2,
        icon: Icons.flash_on,
        gradient: LinearGradient(
          colors: AppColors.progressGradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      _BannerData(
        title: l10n.bannerTitle3,
        description: l10n.bannerDesc3,
        icon: Icons.visibility,
        gradient: LinearGradient(
          colors: [AppColors.primary, AppColors.secondary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      _BannerData(
        title: l10n.bannerTitle4,
        description: l10n.bannerDesc4,
        icon: Icons.security,
        gradient: LinearGradient(
          colors: [AppColors.secondary, AppColors.accent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    ];

    return Container(
      height: 200,
      margin: const EdgeInsets.symmetric(horizontal: AppTheme.spaceMd),
      child: Column(
        children: [
          // Banner carousel
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: banners.length,
              itemBuilder: (context, index) {
                final banner = banners[index];
                return _BannerCard(data: banner, isRTL: isRTL);
              },
            ),
          ),

          const SizedBox(height: AppTheme.spaceSm),

          // Page indicators
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              banners.length,
              (index) => _PageIndicator(isActive: index == _currentPage),
            ),
          ),
        ],
      ),
    );
  }
}

class _BannerData {
  final String title;
  final String description;
  final IconData icon;
  final LinearGradient gradient;

  const _BannerData({
    required this.title,
    required this.description,
    required this.icon,
    required this.gradient,
  });
}

class _BannerCard extends StatelessWidget {
  final _BannerData data;
  final bool isRTL;

  const _BannerCard({required this.data, required this.isRTL});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        gradient: data.gradient,
        borderRadius: BorderRadius.circular(AppTheme.radiusLg),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppTheme.radiusLg),
        child: Stack(
          children: [
            // Background pattern
            Positioned.fill(
              child: Opacity(
                opacity: 0.1,
                child: CustomPaint(painter: _PatternPainter()),
              ),
            ),

            // Content
            Padding(
              padding: const EdgeInsets.all(AppTheme.spaceLg),
              child: Row(
                textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
                children: [
                  // Icon
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                    ),
                    child: Icon(data.icon, color: Colors.white, size: 32),
                  ),

                  const SizedBox(width: AppTheme.spaceMd),

                  // Text content
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          data.title,
                          style: theme.textTheme.titleLarge?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: AppTheme.spaceXs),
                        Text(
                          data.description,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: Colors.white.withValues(alpha: 0.9),
                            fontSize: 13,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),

                  // Decorative arrow - points in scroll direction based on locale
                  // In RTL: arrow points left (back) since content flows right-to-left
                  // In LTR: arrow points right (forward) since content flows left-to-right
                  Icon(
                    isRTL ? Icons.arrow_back_ios : Icons.arrow_forward_ios,
                    color: Colors.white.withValues(alpha: 0.3),
                    size: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PageIndicator extends StatelessWidget {
  final bool isActive;

  const _PageIndicator({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: isActive ? 24 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: isActive
            ? AppColors.primary
            : AppColors.primary.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

class _PatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    // Draw diagonal lines pattern
    const spacing = 20.0;
    for (double i = -size.height; i < size.width + size.height; i += spacing) {
      canvas.drawLine(
        Offset(i, 0),
        Offset(i + size.height, size.height),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
