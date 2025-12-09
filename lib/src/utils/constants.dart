/// Application constants
class AppConstants {
  AppConstants._();

  // ═══════════════════════════════════════════════════════════════
  // API CONFIGURATION
  // ═══════════════════════════════════════════════════════════════

  /// Base URL for the backend API
  static const String apiBaseUrl =
      'https://donation-api-production-5b2a.up.railway.app';

  /// API version prefix
  static const String apiVersion = '/api/v1';

  /// Full API URL
  static String get apiUrl => '$apiBaseUrl$apiVersion';

  /// API request timeout duration
  /// Increased for mobile networks which can be slower
  static const Duration apiTimeout = Duration(seconds: 45);

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
  static const List<double> quickDonationAmounts = [
    500,
    1000,
    2500,
    5000,
    10000,
    25000,
  ];

  /// Default currency
  static const String defaultCurrency = 'XAF';

  /// Currency symbol
  static const String currencySymbol = 'FCFA';

  /// Supported currencies by MTN MoMo API
  static const List<String> supportedCurrencies = [
    'XAF', // Central African CFA Franc (Cameroon, Chad, Central African Republic, etc.)
    'XOF', // West African CFA Franc (Côte d'Ivoire, Senegal, etc.)
    'UGX', // Ugandan Shilling
    'GHS', // Ghanaian Cedi
    'ZAR', // South African Rand
    'NGN', // Nigerian Naira
    'ZMW', // Zambian Kwacha
    'RWF', // Rwandan Franc
    'TZS', // Tanzanian Shilling
    'KES', // Kenyan Shilling
    'ETB', // Ethiopian Birr
    'MWK', // Malawian Kwacha
    'MZN', // Mozambican Metical
    'USD', // US Dollar (if supported in your region)
    'EUR', // Euro (if supported in your region)
    'GBP', // British Pound (if supported in your region)
  ];

  /// Get currency symbol for a given currency code
  static String getCurrencySymbol(String currency) {
    switch (currency) {
      case 'XAF':
        return 'FCFA';
      case 'XOF':
        return 'FCFA';
      case 'UGX':
        return 'USh';
      case 'GHS':
        return '₵';
      case 'ZAR':
        return 'R';
      case 'NGN':
        return '₦';
      case 'ZMW':
        return 'ZK';
      case 'RWF':
        return 'RF';
      case 'TZS':
        return 'TSh';
      case 'KES':
        return 'KSh';
      case 'ETB':
        return 'Br';
      case 'MWK':
        return 'MK';
      case 'MZN':
        return 'MT';
      case 'USD':
        return '\$';
      case 'EUR':
        return '€';
      case 'GBP':
        return '£';
      default:
        return currency;
    }
  }

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
