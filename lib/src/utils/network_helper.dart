import 'dart:io';
import '../services/api_service.dart';

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

  /// Extract user-friendly error message
  static String getErrorMessage(dynamic error) {
    if (error is ApiException) {
      return error.message;
    }
    
    if (error is SocketException) {
      return 'No internet connection. Please check your network.';
    }
    
    if (error is String) {
      return error;
    }
    
    return 'An unexpected error occurred. Please try again.';
  }
}

