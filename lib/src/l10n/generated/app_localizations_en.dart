// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'GiveHope';

  @override
  String get appTagline => 'Making a difference, one donation at a time';

  @override
  String get navHome => 'Home';

  @override
  String get navExplore => 'Explore';

  @override
  String get navHistory => 'History';

  @override
  String get navSettings => 'Settings';

  @override
  String get homeTitle => 'Discover Causes';

  @override
  String get homeSubtitle => 'Support causes that matter to you';

  @override
  String get homeSearchPlaceholder => 'Search causes...';

  @override
  String get homeFeatured => 'Featured';

  @override
  String get homeAllCauses => 'All Causes';

  @override
  String get homeCategories => 'Categories';

  @override
  String get homeNoCauses => 'No causes found';

  @override
  String get homeNoCausesDesc =>
      'There are no active causes at the moment. Check back later!';

  @override
  String get homeNoCausesYet => 'No causes yet';

  @override
  String get homeNoCausesYetDesc => 'Be the first to create a cause!';

  @override
  String get homeCreateCause => 'Create Cause';

  @override
  String get homeRefresh => 'Refresh';

  @override
  String get homeLoading => 'Loading causes...';

  @override
  String get bannerTitle1 => 'Make a Difference';

  @override
  String get bannerDesc1 =>
      'Support causes that matter to you with secure MTN MoMo payments';

  @override
  String get bannerTitle2 => 'Easy & Fast';

  @override
  String get bannerDesc2 =>
      'Donate in seconds with just a few taps. No hassle, no complications';

  @override
  String get bannerTitle3 => 'Transparent';

  @override
  String get bannerDesc3 =>
      'Track your donations and see how your contributions make an impact';

  @override
  String get bannerTitle4 => 'Secure Payments';

  @override
  String get bannerDesc4 =>
      'All transactions are processed securely through MTN Mobile Money';

  @override
  String get authLogin => 'Sign In';

  @override
  String get authLoginTitle => 'Welcome Back';

  @override
  String get authLoginSubtitle => 'Sign in to continue making a difference';

  @override
  String get authEmail => 'Email';

  @override
  String get authEmailHint => 'Enter your email';

  @override
  String get authPassword => 'Password';

  @override
  String get authPasswordHint => 'Enter your password';

  @override
  String get authNoAccount => 'Don\'t have an account? ';

  @override
  String get authSignUp => 'Sign Up';

  @override
  String get authOr => 'OR';

  @override
  String get authContinueGuest => 'Continue as Guest';

  @override
  String get authRegister => 'Create Account';

  @override
  String get authRegisterTitle => 'Join GiveHope';

  @override
  String get authRegisterSubtitle =>
      'Create an account to start making donations';

  @override
  String get authName => 'Full Name (Optional)';

  @override
  String get authNameHint => 'Enter your name';

  @override
  String get authPhone => 'Phone Number (Optional)';

  @override
  String get authPhoneHint => 'e.g., +237670000001';

  @override
  String get authConfirmPassword => 'Confirm Password';

  @override
  String get authConfirmPasswordHint => 'Confirm your password';

  @override
  String get authPasswordMismatch => 'Passwords do not match';

  @override
  String authPasswordMin(int length) {
    return 'Password must be at least $length characters';
  }

  @override
  String get authAlreadyAccount => 'Already have an account? ';

  @override
  String get authSignIn => 'Sign In';

  @override
  String get authMoMoInfo =>
      'Your phone number will be used for MTN MoMo payments';

  @override
  String get authRequired => 'This field is required';

  @override
  String get authInvalidEmail => 'Please enter a valid email address';

  @override
  String get authInvalidPassword => 'Invalid email or password';

  @override
  String get authUserExists => 'User with this email already exists';

  @override
  String get authRegistrationFailed => 'Registration failed. Please try again.';

  @override
  String get authLoginFailed => 'Login failed. Please try again.';

  @override
  String get causeDetailTitle => 'Cause Details';

  @override
  String get causeRaised => 'Raised';

  @override
  String get causeGoal => 'Goal';

  @override
  String get causeProgress => 'Progress';

  @override
  String get causeDonors => 'Donors';

  @override
  String get causeDonations => 'Donations';

  @override
  String get causeDaysLeft => 'days left';

  @override
  String get causeEnded => 'Campaign ended';

  @override
  String get causeAbout => 'About this cause';

  @override
  String get causeOrganizer => 'Organizer';

  @override
  String get causeRecentDonations => 'Recent Donations';

  @override
  String get causeNoDonations => 'No donations yet';

  @override
  String get causeBeFirst => 'Be the first to donate!';

  @override
  String get causeShare => 'Share';

  @override
  String get causeReport => 'Report';

  @override
  String get causeTotalReceived => 'Total Received';

  @override
  String get causeAvailable => 'Available';

  @override
  String get causeBy => 'by';

  @override
  String get causeLoading => 'Loading cause details...';

  @override
  String get causeNotFound => 'Cause not found';

  @override
  String get causeNotFoundDesc =>
      'The cause you\'re looking for doesn\'t exist.';

  @override
  String get causeGoBack => 'Go Back';

  @override
  String get causeManagePayouts => 'Manage Payouts';

  @override
  String get causeCreateTitle => 'Create Cause';

  @override
  String get causeCreateHeader => 'Start a Cause';

  @override
  String get causeCreateSubtitle => 'Create a cause to receive donations';

  @override
  String get causeCreateName => 'Cause Name';

  @override
  String get causeCreateNameHint => 'e.g., Help Build a School';

  @override
  String get causeCreateNameRequired => 'Cause name is required';

  @override
  String get causeCreateDescription => 'Description (Optional)';

  @override
  String get causeCreateDescriptionHint =>
      'Describe your cause and how the funds will be used...';

  @override
  String get causeCreateOwnerPhone => 'Owner Phone Number';

  @override
  String get causeCreateOwnerPhoneHint => 'e.g., +237670000001';

  @override
  String get causeCreateMoMoWarning =>
      'This phone number will receive payouts via MTN MoMo. Make sure it\'s an active MTN Mobile Money account.';

  @override
  String get causeCreateSuccess => 'Cause created successfully!';

  @override
  String get causeCreateFailed => 'Failed to create cause. Please try again.';

  @override
  String get donateTitle => 'Make a Donation';

  @override
  String get donateDonatingTo => 'Donating to';

  @override
  String get donateAmount => 'Donation Amount';

  @override
  String get donateAmountHint => 'Enter amount';

  @override
  String get donateAmountError => 'Please enter a valid amount';

  @override
  String donateAmountMin(String amount) {
    return 'Minimum donation is $amount';
  }

  @override
  String get donateCurrency => 'Currency';

  @override
  String get donatePhone => 'MTN MoMo Phone Number';

  @override
  String get donatePhoneHint => 'e.g., +237670000001';

  @override
  String get donatePhoneError => 'Please enter a valid phone number';

  @override
  String get donateMoMoInfo =>
      'A payment request will be sent to this MTN MoMo number';

  @override
  String get donateName => 'Your Name (Optional)';

  @override
  String get donateNameHint => 'Enter your name';

  @override
  String get donateMessage => 'Leave a Message (Optional)';

  @override
  String get donateMessageHint => 'Write a message of support...';

  @override
  String get donateAnonymous => 'Donate anonymously';

  @override
  String donateQuickAmount(String currency) {
    return 'Quick amounts ($currency)';
  }

  @override
  String get donateCustomAmount => 'Custom amount';

  @override
  String get donateContinue => 'Donate via MTN MoMo';

  @override
  String get donateProcessing => 'Processing...';

  @override
  String get donateWaiting => 'Waiting for Payment';

  @override
  String donateWaitingDesc(String amount, String currency) {
    return 'A payment request has been sent to your phone.\n\nPlease approve the MTN MoMo payment of $amount $currency.';
  }

  @override
  String get donateSuccess => 'Thank You!';

  @override
  String donateSuccessDesc(String amount, String currency, String cause) {
    return 'Your donation of $amount $currency to \"$cause\" has been processed successfully.';
  }

  @override
  String get donateFailed => 'Donation Failed';

  @override
  String get donateFailedDesc =>
      'We couldn\'t process your donation. Please try again.';

  @override
  String get donatePending => 'Payment Pending';

  @override
  String get donatePendingDesc =>
      'The payment is still pending. Please check your phone and approve the MTN MoMo payment request.\n\nIf you\'ve already approved, it may take a moment to process.';

  @override
  String get donateRetry => 'Try Again';

  @override
  String get donateDone => 'Done';

  @override
  String get donateCancel => 'Cancel';

  @override
  String get historyTitle => 'Donation History';

  @override
  String get historySubtitle => 'View your past donations';

  @override
  String get historyEnterPhone =>
      'Enter your phone number to view your donation history';

  @override
  String get historyPhoneHint => 'e.g., +237670000001';

  @override
  String get historySearch => 'Search';

  @override
  String get historyViewHistory => 'View History';

  @override
  String get historyNoResults => 'No donations found';

  @override
  String get historyNoResultsDesc =>
      'You haven\'t made any donations yet. Start giving today!';

  @override
  String get historyTotal => 'Total Donated';

  @override
  String historyCount(int count) {
    return '$count donations';
  }

  @override
  String get historyStatusPending => 'Pending';

  @override
  String get historyStatusSuccess => 'Success';

  @override
  String get historyStatusFailed => 'Failed';

  @override
  String get historyLoading => 'Loading history...';

  @override
  String get historyGetStarted => 'View your donation history';

  @override
  String get historyGetStartedDesc =>
      'Enter your phone number above to get started';

  @override
  String get payoutTitle => 'Payout Management';

  @override
  String get payoutSubtitle => 'Manage your cause\'s funds';

  @override
  String get payoutAvailable => 'Available for Payout';

  @override
  String get payoutTotal => 'Total Received';

  @override
  String get payoutRequest => 'Request Payout';

  @override
  String get payoutAmount => 'Payout Amount';

  @override
  String get payoutAmountHint => 'Enter amount to withdraw';

  @override
  String get payoutAmountError => 'Please enter a valid amount';

  @override
  String payoutAmountMax(String amount) {
    return 'Maximum available: $amount';
  }

  @override
  String get payoutNotes => 'Notes (Optional)';

  @override
  String get payoutNotesHint => 'Add any notes...';

  @override
  String get payoutSubmit => 'Submit Request';

  @override
  String get payoutProcessing => 'Processing...';

  @override
  String get payoutSuccess => 'Payout Requested';

  @override
  String get payoutSuccessDesc => 'Payout request submitted successfully!';

  @override
  String get payoutFailed => 'Payout Failed';

  @override
  String get payoutFailedDesc =>
      'We couldn\'t process your payout request. Please try again.';

  @override
  String get payoutHistory => 'Payout History';

  @override
  String get payoutNoHistory => 'No payouts yet';

  @override
  String get payoutNoFunds =>
      'No funds available for payout. Receive some donations first!';

  @override
  String payoutMoMoInfo(String phone) {
    return 'Funds will be sent to the MTN MoMo account: $phone';
  }

  @override
  String get payoutStatusPending => 'Pending';

  @override
  String get payoutStatusProcessing => 'Processing';

  @override
  String get payoutStatusCompleted => 'Completed';

  @override
  String get payoutStatusFailed => 'Failed';

  @override
  String get payoutStatusCancelled => 'Cancelled';

  @override
  String get payoutLoading => 'Loading...';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsAppearance => 'Appearance';

  @override
  String get settingsTheme => 'Theme';

  @override
  String get settingsThemeLight => 'Light';

  @override
  String get settingsThemeDark => 'Dark';

  @override
  String get settingsThemeSystem => 'System';

  @override
  String get settingsLanguage => 'Language';

  @override
  String get settingsLanguageEn => 'English';

  @override
  String get settingsLanguageAr => 'العربية';

  @override
  String get settingsProfile => 'Profile';

  @override
  String get settingsEditProfile => 'Edit Profile';

  @override
  String get settingsNotifications => 'Notifications';

  @override
  String get settingsAbout => 'About';

  @override
  String get settingsPrivacy => 'Privacy Policy';

  @override
  String get settingsTerms => 'Terms of Service';

  @override
  String settingsVersion(String version) {
    return 'Version $version';
  }

  @override
  String get settingsContact => 'Contact Us';

  @override
  String get settingsRate => 'Rate App';

  @override
  String get settingsChooseTheme => 'Choose Theme';

  @override
  String get settingsChooseLanguage => 'Choose Language';

  @override
  String get settingsAboutTitle => 'About GiveHope';

  @override
  String get settingsAboutDesc =>
      'GiveHope is a donation and micro-payments app designed to make charitable giving easy and accessible.';

  @override
  String get settingsAboutMission =>
      'Our mission is to connect generous donors with causes that matter, empowering communities one donation at a time.';

  @override
  String get settingsHelp => 'Help & FAQ';

  @override
  String get settingsLogout => 'Logout';

  @override
  String get settingsLogoutConfirm => 'Are you sure you want to logout?';

  @override
  String get settingsLogoutConfirmDesc =>
      'You will need to login again to access your account.';

  @override
  String get commonLoading => 'Loading...';

  @override
  String get commonError => 'Something went wrong';

  @override
  String get commonRetry => 'Retry';

  @override
  String get commonCancel => 'Cancel';

  @override
  String get commonConfirm => 'Confirm';

  @override
  String get commonSave => 'Save';

  @override
  String get commonClose => 'Close';

  @override
  String get commonBack => 'Back';

  @override
  String get commonNext => 'Next';

  @override
  String get commonDone => 'Done';

  @override
  String get commonOk => 'OK';

  @override
  String get commonYes => 'Yes';

  @override
  String get commonNo => 'No';

  @override
  String get commonSearch => 'Search';

  @override
  String get commonSeeAll => 'See All';

  @override
  String get commonNoInternet => 'No Internet Connection';

  @override
  String get commonNoInternetDesc =>
      'It looks like you\'re offline. Please check your internet connection and try again.';

  @override
  String get noInternetTip1 => 'Check your Wi-Fi or mobile data';

  @override
  String get noInternetTip2 => 'Make sure airplane mode is turned off';

  @override
  String get noInternetTip3 => 'Try moving to an area with better signal';

  @override
  String get commonServerError => 'Server error';

  @override
  String get commonServerErrorDesc =>
      'Something went wrong on our end. Please try again later.';

  @override
  String get commonUnknownError => 'Unknown error';

  @override
  String get commonUnknownErrorDesc =>
      'An unexpected error occurred. Please try again.';

  @override
  String get commonCreated => 'Created';

  @override
  String get commonRaised => 'raised';

  @override
  String get commonDonations => 'donations';

  @override
  String get commonWelcome => 'Welcome';

  @override
  String get errorConnectionFailed =>
      'Unable to connect to server. Please check your connection and try again.';

  @override
  String get errorRequestTimeout => 'Request timed out. Please try again.';

  @override
  String get errorNetworkError => 'Network error. Please try again.';

  @override
  String get errorUnexpected =>
      'An unexpected error occurred. Please try again.';

  @override
  String get errorAnErrorOccurred => 'An error occurred';

  @override
  String get validationPhoneRequired => 'Phone number is required';

  @override
  String get validationPhoneInvalid => 'Please enter a valid phone number';

  @override
  String get validationPhoneTooLong => 'Phone number is too long';

  @override
  String get validationAmountRequired => 'Amount is required';

  @override
  String get validationAmountInvalid => 'Please enter a valid amount';

  @override
  String validationAmountMin(String symbol, String amount) {
    return 'Minimum amount is $symbol$amount';
  }

  @override
  String validationAmountMax(String symbol, String amount) {
    return 'Maximum amount is $symbol$amount';
  }

  @override
  String get validationEmailRequired => 'Email is required';

  @override
  String get validationEmailInvalid => 'Please enter a valid email address';

  @override
  String get validationNameRequired => 'Name is required';

  @override
  String get validationNameTooLong => 'Name is too long';

  @override
  String get validationNameInvalid => 'Please enter a valid name';

  @override
  String validationMessageTooLong(int max) {
    return 'Message is too long (max $max characters)';
  }

  @override
  String get validationFieldRequired => 'This field is required';

  @override
  String get validationPositiveNumberRequired => 'This field is required';

  @override
  String get validationPositiveNumberInvalid =>
      'Please enter a valid positive number';

  @override
  String get currencySymbol => 'FCFA';

  @override
  String get currencyCode => 'XAF';

  @override
  String get dateFormat => 'MMM d, yyyy';

  @override
  String get timeFormat => 'h:mm a';

  @override
  String get privacyTitle => 'Privacy Policy';

  @override
  String get privacyLastUpdated => 'Last updated: January 2024';

  @override
  String get privacyIntroduction => 'Introduction';

  @override
  String get privacyIntroductionDesc =>
      'At GiveHope, we are committed to protecting your privacy and personal information. This Privacy Policy explains how we collect, use, and safeguard your data when you use our donation and micro-payments mobile application.';

  @override
  String get privacyInformationWeCollect => 'Information We Collect';

  @override
  String get privacyInformationWeCollectDesc =>
      'We collect information that you provide directly to us, including your name, email address, phone number, and payment information when you create an account, make donations, or create causes. We also collect usage data and device information to improve our services.';

  @override
  String get privacyHowWeUse => 'How We Use Your Information';

  @override
  String get privacyHowWeUseDesc =>
      'We use your information to process donations, manage your account, communicate with you about your transactions, improve our services, and comply with legal obligations. We do not sell your personal information to third parties.';

  @override
  String get privacyDataSecurity => 'Data Security';

  @override
  String get privacyDataSecurityDesc =>
      'We implement industry-standard security measures to protect your personal information, including encryption, secure authentication, and regular security audits. However, no method of transmission over the internet is 100% secure.';

  @override
  String get privacyThirdParty => 'Third-Party Services';

  @override
  String get privacyThirdPartyDesc =>
      'We use MTN Mobile Money (MoMo) for payment processing. When you make a donation, your payment information is processed securely through MTN\'s payment gateway. Please review MTN\'s privacy policy for information about how they handle your data.';

  @override
  String get privacyYourRights => 'Your Rights';

  @override
  String get privacyYourRightsDesc =>
      'You have the right to access, update, or delete your personal information at any time. You can also opt-out of certain communications. To exercise these rights, please contact us using the information provided below.';

  @override
  String get privacyChildren => 'Children\'s Privacy';

  @override
  String get privacyChildrenDesc =>
      'Our services are not intended for children under the age of 18. We do not knowingly collect personal information from children. If you believe we have collected information from a child, please contact us immediately.';

  @override
  String get privacyChanges => 'Changes to Privacy Policy';

  @override
  String get privacyChangesDesc =>
      'We may update this Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page and updating the \"Last updated\" date. You are advised to review this Privacy Policy periodically.';

  @override
  String get privacyContact => 'Contact Us';

  @override
  String get privacyContactDesc =>
      'If you have any questions about this Privacy Policy, please contact us:';

  @override
  String get privacyContactEmail => 'fadwa.ali20@gmail.com';

  @override
  String get privacyContactUs => 'Contact Us';

  @override
  String get termsTitle => 'Terms of Service';

  @override
  String get termsLastUpdated => 'Last updated: January 2024';

  @override
  String get termsIntroduction => 'Introduction';

  @override
  String get termsIntroductionDesc =>
      'Welcome to GiveHope. These Terms of Service govern your use of our donation and micro-payments mobile application. By using our app, you agree to be bound by these terms. Please read them carefully.';

  @override
  String get termsAcceptance => 'Acceptance of Terms';

  @override
  String get termsAcceptanceDesc =>
      'By accessing or using GiveHope, you agree to comply with and be bound by these Terms of Service. If you do not agree with any part of these terms, you may not use our services.';

  @override
  String get termsUseOfService => 'Use of Service';

  @override
  String get termsUseOfServiceDesc =>
      'You may use GiveHope to browse causes, make donations, and create causes. You agree to use the service only for lawful purposes and in accordance with these terms. You are responsible for maintaining the confidentiality of your account credentials.';

  @override
  String get termsUserAccounts => 'User Accounts';

  @override
  String get termsUserAccountsDesc =>
      'To use certain features, you must create an account. You are responsible for providing accurate information and maintaining the security of your account. You must notify us immediately of any unauthorized use of your account.';

  @override
  String get termsDonations => 'Donations and Payments';

  @override
  String get termsDonationsDesc =>
      'All donations are processed through MTN Mobile Money (MoMo). Donations are final and non-refundable unless required by law. We are not responsible for the actions of cause creators or the use of donated funds. Please verify cause information before donating.';

  @override
  String get termsProhibited => 'Prohibited Activities';

  @override
  String get termsProhibitedDesc =>
      'You agree not to use GiveHope for any illegal activities, fraud, money laundering, or to create false causes. You may not interfere with the operation of the service or attempt to gain unauthorized access to our systems.';

  @override
  String get termsIntellectual => 'Intellectual Property';

  @override
  String get termsIntellectualDesc =>
      'All content, features, and functionality of GiveHope are owned by us and are protected by copyright, trademark, and other intellectual property laws. You may not reproduce, distribute, or create derivative works without our permission.';

  @override
  String get termsLiability => 'Limitation of Liability';

  @override
  String get termsLiabilityDesc =>
      'GiveHope is provided \"as is\" without warranties of any kind. We are not liable for any damages arising from your use of the service, including but not limited to donation disputes, payment processing issues, or cause-related matters.';

  @override
  String get termsTermination => 'Termination';

  @override
  String get termsTerminationDesc =>
      'We reserve the right to suspend or terminate your account at any time for violation of these terms or for any other reason we deem necessary. You may also terminate your account at any time by contacting us.';

  @override
  String get termsChanges => 'Changes to Terms';

  @override
  String get termsChangesDesc =>
      'We may modify these Terms of Service at any time. We will notify you of significant changes by posting the updated terms in the app. Your continued use of the service after changes constitutes acceptance of the new terms.';

  @override
  String get termsContact => 'Contact Us';

  @override
  String get termsContactDesc =>
      'If you have any questions about these Terms of Service, please contact us:';

  @override
  String get termsContactEmail => 'fadwa.ali20@gmail.com';

  @override
  String get termsContactUs => 'Contact Us';

  @override
  String get faqTitle => 'Frequently Asked Questions';

  @override
  String get faqSubtitle => 'Find answers to common questions';

  @override
  String get faqQuestion1 => 'How do I make a donation?';

  @override
  String get faqAnswer1 =>
      'To make a donation, browse the causes on the home screen, select a cause you\'d like to support, and tap the \"Donate\" button. Enter the amount and your MTN MoMo phone number. A payment request will be sent to your phone for approval.';

  @override
  String get faqQuestion2 => 'Is my payment secure?';

  @override
  String get faqAnswer2 =>
      'Yes, all payments are processed securely through MTN Mobile Money (MoMo), a trusted payment gateway. We do not store your payment credentials, and all transactions are encrypted.';

  @override
  String get faqQuestion3 => 'Can I get a refund?';

  @override
  String get faqAnswer3 =>
      'Donations are generally final and non-refundable. However, if you believe there has been an error or fraud, please contact us immediately at fadwa.ali20@gmail.com with details of your transaction.';

  @override
  String get faqQuestion4 => 'How do I create a cause?';

  @override
  String get faqAnswer4 =>
      'To create a cause, you need to be logged in. Tap the \"Create Cause\" button, fill in the cause details including name, description, and your MTN MoMo phone number (where you\'ll receive payouts). Submit the form to create your cause.';

  @override
  String get faqQuestion5 => 'How do I receive payouts?';

  @override
  String get faqAnswer5 =>
      'As a cause owner, you can request payouts from the Payout Management screen. Enter the amount you want to withdraw, and the funds will be transferred to your registered MTN MoMo account. Payouts may take a few minutes to process.';

  @override
  String get faqQuestion6 => 'What if my payment is pending?';

  @override
  String get faqAnswer6 =>
      'If your payment is pending, check your phone for the MTN MoMo payment request and approve it. If you\'ve already approved but it\'s still pending, wait a few moments as processing can take time. You can also check the donation status in the app.';

  @override
  String get faqQuestion7 => 'How do I view my donation history?';

  @override
  String get faqAnswer7 =>
      'Go to the History tab and enter your phone number. You\'ll see all your past donations, including the amount, cause, date, and status of each donation.';

  @override
  String get faqQuestion8 => 'Is my personal information safe?';

  @override
  String get faqAnswer8 =>
      'Yes, we take your privacy seriously. We use industry-standard security measures to protect your data. We do not sell your personal information to third parties. For more details, please read our Privacy Policy.';

  @override
  String get faqStillHaveQuestions => 'Still have questions?';

  @override
  String get faqContactUs =>
      'Feel free to reach out to us via email or use the contact form above.';

  @override
  String get contactTitle => 'Contact Us';

  @override
  String get contactSubtitle => 'We\'re here to help. Get in touch with us!';

  @override
  String get contactEmailLabel => 'Email Address';

  @override
  String get contactEmail => 'fadwa.ali20@gmail.com';

  @override
  String get contactCopyEmail => 'Copy email address';

  @override
  String get contactEmailCopied => 'Email address copied to clipboard';

  @override
  String get contactOpenEmail => 'Open Email App';

  @override
  String get contactFormTitle => 'Send us a Message';

  @override
  String get contactFormName => 'Your Name';

  @override
  String get contactFormNameHint => 'Enter your full name';

  @override
  String get contactFormNameRequired => 'Name is required';

  @override
  String get contactFormEmail => 'Your Email';

  @override
  String get contactFormEmailHint => 'Enter your email address';

  @override
  String get contactFormEmailRequired => 'Email is required';

  @override
  String get contactFormEmailInvalid => 'Please enter a valid email address';

  @override
  String get contactFormSubject => 'Subject';

  @override
  String get contactFormSubjectHint => 'What is this regarding?';

  @override
  String get contactFormSubjectRequired => 'Subject is required';

  @override
  String get contactFormMessage => 'Message';

  @override
  String get contactFormMessageHint => 'Tell us how we can help...';

  @override
  String get contactFormMessageRequired => 'Message is required';

  @override
  String get contactFormMessageMinLength =>
      'Message must be at least 10 characters';

  @override
  String get contactFormSubmit => 'Send Message';

  @override
  String get contactFormSuccess =>
      'Email app opened successfully! Please send your message.';

  @override
  String get contactFormError =>
      'Could not open email app. Please try again or email us directly at fadwa.ali20@gmail.com';

  @override
  String get contactStillHaveQuestions => 'Still have questions?';

  @override
  String get contactContactUs =>
      'Feel free to reach out to us via email or use the contact form above.';
}
