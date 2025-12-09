/// Application constants
class AppConstants {
  AppConstants._();

  // ═══════════════════════════════════════════════════════════════
  // API CONFIGURATION
  // ═══════════════════════════════════════════════════════════════
  
  /// Base URL for the backend API
  /// TODO: Replace with your actual backend URL
  static const String apiBaseUrl = 'https://your-app.railway.app';
  
  /// API version prefix
  static const String apiVersion = '/api/v1';
  
  /// Full API URL
  static String get apiUrl => '$apiBaseUrl$apiVersion';
  
  /// API request timeout duration
  static const Duration apiTimeout = Duration(seconds: 30);

  // ═══════════════════════════════════════════════════════════════
  // APP INFO
  // ═══════════════════════════════════════════════════════════════
  
  static const String appName = 'GiveHope';
  static const String appVersion = '1.0.0';
  static const String appBuildNumber = '1';
  
  // ═══════════════════════════════════════════════════════════════
  // STORAGE KEYS
  // ═══════════════════════════════════════════════════════════════
  
  static const String keyThemeMode = 'theme_mode';
  static const String keyLocale = 'locale';
  static const String keyAuthToken = 'auth_token';
  static const String keyUserPhone = 'user_phone';
  static const String keyUserName = 'user_name';
  static const String keyOnboardingComplete = 'onboarding_complete';

  // ═══════════════════════════════════════════════════════════════
  // DONATION SETTINGS
  // ═══════════════════════════════════════════════════════════════
  
  /// Minimum donation amount
  static const double minDonationAmount = 100.0;
  
  /// Maximum donation amount
  static const double maxDonationAmount = 10000000.0;
  
  /// Quick donation amounts (in XAF)
  static const List<double> quickDonationAmounts = [500, 1000, 2500, 5000, 10000, 25000];
  
  /// Default currency
  static const String defaultCurrency = 'XAF';
  
  /// Currency symbol
  static const String currencySymbol = 'FCFA';

  // ═══════════════════════════════════════════════════════════════
  // PAYMENT STATUS POLLING
  // ═══════════════════════════════════════════════════════════════
  
  /// Interval between status polls (seconds)
  static const int paymentStatusPollInterval = 3;
  
  /// Maximum number of status polls before timeout
  static const int paymentStatusMaxPolls = 20;

  // ═══════════════════════════════════════════════════════════════
  // VALIDATION
  // ═══════════════════════════════════════════════════════════════
  
  /// Minimum phone number length
  static const int minPhoneLength = 9;
  
  /// Maximum phone number length
  static const int maxPhoneLength = 15;
  
  /// Minimum password length
  static const int minPasswordLength = 6;
  
  /// Maximum message length
  static const int maxMessageLength = 500;
  
  /// Maximum name length
  static const int maxNameLength = 100;

  // ═══════════════════════════════════════════════════════════════
  // ANIMATION DURATIONS
  // ═══════════════════════════════════════════════════════════════
  
  static const Duration animationFast = Duration(milliseconds: 150);
  static const Duration animationNormal = Duration(milliseconds: 300);
  static const Duration animationSlow = Duration(milliseconds: 500);

  // ═══════════════════════════════════════════════════════════════
  // MTN MOMO TEST PHONE NUMBERS
  // ═══════════════════════════════════════════════════════════════
  
  /// Test phone numbers for MTN MoMo sandbox
  static const List<String> momoTestPhones = [
    '+237670000001', // Success
    '+237670000002', // Success
    '+237670000003', // Pending
    '+237670000004', // Failed
  ];
}
