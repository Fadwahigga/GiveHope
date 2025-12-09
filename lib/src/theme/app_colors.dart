import 'package:flutter/material.dart';

/// GiveHope brand colors - a warm, trustworthy palette
/// inspired by hope, growth, and compassion
class AppColors {
  AppColors._();

  // ═══════════════════════════════════════════════════════════════
  // PRIMARY BRAND COLORS
  // ═══════════════════════════════════════════════════════════════
  
  /// Primary teal - represents trust, growth, and hope
  static const Color primary = Color(0xFF2A9D8F);
  static const Color primaryLight = Color(0xFF5FBFB3);
  static const Color primaryDark = Color(0xFF1E7268);
  
  /// Secondary coral - represents warmth, compassion, and energy
  static const Color secondary = Color(0xFFE76F51);
  static const Color secondaryLight = Color(0xFFF4A261);
  static const Color secondaryDark = Color(0xFFD64933);
  
  /// Accent gold - represents achievement and celebration
  static const Color accent = Color(0xFFF4A261);
  static const Color accentLight = Color(0xFFFFD166);
  static const Color accentDark = Color(0xFFE09F3E);

  // ═══════════════════════════════════════════════════════════════
  // SEMANTIC COLORS
  // ═══════════════════════════════════════════════════════════════
  
  static const Color success = Color(0xFF06D6A0);
  static const Color successLight = Color(0xFFB5F5EC);
  static const Color successDark = Color(0xFF059669);
  
  static const Color warning = Color(0xFFFFB703);
  static const Color warningLight = Color(0xFFFFF3CD);
  static const Color warningDark = Color(0xFFE09F3E);
  
  static const Color error = Color(0xFFEF476F);
  static const Color errorLight = Color(0xFFFCE4EC);
  static const Color errorDark = Color(0xFFD62839);
  
  static const Color info = Color(0xFF118AB2);
  static const Color infoLight = Color(0xFFE1F5FE);
  static const Color infoDark = Color(0xFF0D6A8A);

  // ═══════════════════════════════════════════════════════════════
  // LIGHT THEME COLORS
  // ═══════════════════════════════════════════════════════════════
  
  static const Color lightBackground = Color(0xFFFAFBFC);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightSurfaceVariant = Color(0xFFF5F7F9);
  static const Color lightCard = Color(0xFFFFFFFF);
  
  static const Color lightTextPrimary = Color(0xFF1A1D21);
  static const Color lightTextSecondary = Color(0xFF6B7280);
  static const Color lightTextTertiary = Color(0xFF9CA3AF);
  static const Color lightTextOnPrimary = Color(0xFFFFFFFF);
  
  static const Color lightDivider = Color(0xFFE5E7EB);
  static const Color lightBorder = Color(0xFFD1D5DB);
  static const Color lightDisabled = Color(0xFFD1D5DB);
  static const Color lightShadow = Color(0x1A000000);

  // ═══════════════════════════════════════════════════════════════
  // DARK THEME COLORS
  // ═══════════════════════════════════════════════════════════════
  
  static const Color darkBackground = Color(0xFF0F1419);
  static const Color darkSurface = Color(0xFF1A1F26);
  static const Color darkSurfaceVariant = Color(0xFF242B33);
  static const Color darkCard = Color(0xFF1A1F26);
  
  static const Color darkTextPrimary = Color(0xFFF9FAFB);
  static const Color darkTextSecondary = Color(0xFF9CA3AF);
  static const Color darkTextTertiary = Color(0xFF6B7280);
  static const Color darkTextOnPrimary = Color(0xFFFFFFFF);
  
  static const Color darkDivider = Color(0xFF374151);
  static const Color darkBorder = Color(0xFF4B5563);
  static const Color darkDisabled = Color(0xFF4B5563);
  static const Color darkShadow = Color(0x3D000000);

  // ═══════════════════════════════════════════════════════════════
  // DONATION SPECIFIC COLORS
  // ═══════════════════════════════════════════════════════════════
  
  /// Progress bar gradient for donation goals
  static const List<Color> progressGradient = [
    Color(0xFF2A9D8F),
    Color(0xFF06D6A0),
  ];
  
  /// Celebration gradient for completed goals
  static const List<Color> celebrationGradient = [
    Color(0xFFF4A261),
    Color(0xFFFFD166),
  ];
  
  /// Card gradient for featured causes
  static const List<Color> featuredGradient = [
    Color(0xFF2A9D8F),
    Color(0xFF118AB2),
  ];

  // ═══════════════════════════════════════════════════════════════
  // CATEGORY COLORS
  // ═══════════════════════════════════════════════════════════════
  
  static const Color categoryHealth = Color(0xFFEF476F);
  static const Color categoryEducation = Color(0xFF118AB2);
  static const Color categoryEnvironment = Color(0xFF06D6A0);
  static const Color categoryEmergency = Color(0xFFE76F51);
  static const Color categoryCommunity = Color(0xFF9B59B6);
  static const Color categoryAnimal = Color(0xFFF4A261);
  static const Color categoryGeneral = Color(0xFF6B7280);
  
  /// Get color for a category
  static Color getCategoryColor(String category) {
    switch (category.toLowerCase()) {
      case 'health':
      case 'medical':
        return categoryHealth;
      case 'education':
        return categoryEducation;
      case 'environment':
      case 'climate':
        return categoryEnvironment;
      case 'emergency':
      case 'disaster':
        return categoryEmergency;
      case 'community':
      case 'social':
        return categoryCommunity;
      case 'animal':
      case 'wildlife':
        return categoryAnimal;
      default:
        return categoryGeneral;
    }
  }
}

