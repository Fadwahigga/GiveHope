import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';

/// Service for checking internet connectivity
class ConnectivityService {
  final Connectivity _connectivity = Connectivity();

  /// Check if device has internet connection
  /// Returns true if connected, false otherwise
  /// Uses multiple fallback servers and longer timeout for mobile networks
  Future<bool> hasInternetConnection() async {
    try {
      final connectivityResults = await _connectivity.checkConnectivity();
      
      // If no connectivity at all, return false
      if (connectivityResults.isEmpty || 
          connectivityResults.contains(ConnectivityResult.none)) {
        return false;
      }

      // Check if we can actually reach the internet
      // Try multiple reliable servers with longer timeout for mobile networks
      final servers = [
        'google.com',
        '8.8.8.8', // Google DNS
        'cloudflare.com',
      ];

      // Use longer timeout for mobile networks (10 seconds)
      const timeout = Duration(seconds: 10);

      for (final server in servers) {
        try {
          final result = await InternetAddress.lookup(server).timeout(timeout);
          if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
            return true;
          }
        } catch (_) {
          // Try next server
          continue;
        }
      }

      // If all servers failed, return false
      return false;
    } catch (_) {
      return false;
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

