import 'package:intl/intl.dart';
import 'constants.dart';

/// Formatting utilities for displaying data
class Formatters {
  Formatters._();

  // ═══════════════════════════════════════════════════════════════
  // CURRENCY FORMATTING
  // ═══════════════════════════════════════════════════════════════

  /// Formats a number as currency
  static String formatCurrency(
    double amount, {
    String? symbol,
    int decimalDigits = 2,
  }) {
    final currencySymbol = symbol ?? AppConstants.currencySymbol;
    final formatter = NumberFormat.currency(
      symbol: currencySymbol,
      decimalDigits: decimalDigits,
    );
    return formatter.format(amount);
  }

  /// Formats a number as compact currency (e.g., $1.2K, $3.5M)
  static String formatCompactCurrency(double amount, {String? symbol}) {
    final currencySymbol = symbol ?? AppConstants.currencySymbol;
    final formatter = NumberFormat.compactCurrency(
      symbol: currencySymbol,
      decimalDigits: 1,
    );
    return formatter.format(amount);
  }

  /// Formats a number as currency without decimal places
  static String formatCurrencyWhole(double amount, {String? symbol}) {
    return formatCurrency(amount, symbol: symbol, decimalDigits: 0);
  }

  // ═══════════════════════════════════════════════════════════════
  // NUMBER FORMATTING
  // ═══════════════════════════════════════════════════════════════

  /// Formats a number with thousand separators
  static String formatNumber(num number, {int decimalDigits = 0}) {
    final formatter = NumberFormat(
      '#,##0${decimalDigits > 0 ? '.${'0' * decimalDigits}' : ''}',
    );
    return formatter.format(number);
  }

  /// Formats a number as compact (e.g., 1.2K, 3.5M)
  static String formatCompact(num number) {
    final formatter = NumberFormat.compact();
    return formatter.format(number);
  }

  /// Formats a percentage (0-1 range to 0-100%)
  static String formatPercentage(double value, {int decimalDigits = 1}) {
    final percentage = (value * 100).clamp(0.0, 100.0);
    return '${percentage.toStringAsFixed(decimalDigits)}%';
  }

  // ═══════════════════════════════════════════════════════════════
  // DATE/TIME FORMATTING
  // ═══════════════════════════════════════════════════════════════

  /// Formats a date in the default format (e.g., Jan 15, 2024)
  static String formatDate(DateTime date, {String? locale}) {
    final formatter = DateFormat.yMMMd(locale);
    return formatter.format(date);
  }

  /// Formats a date as a short date (e.g., 01/15/24)
  static String formatDateShort(DateTime date, {String? locale}) {
    final formatter = DateFormat.yMd(locale);
    return formatter.format(date);
  }

  /// Formats a date with full month name (e.g., January 15, 2024)
  static String formatDateLong(DateTime date, {String? locale}) {
    final formatter = DateFormat.yMMMMd(locale);
    return formatter.format(date);
  }

  /// Formats time (e.g., 2:30 PM)
  static String formatTime(DateTime time, {String? locale}) {
    final formatter = DateFormat.jm(locale);
    return formatter.format(time);
  }

  /// Formats date and time (e.g., Jan 15, 2024 at 2:30 PM)
  static String formatDateTime(DateTime dateTime, {String? locale}) {
    return '${formatDate(dateTime, locale: locale)} at ${formatTime(dateTime, locale: locale)}';
  }

  /// Formats a relative time (e.g., "2 hours ago", "just now")
  static String formatRelativeTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.isNegative) {
      return 'in the future';
    }

    if (difference.inSeconds < 60) {
      return 'just now';
    }

    if (difference.inMinutes < 60) {
      final minutes = difference.inMinutes;
      return '$minutes ${minutes == 1 ? 'minute' : 'minutes'} ago';
    }

    if (difference.inHours < 24) {
      final hours = difference.inHours;
      return '$hours ${hours == 1 ? 'hour' : 'hours'} ago';
    }

    if (difference.inDays < 7) {
      final days = difference.inDays;
      return '$days ${days == 1 ? 'day' : 'days'} ago';
    }

    if (difference.inDays < 30) {
      final weeks = (difference.inDays / 7).floor();
      return '$weeks ${weeks == 1 ? 'week' : 'weeks'} ago';
    }

    if (difference.inDays < 365) {
      final months = (difference.inDays / 30).floor();
      return '$months ${months == 1 ? 'month' : 'months'} ago';
    }

    final years = (difference.inDays / 365).floor();
    return '$years ${years == 1 ? 'year' : 'years'} ago';
  }

  // ═══════════════════════════════════════════════════════════════
  // PHONE FORMATTING
  // ═══════════════════════════════════════════════════════════════

  /// Formats a phone number for display
  static String formatPhone(String phone) {
    // Remove all non-digit characters except +
    final cleaned = phone.replaceAll(RegExp(r'[^\d+]'), '');

    // If it starts with +, keep it
    if (cleaned.startsWith('+')) {
      final digits = cleaned.substring(1);
      if (digits.length >= 10) {
        // Format as +X XXX XXX XXXX or similar
        return '+${digits.substring(0, digits.length - 7)} ${digits.substring(digits.length - 7, digits.length - 4)} ${digits.substring(digits.length - 4)}';
      }
      return cleaned;
    }

    // US format: (XXX) XXX-XXXX
    if (cleaned.length == 10) {
      return '(${cleaned.substring(0, 3)}) ${cleaned.substring(3, 6)}-${cleaned.substring(6)}';
    }

    return phone;
  }

  /// Masks a phone number for privacy (e.g., +****1234 or ****1234)
  static String maskPhone(String phone, {int visibleDigits = 4}) {
    // Check if phone starts with +
    final hasPlus = phone.trim().startsWith('+');

    // Remove all non-digit characters
    final digits = phone.replaceAll(RegExp(r'[^\d]'), '');

    if (digits.length <= visibleDigits) {
      return hasPlus ? '+${'*' * digits.length}' : '*' * digits.length;
    }

    final masked = '*' * (digits.length - visibleDigits);
    final visible = digits.substring(digits.length - visibleDigits);

    // Preserve + at the beginning if it existed
    return hasPlus ? '+$masked$visible' : '$masked$visible';
  }

  // ═══════════════════════════════════════════════════════════════
  // STRING UTILITIES
  // ═══════════════════════════════════════════════════════════════

  /// Truncates text with ellipsis
  static String truncate(
    String text,
    int maxLength, {
    String ellipsis = '...',
  }) {
    if (text.length <= maxLength) {
      return text;
    }
    return '${text.substring(0, maxLength - ellipsis.length)}$ellipsis';
  }

  /// Capitalizes the first letter of each word
  static String titleCase(String text) {
    if (text.isEmpty) return text;
    return text
        .split(' ')
        .map((word) {
          if (word.isEmpty) return word;
          return word[0].toUpperCase() + word.substring(1).toLowerCase();
        })
        .join(' ');
  }

  /// Capitalizes only the first letter
  static String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }
}
