import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Text styles for the GiveHope app
class AppTextStyles {
  AppTextStyles._();

  // ═══════════════════════════════════════════════════════════════
  // FONT FAMILIES
  // ═══════════════════════════════════════════════════════════════
  
  static const String fontFamilyLatin = 'Poppins';
  static const String fontFamilyArabic = 'Cairo';
  
  /// Get the appropriate font family based on locale
  static String getFontFamily(Locale locale) {
    return locale.languageCode == 'ar' ? fontFamilyArabic : fontFamilyLatin;
  }

  // ═══════════════════════════════════════════════════════════════
  // DISPLAY STYLES
  // ═══════════════════════════════════════════════════════════════
  
  static TextStyle displayLarge({Color? color}) => TextStyle(
    fontSize: 57,
    fontWeight: FontWeight.w700,
    height: 1.12,
    letterSpacing: -0.25,
    color: color ?? AppColors.lightTextPrimary,
  );

  static TextStyle displayMedium({Color? color}) => TextStyle(
    fontSize: 45,
    fontWeight: FontWeight.w700,
    height: 1.16,
    letterSpacing: 0,
    color: color ?? AppColors.lightTextPrimary,
  );

  static TextStyle displaySmall({Color? color}) => TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w600,
    height: 1.22,
    letterSpacing: 0,
    color: color ?? AppColors.lightTextPrimary,
  );

  // ═══════════════════════════════════════════════════════════════
  // HEADLINE STYLES
  // ═══════════════════════════════════════════════════════════════
  
  static TextStyle headlineLarge({Color? color}) => TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    height: 1.25,
    letterSpacing: 0,
    color: color ?? AppColors.lightTextPrimary,
  );

  static TextStyle headlineMedium({Color? color}) => TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    height: 1.29,
    letterSpacing: 0,
    color: color ?? AppColors.lightTextPrimary,
  );

  static TextStyle headlineSmall({Color? color}) => TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 1.33,
    letterSpacing: 0,
    color: color ?? AppColors.lightTextPrimary,
  );

  // ═══════════════════════════════════════════════════════════════
  // TITLE STYLES
  // ═══════════════════════════════════════════════════════════════
  
  static TextStyle titleLarge({Color? color}) => TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    height: 1.27,
    letterSpacing: 0,
    color: color ?? AppColors.lightTextPrimary,
  );

  static TextStyle titleMedium({Color? color}) => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.5,
    letterSpacing: 0.15,
    color: color ?? AppColors.lightTextPrimary,
  );

  static TextStyle titleSmall({Color? color}) => TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.43,
    letterSpacing: 0.1,
    color: color ?? AppColors.lightTextPrimary,
  );

  // ═══════════════════════════════════════════════════════════════
  // BODY STYLES
  // ═══════════════════════════════════════════════════════════════
  
  static TextStyle bodyLarge({Color? color}) => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: 0.5,
    color: color ?? AppColors.lightTextPrimary,
  );

  static TextStyle bodyMedium({Color? color}) => TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.43,
    letterSpacing: 0.25,
    color: color ?? AppColors.lightTextPrimary,
  );

  static TextStyle bodySmall({Color? color}) => TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.33,
    letterSpacing: 0.4,
    color: color ?? AppColors.lightTextSecondary,
  );

  // ═══════════════════════════════════════════════════════════════
  // LABEL STYLES
  // ═══════════════════════════════════════════════════════════════
  
  static TextStyle labelLarge({Color? color}) => TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.43,
    letterSpacing: 0.1,
    color: color ?? AppColors.lightTextPrimary,
  );

  static TextStyle labelMedium({Color? color}) => TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.33,
    letterSpacing: 0.5,
    color: color ?? AppColors.lightTextSecondary,
  );

  static TextStyle labelSmall({Color? color}) => TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    height: 1.45,
    letterSpacing: 0.5,
    color: color ?? AppColors.lightTextTertiary,
  );

  // ═══════════════════════════════════════════════════════════════
  // SPECIAL STYLES
  // ═══════════════════════════════════════════════════════════════
  
  /// Style for donation amounts
  static TextStyle donationAmount({Color? color}) => TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    height: 1.2,
    letterSpacing: -0.5,
    color: color ?? AppColors.primary,
  );

  /// Style for progress percentages
  static TextStyle progressText({Color? color}) => TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.4,
    letterSpacing: 0,
    color: color ?? AppColors.success,
  );

  /// Style for button text
  static TextStyle button({Color? color}) => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.5,
    letterSpacing: 0.5,
    color: color ?? Colors.white,
  );

  /// Style for small button text
  static TextStyle buttonSmall({Color? color}) => TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.43,
    letterSpacing: 0.25,
    color: color ?? Colors.white,
  );
}

