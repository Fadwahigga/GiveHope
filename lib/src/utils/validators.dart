import 'constants.dart';

/// Validation utilities for form inputs
class Validators {
  Validators._();

  /// Validates a phone number
  static String? validatePhone(String? value, {String? emptyMessage, String? invalidMessage}) {
    if (value == null || value.trim().isEmpty) {
      return emptyMessage ?? 'Phone number is required';
    }
    
    // Remove any non-digit characters for validation
    final digitsOnly = value.replaceAll(RegExp(r'[^\d+]'), '');
    
    if (digitsOnly.length < AppConstants.minPhoneLength) {
      return invalidMessage ?? 'Please enter a valid phone number';
    }
    
    if (digitsOnly.length > AppConstants.maxPhoneLength) {
      return invalidMessage ?? 'Phone number is too long';
    }
    
    // Basic phone number pattern (allows + prefix and digits)
    final phoneRegex = RegExp(r'^\+?[\d\s\-()]+$');
    if (!phoneRegex.hasMatch(value)) {
      return invalidMessage ?? 'Please enter a valid phone number';
    }
    
    return null;
  }

  /// Validates a donation amount
  static String? validateAmount(
    String? value, {
    String? emptyMessage,
    String? invalidMessage,
    String? minMessage,
    String? maxMessage,
    double? min,
    double? max,
  }) {
    if (value == null || value.trim().isEmpty) {
      return emptyMessage ?? 'Amount is required';
    }
    
    // Remove currency symbols and spaces
    final cleanValue = value.replaceAll(RegExp(r'[^\d.]'), '');
    
    final amount = double.tryParse(cleanValue);
    if (amount == null) {
      return invalidMessage ?? 'Please enter a valid amount';
    }
    
    final minAmount = min ?? AppConstants.minDonationAmount;
    final maxAmount = max ?? AppConstants.maxDonationAmount;
    
    if (amount < minAmount) {
      return minMessage ?? 'Minimum amount is ${AppConstants.currencySymbol}$minAmount';
    }
    
    if (amount > maxAmount) {
      return maxMessage ?? 'Maximum amount is ${AppConstants.currencySymbol}$maxAmount';
    }
    
    return null;
  }

  /// Validates an email address
  static String? validateEmail(String? value, {String? emptyMessage, String? invalidMessage}) {
    if (value == null || value.trim().isEmpty) {
      return emptyMessage ?? 'Email is required';
    }
    
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    
    if (!emailRegex.hasMatch(value.trim())) {
      return invalidMessage ?? 'Please enter a valid email address';
    }
    
    return null;
  }

  /// Validates a name field
  static String? validateName(String? value, {String? emptyMessage, String? invalidMessage, bool required = false}) {
    if (value == null || value.trim().isEmpty) {
      if (required) {
        return emptyMessage ?? 'Name is required';
      }
      return null; // Optional field
    }
    
    if (value.trim().length > AppConstants.maxNameLength) {
      return invalidMessage ?? 'Name is too long';
    }
    
    // Allow letters, spaces, hyphens, and apostrophes
    final nameRegex = RegExp(r"^[\p{L}\s\-']+$", unicode: true);
    if (!nameRegex.hasMatch(value.trim())) {
      return invalidMessage ?? 'Please enter a valid name';
    }
    
    return null;
  }

  /// Validates a message field
  static String? validateMessage(String? value, {String? tooLongMessage, int? maxLength}) {
    if (value == null || value.trim().isEmpty) {
      return null; // Messages are typically optional
    }
    
    final max = maxLength ?? AppConstants.maxMessageLength;
    if (value.length > max) {
      return tooLongMessage ?? 'Message is too long (max $max characters)';
    }
    
    return null;
  }

  /// Validates a required field
  static String? validateRequired(String? value, {String? message}) {
    if (value == null || value.trim().isEmpty) {
      return message ?? 'This field is required';
    }
    return null;
  }

  /// Validates a positive number
  static String? validatePositiveNumber(String? value, {String? emptyMessage, String? invalidMessage}) {
    if (value == null || value.trim().isEmpty) {
      return emptyMessage ?? 'This field is required';
    }
    
    final number = double.tryParse(value);
    if (number == null || number <= 0) {
      return invalidMessage ?? 'Please enter a valid positive number';
    }
    
    return null;
  }
}

