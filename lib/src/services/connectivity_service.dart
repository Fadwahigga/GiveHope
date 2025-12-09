import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;

/// Service for checking internet connectivity
class ConnectivityService {
  final Connectivity _connectivity = Connectivity();
  final http.Client _httpClient = http.Client();

  /// Check if device has internet connection
  /// Returns true if connected, false otherwise
  /// Optimized for mobile networks with faster checks
  Future<bool> hasInternetConnection() async {
    try {
      final connectivityResults = await _connectivity.checkConnectivity();

      // If no connectivity at all, return false immediately
      if (connectivityResults.isEmpty ||
          connectivityResults.contains(ConnectivityResult.none)) {
        return false;
      }

      // For mobile networks, we'll do a quick check
      // Use a lightweight HTTP HEAD request with shorter timeout
      // This is faster and more reliable than DNS lookup on mobile
      try {
        // Try Google first (most reliable)
        final response = await _httpClient
            .head(Uri.parse('https://www.google.com'))
            .timeout(const Duration(seconds: 5));

        // Any response means we have internet
        return response.statusCode >= 100;
      } catch (e) {
        // If Google fails, try Cloudflare (backup)
        try {
          final response = await _httpClient
              .head(Uri.parse('https://1.1.1.1'))
              .timeout(const Duration(seconds: 5));

          return response.statusCode >= 100;
        } catch (_) {
          // If both fail, but we have connectivity type, assume we have internet
          // The actual API calls will determine if there's real internet
          // This prevents false negatives on slow mobile networks
          return connectivityResults.contains(ConnectivityResult.mobile) ||
              connectivityResults.contains(ConnectivityResult.wifi) ||
              connectivityResults.contains(ConnectivityResult.ethernet);
        }
      }
    } catch (_) {
      // On any error, check if we have a connectivity type
      // This is a fallback for slow networks
      try {
        final connectivityResults = await _connectivity.checkConnectivity();
        return connectivityResults.contains(ConnectivityResult.mobile) ||
            connectivityResults.contains(ConnectivityResult.wifi) ||
            connectivityResults.contains(ConnectivityResult.ethernet);
      } catch (_) {
        return false;
      }
    }
  }

  /// Stream of connectivity changes
  Stream<List<ConnectivityResult>> get onConnectivityChanged =>
      _connectivity.onConnectivityChanged;

  /// Check current connectivity status
  Future<List<ConnectivityResult>> checkConnectivity() async {
    return await _connectivity.checkConnectivity();
  }
}
