import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';

/// Service for checking internet connectivity
class ConnectivityService {
  final Connectivity _connectivity = Connectivity();

  /// Check if device has internet connection
  /// Returns true if connected, false otherwise
  Future<bool> hasInternetConnection() async {
    try {
      final connectivityResults = await _connectivity.checkConnectivity();
      
      // If no connectivity at all, return false
      if (connectivityResults.isEmpty || 
          connectivityResults.contains(ConnectivityResult.none)) {
        return false;
      }

      // Check if we can actually reach the internet
      // by trying to connect to a reliable server
      try {
        final result = await InternetAddress.lookup('google.com')
            .timeout(const Duration(seconds: 3));
        return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
      } catch (_) {
        return false;
      }
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

