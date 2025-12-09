import 'dart:io';
import '../services/api_service.dart';
import '../l10n/generated/app_localizations.dart';

/// Helper class for network-related utilities
class NetworkHelper {
  /// Check if an exception is a no-internet error
  // COMMENTED OUT: Internet connection check disabled
  static bool isNoInternetError(dynamic error) {
    // if (error is SocketException) {
    //   return true;
    // }

    // if (error is ApiException) {
    //   final message = error.message.toLowerCase();
    //   return message.contains('no internet') ||
    //       message.contains('network error') ||
    //       message.contains('connection');
    // }

    // if (error is String) {
    //   final message = error.toLowerCase();
    //   return message.contains('no internet') ||
    //       message.contains('network error') ||
    //       message.contains('connection');
    // }

    return false; // Always return false - no internet check
  }

  /// Extract user-friendly error message with localization
  static String getErrorMessage(dynamic error, AppLocalizations? l10n) {
    if (error is ApiException) {
      // Try to localize common error messages
      final message = error.message.toLowerCase();

      if (l10n != null) {
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
      }

      // Return original message if no localization match
      return error.message;
    }

    if (error is SocketException) {
      return l10n?.errorConnectionFailed ??
          'Unable to connect to server. Please check your connection and try again.';
    }

    if (error is String) {
      return error;
    }

    return l10n?.errorUnexpected ??
        'An unexpected error occurred. Please try again.';
  }
}
