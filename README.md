# GiveHope

A modern Flutter mobile application for donation and micro-payments, connecting generous donors with charitable causes.

![Flutter](https://img.shields.io/badge/Flutter-3.x-blue.svg)
![Dart](https://img.shields.io/badge/Dart-3.x-blue.svg)
![License](https://img.shields.io/badge/License-MIT-green.svg)

## Overview

GiveHope is a donation/micro-payments mobile app that allows users to:
- Browse and discover charitable causes
- Make donations to causes they care about
- Track their donation history
- For cause owners: manage received donations and request payouts

The app connects to a REST API backend to manage causes, donations, payouts, and more. **Payment processing is handled via MTN Mobile Money (MoMo) APIs** integrated through the backend.

## Features

- **Cause Discovery**: Browse, search, and filter charitable causes by category
- **Secure Donations**: Make donations with optional messages of support
- **MTN Mobile Money Integration**: Process payments via MTN MoMo API (donations & payouts)
- **Donation History**: Track all your past donations by phone number
- **Payout Management**: Cause owners can request payouts for collected funds
- **Real-time Payment Status**: Poll payment status and show updates
- **Theming**: Light and Dark mode support with beautiful, modern UI
- **Localization**: Full support for English and Arabic (RTL)
- **Responsive Design**: Adapts to different screen sizes and orientations
- **No Internet Handling**: Beautiful offline screen with retry functionality

## Project Structure

```
lib/
├── main.dart                    # Application entry point
└── src/
    ├── models/                  # Data models
    │   ├── cause.dart           # Cause model
    │   ├── donation.dart        # Donation model
    │   ├── payout.dart          # Payout model
    │   ├── user.dart            # User model
    │   └── models.dart          # Export file
    │
    ├── services/                # API services
    │   ├── api_service.dart     # REST API client
    │   ├── auth_service.dart    # Authentication service
    │   ├── settings_provider.dart # Settings state management
    │   ├── connectivity_service.dart # Internet connectivity checking
    │   └── services.dart        # Export file
    │
    ├── views/                   # UI screens
    │   ├── main_screen.dart     # Main navigation screen
    │   ├── login_screen.dart    # Login screen
    │   ├── register_screen.dart # Registration screen
    │   ├── causes_list_screen.dart
    │   ├── create_cause_screen.dart
    │   ├── cause_detail_screen.dart
    │   ├── donation_screen.dart
    │   ├── donation_history_screen.dart
    │   ├── payout_screen.dart
    │   ├── settings_screen.dart
    │   └── views.dart           # Export file
    │
    ├── widgets/                 # Reusable UI components
    │   ├── primary_button.dart
    │   ├── custom_input_field.dart
    │   ├── cause_card.dart
    │   ├── donation_list_item.dart
    │   ├── empty_state.dart
    │   ├── app_banner.dart      # Scrollable feature banner
    │   ├── no_internet_screen.dart # No internet connection screen
    │   └── widgets.dart         # Export file
    │
    ├── theme/                   # Theme definitions
    │   ├── app_colors.dart      # Color palette
    │   ├── app_text_styles.dart # Typography
    │   ├── app_theme.dart       # Theme data
    │   └── theme.dart           # Export file
    │
    ├── l10n/                    # Localization
    │   ├── app_en.arb           # English translations
    │   └── app_ar.arb           # Arabic translations
    │
    └── utils/                   # Utilities
        ├── constants.dart       # App constants
        ├── validators.dart      # Form validators
        ├── formatters.dart      # Data formatters
        ├── network_helper.dart  # Network error detection
        └── utils.dart           # Export file

assets/
├── images/                      # Image assets
├── icons/                       # Icon assets
└── fonts/                       # Font files
```

## Getting Started

### Prerequisites

- Flutter SDK 3.x or higher
- Dart SDK 3.x or higher
- Android Studio / VS Code with Flutter extensions
- A running backend API (see Backend Configuration)

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd give_hope
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Add required fonts** (download from Google Fonts)
   
   Place the following font files in `assets/fonts/`:
   - Poppins: Regular, Medium, SemiBold, Bold
   - Cairo: Regular, Medium, SemiBold, Bold (for Arabic)

4. **Configure the backend URL**
   
   Edit `lib/src/utils/constants.dart`:
   ```dart
   static const String apiBaseUrl = 'https://your-api-url.com';
   ```
   
   **Note:** Your backend must be configured to handle MTN MoMo API calls. See the [MTN MoMo Integration](#payment-integration-mtn-mobile-money-momo) section below.

5. **Set up MTN MoMo (Optional - for payment processing)**
   
   If you want to enable payment processing:
   - Register at [MTN Developer Portal](https://momodeveloper.mtn.com/)
   - Configure your backend with MTN MoMo credentials
   - See detailed setup in the [MTN MoMo Integration](#payment-integration-mtn-mobile-money-momo) section

6. **Run the app**
   ```bash
   # Debug mode
   flutter run

   # Release mode
   flutter run --release
   ```

### Generate Localization Files (Optional)

If you modify the ARB files, regenerate localizations:
```bash
flutter gen-l10n
```

## Backend Tech Stack

Complete overview of all technologies, frameworks, libraries, and tools used in this backend API.

**Repository**: [https://github.com/Fadwahigga/donation-api](https://github.com/Fadwahigga/donation-api)

### Core Technologies

#### Runtime & Language

- **Node.js** - JavaScript runtime environment
- **TypeScript** v5.3.3 - Typed superset of JavaScript
- **ES2020** - ECMAScript 2020 target version

#### Framework

- **Express.js** v4.18.2 - Web application framework for Node.js
  - Handles HTTP requests and routing
  - Middleware support
  - RESTful API architecture

### Database & ORM

#### Database

- **MySQL** - Relational database management system
  - Used via Railway's MySQL service
  - Supports transactions and ACID compliance

#### ORM

- **Prisma** v5.7.0
  - Type-safe database client
  - Schema management and migrations
  - Query builder with TypeScript support
  - `@prisma/client` v5.7.0 - Prisma Client library

### Authentication & Security

- **JWT (JSON Web Tokens)** - `jsonwebtoken` v9.0.3
  - Token-based authentication
  - Token generation and verification
  - Stateless authentication

- **bcryptjs** v3.0.3
  - Password hashing and verification
  - Secure password storage
  - Salt rounds: 10

### HTTP & API

- **axios** v1.6.2
  - HTTP client for external API calls
  - Used for MoMo API integration
  - Promise-based requests

- **cors** v2.8.5
  - Cross-Origin Resource Sharing middleware
  - Configurable allowed origins
  - Production and development CORS handling

### Utilities

- **uuid** v9.0.1
  - Generate unique identifiers
  - Used for donation/payout external IDs

- **dotenv** v16.3.1
  - Environment variable management
  - Loads `.env` files in development

### Development Tools

#### TypeScript Support

- **TypeScript** v5.3.3 - Type checking and compilation
- **@types/node** v20.10.4 - Node.js type definitions
- **@types/express** v4.17.21 - Express.js type definitions
- **@types/bcryptjs** v2.4.6 - bcryptjs type definitions
- **@types/jsonwebtoken** v9.0.10 - JWT type definitions
- **@types/cors** v2.8.17 - CORS type definitions
- **@types/uuid** v9.0.7 - UUID type definitions

#### Development Server

- **ts-node-dev** v2.0.0
  - Development server with hot reload
  - TypeScript execution without compilation
  - Auto-restart on file changes

### Project Structure

```
src/
├── config/           # Configuration files
│   ├── database.ts   # Prisma client setup
│   └── env.ts        # Environment variables
├── controllers/      # Request handlers
│   ├── authController.ts
│   ├── causeController.ts
│   ├── donationController.ts
│   ├── payoutController.ts
│   └── webhookController.ts
├── middleware/       # Express middleware
│   ├── auth.ts       # JWT authentication
│   ├── errorHandler.ts
│   └── validators.ts
├── routes/           # API routes
│   ├── authRoutes.ts
│   ├── causeRoutes.ts
│   ├── donationRoutes.ts
│   ├── payoutRoutes.ts
│   └── webhookRoutes.ts
├── services/         # Business logic
│   ├── authService.ts
│   ├── causeService.ts
│   ├── donationService.ts
│   ├── momoService.ts
│   └── payoutService.ts
├── types/            # TypeScript interfaces
│   └── index.ts
├── utils/            # Utility functions
│   └── logger.ts
└── index.ts          # Application entry point
```

### External Integrations

#### Payment Gateway

- **MTN Mobile Money (MoMo) API**
  - Collection API (Request to Pay)
  - Disbursement API (Transfer)
  - Webhook callbacks for payment status
  - Sandbox and Production environments

### Database Models

1. **User** - User accounts and authentication
2. **Cause** - Donation causes/creators
3. **Donation** - Donation transactions
4. **Payout** - Fund disbursements to cause owners

### Deployment

#### Platform

- **Railway.app** - Cloud hosting platform
  - Automatic deployments from GitHub
  - MySQL database service
  - Environment variable management
  - HTTPS/SSL certificates

#### Build Process

- TypeScript compilation (`tsc`)
- Prisma Client generation
- Node.js production server

### API Features

#### Authentication

- User registration
- User login
- User logout
- JWT token-based authentication
- Protected routes with middleware

#### Core Features

- CRUD operations for causes
- Donation management
- Payout processing
- Payment status tracking
- Webhook handling for MoMo callbacks

#### API Architecture

- RESTful API design
- JSON request/response format
- Standardized error handling
- Input validation
- CORS support

### Key Features

- Type-safe with TypeScript
- Structured error handling
- Input validation middleware
- Authentication & authorization
- Database migrations
- Payment gateway integration
- Webhook support
- Logging system
- Environment-based configuration

### TypeScript Configuration

- **Target**: ES2020
- **Module**: CommonJS
- **Strict mode**: Enabled
- **Source maps**: Enabled
- **Declaration files**: Generated

### Scripts

- `npm run dev` - Development server with hot reload
- `npm run build` - Build for production (Prisma + TypeScript)
- `npm start` - Start production server
- `npm run prisma:generate` - Generate Prisma Client
- `npm run prisma:migrate` - Create migration (development)
- `npm run prisma:migrate:prod` - Deploy migrations (production)
- `npm run prisma:studio` - Open Prisma Studio (database GUI)

### Environment Variables

Required environment variables:

- `DATABASE_URL` - MySQL connection string
- `JWT_SECRET` - Secret key for JWT tokens
- `JWT_EXPIRES_IN` - Token expiration time
- `PORT` - Server port (default: 3000)
- `NODE_ENV` - Environment (development/production)
- `MOMO_BASE_URL` - MoMo API base URL
- `MOMO_SUBSCRIPTION_KEY` - MoMo subscription key
- `MOMO_API_USER_ID` - MoMo API user ID
- `MOMO_API_KEY` - MoMo API key
- `MOMO_TARGET_ENVIRONMENT` - MoMo environment (sandbox/production)
- `MOMO_COLLECTION_CALLBACK_URL` - Webhook URL for collections
- `MOMO_DISBURSEMENT_CALLBACK_URL` - Webhook URL for disbursements
- `ALLOWED_ORIGINS` - CORS allowed origins (optional)

### Dependencies Summary

#### Production Dependencies (9 packages)

- @prisma/client, axios, bcryptjs, cors, dotenv, express, jsonwebtoken, uuid

#### Development Dependencies (8 packages)

- TypeScript, Prisma CLI, ts-node-dev, and type definitions

### Security Features

- Password hashing with bcrypt
- JWT token authentication
- Input validation
- CORS protection
- Error handling that doesn't leak sensitive info
- Environment variable management

### API Endpoints

- **Authentication**: `/api/v1/auth/*`
- **Causes**: `/api/v1/causes/*`
- **Donations**: `/api/v1/donate`, `/api/v1/donations/*`
- **Payouts**: `/api/v1/payout`, `/api/v1/payouts/*`
- **Webhooks**: `/api/v1/webhooks/momo/*`
- **Health Check**: `/api/v1/health`

## Payment Integration: MTN Mobile Money (MoMo)

> **Note:** This section describes how to integrate MTN Mobile Money for processing donations and payouts. The Flutter app communicates with your backend API, which handles all MTN MoMo API calls securely.

GiveHope integrates with **MTN Mobile Money APIs** to process donations and payouts securely. This allows users to make donations directly from their MTN MoMo accounts.

### MTN MoMo API Overview

The app uses MTN's Mobile Money API for:
- **Donations**: Users can pay for donations using their MTN MoMo account
- **Payouts**: Cause owners can receive payouts directly to their MTN MoMo accounts

### Setup & Configuration

#### 1. MTN Developer Account Setup

1. **Register for MTN Developer Account**
   - Visit [MTN Developer Portal](https://momodeveloper.mtn.com/)
   - Create an account and register your application
   - Get your API credentials:
     - `subscriptionKey` (Primary or Secondary)
     - `apiUser` and `apiKey`
     - `targetEnvironment` (sandbox or production)

2. **Configure Environment Variables**

   Create a `.env` file in the project root (add to `.gitignore`):
   ```env
   # MTN MoMo Configuration
   MTN_MOMO_SUBSCRIPTION_KEY=your_subscription_key
   MTN_MOMO_API_USER=your_api_user
   MTN_MOMO_API_KEY=your_api_key
   MTN_MOMO_TARGET_ENVIRONMENT=sandbox  # or 'production'
   MTN_MOMO_BASE_URL=https://sandbox.momodeveloper.mtn.com  # or production URL
   ```

#### 2. Backend Integration

The backend should handle MTN MoMo API calls. The Flutter app sends donation requests to your backend, which then processes payments via MTN MoMo.

**Backend Payment Flow:**
```
1. User initiates donation in Flutter app
2. App sends donation request to your backend API
3. Backend creates payment request with MTN MoMo API
4. MTN MoMo sends payment prompt to user's phone
5. User approves payment on their phone
6. MTN MoMo sends callback to your backend
7. Backend updates donation status
8. Flutter app receives updated donation status
```

#### 3. MTN MoMo API Endpoints (Backend Implementation)

Your backend should implement these MTN MoMo endpoints:

**Request to Pay (Donations):**
```http
POST /collection/v1_0/requesttopay
Content-Type: application/json
X-Target-Environment: sandbox
Authorization: Bearer {access_token}
X-Reference-Id: {unique_reference_id}
X-Callback-Url: https://your-backend.com/api/momo/callback

{
  "amount": "50.00",
  "currency": "EUR",
  "externalId": "donation_12345",
  "payer": {
    "partyIdType": "MSISDN",
    "partyId": "46733123450"
  },
  "payerMessage": "Donation to GiveHope",
  "payeeNote": "Thank you for your donation"
}
```

**Disburse (Payouts):**
```http
POST /disbursement/v1_0/transfer
Content-Type: application/json
X-Target-Environment: sandbox
Authorization: Bearer {access_token}
X-Reference-Id: {unique_reference_id}
X-Callback-Url: https://your-backend.com/api/momo/callback

{
  "amount": "100.00",
  "currency": "EUR",
  "externalId": "payout_67890",
  "payee": {
    "partyIdType": "MSISDN",
    "partyId": "46733123450"
  },
  "payerMessage": "Payout from GiveHope",
  "payeeNote": "Funds from your cause"
}
```

**Get Transaction Status:**
```http
GET /collection/v1_0/requesttopay/{referenceId}
Authorization: Bearer {access_token}
X-Target-Environment: sandbox
```

#### 4. Flutter App Configuration

Update `lib/src/utils/constants.dart` to include MTN MoMo settings:

```dart
class AppConstants {
  // ... existing code ...
  
  // MTN MoMo Configuration
  static const String momoCurrency = 'EUR'; // or 'UGX', 'ZMW', etc.
  static const String momoPaymentProvider = 'MTN_MOMO';
  
  // Payment status polling interval (seconds)
  static const int paymentStatusPollInterval = 3;
  static const int paymentStatusMaxPolls = 20; // 1 minute total
}
```

#### 5. Update Donation Model

The donation model already supports payment methods. Ensure your backend returns:

```json
{
  "id": "donation_123",
  "cause_id": "cause_456",
  "amount": 50.00,
  "donor_phone": "46733123450",
  "status": "pending",
  "payment_method": "MTN_MOMO",
  "transaction_id": "momo_ref_789",
  "created_at": "2024-01-15T10:30:00Z"
}
```

### Payment Flow Implementation

#### Step 1: Initiate Donation

When user submits donation form:

```dart
// In donation_screen.dart
Future<void> _submitDonation() async {
  // 1. Create donation request
  final request = DonationRequest(
    causeId: widget.cause.id,
    amount: double.parse(_amountController.text),
    donorPhone: _phoneController.text.trim(),
    donorName: _nameController.text.trim(),
    message: _messageController.text.trim(),
  );

  // 2. Send to backend (backend handles MTN MoMo)
  final donation = await _apiService.makeDonation(request);
  
  // 3. Backend will:
  //    - Create MTN MoMo payment request
  //    - Send payment prompt to user's phone
  //    - Return donation with status "pending"
  
  // 4. Poll for payment status
  await _pollPaymentStatus(donation.id);
}
```

#### Step 2: Poll Payment Status

```dart
Future<void> _pollPaymentStatus(String donationId) async {
  int polls = 0;
  
  while (polls < AppConstants.paymentStatusMaxPolls) {
    await Future.delayed(
      Duration(seconds: AppConstants.paymentStatusPollInterval),
    );
    
    final donation = await _apiService.getDonationById(donationId);
    
    if (donation.status == DonationStatus.completed) {
      // Payment successful!
      _showSuccessDialog();
      return;
    } else if (donation.status == DonationStatus.failed) {
      // Payment failed
      _showErrorDialog('Payment failed. Please try again.');
      return;
    }
    
    polls++;
  }
  
  // Timeout - ask user to check their phone
  _showTimeoutDialog();
}
```

### Testing MTN MoMo Integration

#### Sandbox Testing

1. **Use MTN Sandbox Environment**
   - Set `MTN_MOMO_TARGET_ENVIRONMENT=sandbox`
   - Use sandbox test numbers provided by MTN

2. **Test Numbers** (Example - use MTN's actual test numbers):
   ```
   Test Payer: 46733123450
   Test Payee: 46733123451
   ```

3. **Test Scenarios**:
   - Successful payment
   - Insufficient funds
   - User cancellation
   - Network timeout
   - Invalid phone number

#### Production Checklist

Before going live:
- [ ] Switch to production environment
- [ ] Update API credentials
- [ ] Configure production callback URLs
- [ ] Test with real MTN MoMo accounts
- [ ] Implement proper error handling
- [ ] Set up payment status monitoring
- [ ] Configure webhook security

### Security Considerations

1. **Never store MTN credentials in the Flutter app**
   - All MTN API calls should be made from your backend
   - Use environment variables on the backend

2. **Validate phone numbers**
   - Ensure phone numbers are in correct format (MSISDN)
   - Validate country codes

3. **Secure callbacks**
   - Use HTTPS for callback URLs
   - Implement signature verification for webhooks
   - Validate callback data before processing

4. **Transaction references**
   - Use unique, non-guessable reference IDs
   - Store references in your database

### Error Handling

Common MTN MoMo errors and handling:

```dart
// In api_service.dart
try {
  await _apiService.makeDonation(request);
} on ApiException catch (e) {
  if (e.statusCode == 400) {
    // Invalid request (wrong phone format, amount, etc.)
    _showError('Please check your phone number and amount');
  } else if (e.statusCode == 401) {
    // Authentication failed
    _showError('Payment service unavailable. Please try later.');
  } else if (e.statusCode == 409) {
    // Duplicate transaction
    _showError('This transaction already exists');
  } else {
    _showError('Payment failed. Please try again.');
  }
}
```

### MTN MoMo Supported Countries

- Uganda (UGX)
- Ghana (GHS)
- Zambia (ZMW)
- Côte d'Ivoire (XOF)
- Cameroon (XAF)
- Benin (XOF)
- Guinea-Bissau (XOF)
- Mozambique (MZN)
- Rwanda (RWF)
- Eswatini (SZL)
- Gabon (XAF)
- Congo (XAF)
- Sierra Leone (SLL)
- Senegal (XOF)
- Guinea (GNF)
- Mali (XOF)
- Niger (XOF)
- Tanzania (TZS)
- Ethiopia (ETB)
- Afghanistan (AFN)
- Iran (IRR)
- Syria (SYP)
- Yemen (YER)
- Sudan (SDG)
- Libya (LYD)
- Jordan (JOD)
- Pakistan (PKR)

### Additional Resources

- [MTN Developer Portal](https://momodeveloper.mtn.com/)
- [MTN MoMo API Documentation](https://momodeveloper.mtn.com/docs)
- [MTN MoMo API Reference](https://momodeveloper.mtn.com/api-documentation)
- [Sandbox Testing Guide](https://momodeveloper.mtn.com/docs/sandbox)

### Payment Status Flow Diagram

```
User Initiates Donation
         ↓
Flutter App → Backend API
         ↓
Backend → MTN MoMo API (Request to Pay)
         ↓
MTN MoMo → User's Phone (Payment Prompt)
         ↓
User Approves/Rejects
         ↓
MTN MoMo → Backend (Webhook Callback)
         ↓
Backend Updates Donation Status
         ↓
Flutter App Polls Status → Shows Result
```

## Backend API Configuration

The app connects to a REST API backend. **Base URL**: `https://donation-api-production-5b2a.up.railway.app/api/v1`

### Response Format

All API responses follow this structure:

```json
// Success
{ "success": true, "data": { ... }, "message": "Optional message" }

// Error
{ "success": false, "error": "Error message here" }
```

### Authentication Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/auth/register` | Register new user |
| POST | `/auth/login` | Login and get JWT token |
| GET | `/auth/me` | Get current user (requires Bearer token) |
| POST | `/auth/logout` | Logout user (validates token and logs action) |

### Causes Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/causes` | Create a new cause |
| GET | `/causes` | Get all causes |
| GET | `/causes/:id` | Get cause by ID |
| PUT | `/causes/:id` | Update cause |
| DELETE | `/causes/:id` | Delete cause |

### Donations Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/donate` | Create donation (initiates MTN MoMo payment) |
| GET | `/donations/:id` | Get donation by ID |
| GET | `/donations/:id/status` | Check & sync donation status from MoMo |
| GET | `/causes/:causeId/donations` | Get donations for a cause |
| GET | `/donor/:phone/donations` | Get donor's donation history |

### Payouts Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/payout` | Create payout (initiates MTN MoMo transfer) |
| GET | `/payouts/:causeId` | Get payouts for a cause |
| GET | `/payouts/:causeId/summary` | Get financial summary for cause |
| GET | `/payouts/detail/:id` | Get payout by ID |
| GET | `/payouts/detail/:id/status` | Check & sync payout status from MoMo |

### Webhooks (for MTN MoMo callbacks)

| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/webhooks/momo/collection` | Donation status updates |
| POST | `/webhooks/momo/disbursement` | Payout status updates |

### Expected JSON Formats

**Cause:**
```json
{
  "id": "UUID",
  "name": "Help Build a School",
  "description": "Raising funds to build a school",
  "ownerPhone": "+237670000001",
  "createdAt": "2024-01-15T10:30:00.000Z",
  "updatedAt": "2024-01-15T10:30:00.000Z"
}
```

**Donation Request:**
```json
{
  "causeId": "UUID",
  "amount": "1000",
  "currency": "XAF",
  "donorPhone": "+237670000002",
  "payerMessage": "Happy to help!"
}
```

**Donation Response:**
```json
{
  "donationId": "UUID",
  "externalId": "UUID",
  "status": "pending",
  "momoRefId": "UUID",
  "paymentInitiated": true,
  "amount": "1000",
  "currency": "XAF"
}
```

**Payout Summary:**
```json
{
  "cause": { "id": "UUID", "name": "...", "ownerPhone": "..." },
  "totalDonations": 1000,
  "totalPayouts": 500,
  "availableBalance": 500,
  "currency": "XAF"
}
```

**Status Values:**
- Donations: `pending`, `success`, `failed`
- Payouts: `pending`, `completed`, `failed`

## Theming

The app supports Light and Dark themes with a charity-friendly color palette:

- **Primary**: Teal (#2A9D8F) - Trust, growth, hope
- **Secondary**: Coral (#E76F51) - Warmth, compassion
- **Accent**: Gold (#F4A261) - Achievement, celebration

To toggle themes, use the Settings screen or system theme.

## Localization

The app supports:
- **English** (default)
- **Arabic** (with RTL layout support)

Translation files are located in `lib/src/l10n/`:
- `app_en.arb` - English translations
- `app_ar.arb` - Arabic translations

To add a new language:
1. Create a new ARB file (e.g., `app_fr.arb`)
2. Add the locale to `supportedLocales` in `main.dart`
3. Run `flutter gen-l10n`

## Dependencies

| Package | Purpose |
|---------|---------|
| `provider` | State management |
| `http` | HTTP client for API calls |
| `intl` | Internationalization |
| `flutter_localizations` | Localization support |
| `shared_preferences` | Local storage |
| `cached_network_image` | Image caching |
| `connectivity_plus` | Internet connectivity checking |

## Customization

### Replacing App Icon

1. Place your icon in `assets/icons/`
2. Use a package like `flutter_launcher_icons` to generate platform-specific icons
3. Update `AndroidManifest.xml` and `Info.plist` as needed

### Adding New Categories

Edit `lib/src/utils/constants.dart`:
```dart
static const List<String> categories = [
  'All',
  'Health',
  'Education',
  // Add new categories here
];
```

Also update the category colors in `lib/src/theme/app_colors.dart`.

## TODO / Future Enhancements

- [x] Payment gateway integration (MTN Mobile Money)
- [x] User authentication (JWT-based)
- [x] User profile management
- [x] No internet connection handling
- [ ] Push notifications for donation updates
- [ ] Additional payment methods (Stripe, PayPal, etc.)
- [ ] Share functionality for causes
- [ ] Offline mode with local caching
- [ ] Analytics and reporting
- [ ] Admin panel integration
- [ ] Real-time payment status updates (WebSocket)
- [ ] Payment retry mechanism
- [ ] Refund functionality

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request


## Support

For support, email fadwa.ali20@gmail.com or open an issue in the repository.

---

Made with love for a better world
