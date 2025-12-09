# GiveHope Frontend Stack

**Repository**: [https://github.com/Fadwahigga/GiveHope](https://github.com/Fadwahigga/GiveHope)

## Overview

GiveHope is a modern Flutter mobile application for donation and micro-payments, connecting generous donors with charitable causes. The frontend is built with Flutter and Dart, providing a beautiful, responsive, and localized user experience.

## Core Framework & Language

- **Flutter**: 3.x (Latest stable)
- **Dart**: 3.9.2+
- **Platform**: Cross-platform (iOS, Android, Web, Desktop)

## Architecture & State Management

### State Management
- **Provider** (v6.1.2): Reactive state management using the Provider pattern
  - `AuthService`: Manages user authentication state
  - `SettingsProvider`: Handles app settings (theme, locale)
  - `ChangeNotifierProvider`: For reactive UI updates

### Project Structure
```
lib/
├── main.dart                    # Application entry point
└── src/
    ├── models/                  # Data models (Cause, Donation, Payout, User)
    ├── services/                # Business logic & API integration
    │   ├── api_service.dart     # REST API client
    │   ├── auth_service.dart    # Authentication service
    │   ├── settings_provider.dart
    │   └── connectivity_service.dart
    ├── views/                   # UI screens
    │   ├── main_screen.dart
    │   ├── login_screen.dart
    │   ├── register_screen.dart
    │   ├── causes_list_screen.dart
    │   ├── cause_detail_screen.dart
    │   ├── donation_screen.dart
    │   ├── donation_history_screen.dart
    │   ├── payout_screen.dart
    │   └── settings_screen.dart
    ├── widgets/                 # Reusable UI components
    │   ├── primary_button.dart
    │   ├── custom_input_field.dart
    │   ├── cause_card.dart
    │   ├── donation_list_item.dart
    │   ├── app_banner.dart
    │   └── no_internet_screen.dart
    ├── theme/                   # Theming system
    │   ├── app_colors.dart
    │   ├── app_text_styles.dart
    │   └── app_theme.dart
    ├── l10n/                    # Localization
    │   ├── app_en.arb
    │   └── app_ar.arb
    └── utils/                   # Utilities
        ├── constants.dart
        ├── validators.dart
        ├── formatters.dart
        └── network_helper.dart
```

## Dependencies

### Core Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| `flutter` | SDK | Core Flutter framework |
| `flutter_localizations` | SDK | Localization support |
| `provider` | ^6.1.2 | State management |
| `http` | ^1.2.2 | HTTP client for API calls |
| `intl` | ^0.20.2 | Internationalization utilities |
| `shared_preferences` | ^2.3.3 | Local storage for user preferences |
| `cached_network_image` | ^3.4.1 | Image caching and loading |
| `connectivity_plus` | ^6.1.0 | Internet connectivity detection |

### Development Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| `flutter_test` | SDK | Testing framework |
| `flutter_lints` | ^5.0.0 | Linting rules and best practices |

## Key Features

### 1. Authentication
- User registration with email, password, name, and phone
- JWT-based authentication
- Secure token storage using `shared_preferences`
- Auto-login on app restart
- Logout with confirmation dialog

### 2. Cause Management
- Browse all causes
- View cause details
- Create new causes (for authenticated users)
- Update and delete causes (for owners)

### 3. Donation System
- Make donations to causes
- MTN Mobile Money integration (via backend)
- Real-time payment status tracking
- Donation history by phone number
- Optional donor messages

### 4. Payout Management
- View payout summary (total donations, payouts, balance)
- Request payouts for cause owners
- Track payout status
- View payout history

### 5. UI/UX Features
- **Responsive Design**: Adapts to different screen sizes
- **Light & Dark Themes**: System-aware theme switching
- **Beautiful Banner**: Scrollable feature showcase on home page
- **No Internet Handling**: Custom offline screen with retry functionality
- **Loading States**: Loading indicators for async operations
- **Error Handling**: User-friendly error messages and dialogs
- **Form Validation**: Real-time input validation

### 6. Localization
- **English** (default)
- **Arabic** with full RTL (Right-to-Left) support
- Language switcher in home, login, and register screens
- Dynamic font family based on locale
- All user-facing strings localized

### 7. Theming

#### Color Palette
- **Primary**: Teal (#2A9D8F) - Trust, growth, hope
- **Secondary**: Coral (#E76F51) - Warmth, compassion
- **Accent**: Gold (#F4A261) - Achievement, celebration
- **Semantic Colors**: Success, Warning, Error, Info

#### Theme Modes
- Light theme with soft, charity-friendly colors
- Dark theme with high contrast for accessibility
- System theme detection
- Manual theme toggle in settings

### 8. Network & Connectivity
- Internet connectivity detection
- Graceful offline handling
- Network error detection and categorization
- Retry mechanism for failed requests
- Custom no-internet screen with tips

## API Integration

### Base URL
```
https://donation-api-production-5b2a.up.railway.app/api/v1
```

### API Service Features
- RESTful API client using `http` package
- JWT token management
- Automatic token injection in headers
- Error handling and parsing
- Response validation
- Network error detection

### Endpoints Used
- **Authentication**: `/auth/register`, `/auth/login`, `/auth/me`, `/auth/logout`
- **Causes**: `/causes`, `/causes/:id`
- **Donations**: `/donate`, `/donations/:id`, `/donations/:id/status`, `/causes/:causeId/donations`, `/donor/:phone/donations`
- **Payouts**: `/payout`, `/payouts/:causeId`, `/payouts/:causeId/summary`, `/payouts/detail/:id`, `/payouts/detail/:id/status`

## Reusable Components

### Widgets
- `PrimaryButton`: Consistent button styling across the app
- `CustomInputField`: Text input with validation and error display
- `CauseCard`: Display cause information in list view
- `DonationListItem`: Display donation information
- `EmptyState`: Empty state placeholder with icon and message
- `AppBanner`: Scrollable feature banner with page indicators
- `NoInternetScreen`: Beautiful offline screen with retry button

### Utilities
- **Validators**: Email, phone, password, amount validation
- **Formatters**: Currency, date, phone number formatting
- **Constants**: App-wide constants and configuration
- **NetworkHelper**: Network error detection utilities

## Localization System

### Configuration
- Uses Flutter's built-in localization system
- ARB (Application Resource Bundle) files for translations
- Automatic code generation via `flutter gen-l10n`

### Supported Locales
- `en` (English) - Default
- `ar` (Arabic) - RTL support

### RTL Support
- Automatic layout direction based on locale
- RTL-aware icons and navigation
- Proper text alignment for Arabic

## Development Setup

### Prerequisites
- Flutter SDK 3.x
- Dart 3.9.2+
- Android Studio / VS Code with Flutter extensions
- iOS development tools (for iOS builds)

### Installation
```bash
# Clone the repository
git clone https://github.com/Fadwahigga/GiveHope.git
cd GiveHope

# Install dependencies
flutter pub get

# Generate localization files
flutter gen-l10n

# Run the app
flutter run
```

### Build Commands
```bash
# Debug build
flutter build apk --debug  # Android
flutter build ios --debug  # iOS

# Release build
flutter build apk --release  # Android
flutter build ios --release  # iOS
```

## Code Quality

### Linting
- Uses `flutter_lints` package
- Follows Flutter and Dart best practices
- Consistent code formatting

### Error Handling
- Try-catch blocks for async operations
- User-friendly error messages
- Network error detection and handling
- Graceful degradation for edge cases

## Performance Optimizations

- Image caching with `cached_network_image`
- Efficient state management with Provider
- Lazy loading for lists
- Optimized rebuilds with `watch` and `read`
- Local storage for preferences

## Security Features

- Secure token storage
- JWT authentication
- Input validation and sanitization
- HTTPS API communication
- No sensitive data in logs

## Testing

- Widget tests setup
- Test utilities available
- Mock API responses for testing

## Future Enhancements

- Push notifications for donation updates
- Offline mode with local caching
- Additional payment methods
- Share functionality for causes
- Analytics integration
- Admin panel integration
- Real-time updates via WebSocket
- Payment retry mechanism

## Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## Support

For support, email **fadwa.ali20@gmail.com** or open an issue in the [repository](https://github.com/Fadwahigga/GiveHope).

---

**Made with ❤️ for a better world**

