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
  String get settingsPrivacyComingSoon => 'Privacy Policy coming soon';

  @override
  String get settingsTermsComingSoon => 'Terms of Service coming soon';

  @override
  String get settingsHelpComingSoon => 'Help & FAQ coming soon';

  @override
  String get settingsContactComingSoon => 'Contact form coming soon';

  @override
  String get settingsRateComingSoon => 'App store rating coming soon';

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
  String get currencySymbol => 'FCFA';

  @override
  String get currencyCode => 'XAF';

  @override
  String get dateFormat => 'MMM d, yyyy';

  @override
  String get timeFormat => 'h:mm a';
}
