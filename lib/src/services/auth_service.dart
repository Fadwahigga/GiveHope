import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';
import '../utils/constants.dart';
import 'api_service.dart';

/// Service for handling authentication state
class AuthService extends ChangeNotifier {
  final ApiService _apiService;
  
  User? _currentUser;
  String? _token;
  bool _isLoading = false;
  String? _error;

  AuthService({ApiService? apiService}) 
      : _apiService = apiService ?? ApiService();

  // Getters
  User? get currentUser => _currentUser;
  String? get token => _token;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get isAuthenticated => _token != null && _currentUser != null;
  ApiService get apiService => _apiService;

  /// Initialize auth state from stored token
  Future<void> init() async {
    _isLoading = true;
    notifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      final storedToken = prefs.getString(AppConstants.keyAuthToken);
      
      if (storedToken != null) {
        _token = storedToken;
        _apiService.setAuthToken(storedToken);
        
        // Verify token by fetching current user
        try {
          _currentUser = await _apiService.getCurrentUser();
        } catch (_) {
          // Token invalid, clear it
          await _clearAuth();
        }
      }
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Register a new user
  Future<bool> register({
    required String email,
    required String password,
    String? name,
    String? phone,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final request = RegisterRequest(
        email: email,
        password: password,
        name: name,
        phone: phone,
      );
      
      final response = await _apiService.register(request);
      await _setAuth(response.token, response.user);
      return true;
    } on ApiException catch (e) {
      _error = e.message;
      return false;
    } catch (e) {
      _error = 'Registration failed. Please try again.';
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Login user
  Future<bool> login({
    required String email,
    required String password,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final request = LoginRequest(
        email: email,
        password: password,
      );
      
      final response = await _apiService.login(request);
      await _setAuth(response.token, response.user);
      return true;
    } on ApiException catch (e) {
      _error = e.message;
      return false;
    } catch (e) {
      _error = 'Login failed. Please try again.';
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Logout user
  Future<void> logout() async {
    await _clearAuth();
    notifyListeners();
  }

  /// Refresh current user data
  Future<void> refreshUser() async {
    if (_token == null) return;

    try {
      _currentUser = await _apiService.getCurrentUser();
      notifyListeners();
    } catch (_) {
      // Token might be expired
      await _clearAuth();
      notifyListeners();
    }
  }

  /// Set auth data
  Future<void> _setAuth(String token, User user) async {
    _token = token;
    _currentUser = user;
    _apiService.setAuthToken(token);
    
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(AppConstants.keyAuthToken, token);
  }

  /// Clear auth data
  Future<void> _clearAuth() async {
    _token = null;
    _currentUser = null;
    _apiService.setAuthToken(null);
    
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(AppConstants.keyAuthToken);
  }

  /// Clear error
  void clearError() {
    _error = null;
    notifyListeners();
  }

  @override
  void dispose() {
    _apiService.dispose();
    super.dispose();
  }
}

