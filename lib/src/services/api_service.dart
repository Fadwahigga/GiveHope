import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/models.dart';
import '../utils/constants.dart';

/// Custom exception for API errors
class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic data;

  ApiException(this.message, {this.statusCode, this.data});

  @override
  String toString() => 'ApiException: $message (status: $statusCode)';
}

/// API Service for communicating with the GiveHope backend
class ApiService {
  final String baseUrl;
  final http.Client _client;
  String? _authToken;

  ApiService({String? baseUrl, http.Client? client})
    : baseUrl = baseUrl ?? AppConstants.apiUrl,
      _client = client ?? http.Client();

  /// Set the authentication token
  void setAuthToken(String? token) {
    _authToken = token;
  }

  /// Get current auth token
  String? get authToken => _authToken;

  // ═══════════════════════════════════════════════════════════════
  // HTTP HELPERS
  // ═══════════════════════════════════════════════════════════════

  Map<String, String> get _headers {
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    if (_authToken != null) {
      headers['Authorization'] = 'Bearer $_authToken';
    }
    return headers;
  }

  Uri _buildUri(String endpoint, [Map<String, dynamic>? queryParams]) {
    final uri = Uri.parse('$baseUrl$endpoint');
    if (queryParams != null && queryParams.isNotEmpty) {
      return uri.replace(
        queryParameters: queryParams.map((k, v) => MapEntry(k, v.toString())),
      );
    }
    return uri;
  }

  /// Handle API response with {success, data, error, message} format
  Future<dynamic> _handleResponse(http.Response response) async {
    final statusCode = response.statusCode;
    dynamic body;

    try {
      body = response.body.isNotEmpty ? json.decode(response.body) : null;
    } catch (_) {
      body = response.body;
    }

    // Check for success field in response
    if (body is Map) {
      final success = body['success'] as bool? ?? false;

      if (success && statusCode >= 200 && statusCode < 300) {
        return body['data'];
      }

      // Extract error message
      final errorMessage =
          body['error'] as String? ??
          body['message'] as String? ??
          'An error occurred';
      throw ApiException(errorMessage, statusCode: statusCode, data: body);
    }

    if (statusCode >= 200 && statusCode < 300) {
      return body;
    }

    // Use generic error message - will be localized in UI layer
    throw ApiException('An error occurred', statusCode: statusCode, data: body);
  }

  Future<dynamic> _get(
    String endpoint, {
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await _client
          .get(_buildUri(endpoint, queryParams), headers: _headers)
          .timeout(AppConstants.apiTimeout);
      return _handleResponse(response);
    } on SocketException {
      // More generic error message for mobile networks
      throw ApiException(
        'Unable to connect to server. Please check your connection and try again.',
      );
    } on TimeoutException {
      throw ApiException('Request timed out. Please try again.');
    } on http.ClientException {
      throw ApiException('Network error. Please try again.');
    }
  }

  Future<dynamic> _post(String endpoint, {Map<String, dynamic>? body}) async {
    try {
      final response = await _client
          .post(
            _buildUri(endpoint),
            headers: _headers,
            body: body != null ? json.encode(body) : null,
          )
          .timeout(AppConstants.apiTimeout);
      return _handleResponse(response);
    } on SocketException {
      // More generic error message for mobile networks
      throw ApiException(
        'Unable to connect to server. Please check your connection and try again.',
      );
    } on TimeoutException {
      throw ApiException('Request timed out. Please try again.');
    } on http.ClientException {
      throw ApiException('Network error. Please try again.');
    }
  }

  Future<dynamic> _put(String endpoint, {Map<String, dynamic>? body}) async {
    try {
      final response = await _client
          .put(
            _buildUri(endpoint),
            headers: _headers,
            body: body != null ? json.encode(body) : null,
          )
          .timeout(AppConstants.apiTimeout);
      return _handleResponse(response);
    } on SocketException {
      // More generic error message for mobile networks
      throw ApiException(
        'Unable to connect to server. Please check your connection and try again.',
      );
    } on TimeoutException {
      throw ApiException('Request timed out. Please try again.');
    } on http.ClientException {
      throw ApiException('Network error. Please try again.');
    }
  }

  Future<dynamic> _delete(String endpoint) async {
    try {
      final response = await _client
          .delete(_buildUri(endpoint), headers: _headers)
          .timeout(AppConstants.apiTimeout);
      return _handleResponse(response);
    } on SocketException {
      // More generic error message for mobile networks
      throw ApiException(
        'Unable to connect to server. Please check your connection and try again.',
      );
    } on TimeoutException {
      throw ApiException('Request timed out. Please try again.');
    } on http.ClientException {
      throw ApiException('Network error. Please try again.');
    }
  }

  // ═══════════════════════════════════════════════════════════════
  // HEALTH CHECK
  // ═══════════════════════════════════════════════════════════════

  /// Check if API is running
  Future<bool> healthCheck() async {
    try {
      final response = await _client
          .get(Uri.parse('$baseUrl/health'), headers: _headers)
          .timeout(AppConstants.apiTimeout);
      final body = json.decode(response.body);
      return body['success'] == true;
    } catch (_) {
      return false;
    }
  }

  // ═══════════════════════════════════════════════════════════════
  // AUTHENTICATION API
  // ═══════════════════════════════════════════════════════════════

  /// Register a new user
  Future<AuthResponse> register(RegisterRequest request) async {
    final response = await _post('/auth/register', body: request.toJson());
    final authResponse = AuthResponse.fromJson(response);
    _authToken = authResponse.token;
    return authResponse;
  }

  /// Login user
  Future<AuthResponse> login(LoginRequest request) async {
    final response = await _post('/auth/login', body: request.toJson());
    final authResponse = AuthResponse.fromJson(response);
    _authToken = authResponse.token;
    return authResponse;
  }

  /// Get current authenticated user
  Future<User> getCurrentUser() async {
    final response = await _get('/auth/me');
    return User.fromJson(response);
  }

  /// Logout user (call API endpoint)
  ///
  /// Note: JWT is stateless, so logout is primarily client-side.
  /// This endpoint validates the token and logs the action for auditing.
  /// The actual logout happens by removing the token from storage.
  Future<void> logout() async {
    if (_authToken == null) return;

    try {
      // Call logout endpoint for validation/logging (JWT is stateless)
      await _post('/auth/logout');
    } catch (_) {
      // Continue with logout even if API call fails
      // The actual logout happens by removing the token
    } finally {
      // Remove token from memory (storage removal happens in AuthService)
      _authToken = null;
    }
  }

  // ═══════════════════════════════════════════════════════════════
  // CAUSES API
  // ═══════════════════════════════════════════════════════════════

  /// Create a new cause
  Future<Cause> createCause(CreateCauseRequest request) async {
    final response = await _post('/causes', body: request.toJson());
    return Cause.fromJson(response);
  }

  /// Fetch all causes
  Future<List<Cause>> fetchCauses() async {
    final response = await _get('/causes');

    if (response is List) {
      return response.map((json) => Cause.fromJson(json)).toList();
    }

    return [];
  }

  /// Get a single cause by ID
  Future<Cause> getCauseById(String id) async {
    final response = await _get('/causes/$id');
    return Cause.fromJson(response);
  }

  /// Update a cause
  Future<Cause> updateCause(
    String id, {
    String? name,
    String? description,
    String? ownerPhone,
  }) async {
    final body = <String, dynamic>{};
    if (name != null) body['name'] = name;
    if (description != null) body['description'] = description;
    if (ownerPhone != null) body['ownerPhone'] = ownerPhone;

    final response = await _put('/causes/$id', body: body);
    return Cause.fromJson(response);
  }

  /// Delete a cause
  Future<void> deleteCause(String id) async {
    await _delete('/causes/$id');
  }

  // ═══════════════════════════════════════════════════════════════
  // DONATIONS API
  // ═══════════════════════════════════════════════════════════════

  /// Create a donation (initiates MoMo payment)
  Future<DonationResponse> makeDonation(DonationRequest request) async {
    final response = await _post('/donate', body: request.toJson());
    return DonationResponse.fromJson(response);
  }

  /// Get a single donation by ID
  Future<Donation> getDonationById(String id) async {
    final response = await _get('/donations/$id');
    return Donation.fromJson(response);
  }

  /// Check and sync donation status from MoMo
  Future<Donation> checkDonationStatus(String id) async {
    final response = await _get('/donations/$id/status');
    return Donation.fromJson(response);
  }

  /// Fetch donations for a specific cause
  Future<List<Donation>> fetchDonationsByCause(String causeId) async {
    final response = await _get('/causes/$causeId/donations');

    if (response is Map && response.containsKey('donations')) {
      return (response['donations'] as List)
          .map((json) => Donation.fromJson(json))
          .toList();
    }

    return [];
  }

  /// Fetch donation history for a donor by phone number
  Future<List<Donation>> fetchDonorHistory(String phone) async {
    // URL encode the phone number
    final encodedPhone = Uri.encodeComponent(phone);
    final response = await _get('/donor/$encodedPhone/donations');

    if (response is Map && response.containsKey('donations')) {
      return (response['donations'] as List)
          .map((json) => Donation.fromJson(json))
          .toList();
    }

    return [];
  }

  // ═══════════════════════════════════════════════════════════════
  // PAYOUTS API
  // ═══════════════════════════════════════════════════════════════

  /// Create a payout (initiates MoMo transfer)
  Future<PayoutResponse> requestPayout(PayoutRequest request) async {
    final response = await _post('/payout', body: request.toJson());
    return PayoutResponse.fromJson(response);
  }

  /// Fetch payouts for a specific cause
  Future<List<Payout>> fetchPayoutsByCause(String causeId) async {
    final response = await _get('/payouts/$causeId');

    if (response is Map && response.containsKey('payouts')) {
      return (response['payouts'] as List)
          .map((json) => Payout.fromJson(json))
          .toList();
    }

    return [];
  }

  /// Get payout summary for a cause
  Future<CauseSummary> getPayoutSummary(String causeId) async {
    final response = await _get('/payouts/$causeId/summary');
    return CauseSummary.fromJson(response);
  }

  /// Get a single payout by ID
  Future<Payout> getPayoutById(String id) async {
    final response = await _get('/payouts/detail/$id');
    return Payout.fromJson(response);
  }

  /// Check and sync payout status from MoMo
  Future<Payout> checkPayoutStatus(String id) async {
    final response = await _get('/payouts/detail/$id/status');
    return Payout.fromJson(response);
  }

  /// Dispose of the HTTP client
  void dispose() {
    _client.close();
  }
}
