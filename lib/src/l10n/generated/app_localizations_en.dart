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
  String get homeRefresh => 'Refresh';

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
  String get donateTitle => 'Make a Donation';

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
  String get donatePhone => 'Phone Number';

  @override
  String get donatePhoneHint => 'Enter your phone number';

  @override
  String get donatePhoneError => 'Please enter a valid phone number';

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
  String get donateQuickAmount => 'Quick amounts';

  @override
  String get donateCustomAmount => 'Custom amount';

  @override
  String get donateContinue => 'Continue to Payment';

  @override
  String get donateProcessing => 'Processing...';

  @override
  String get donateSuccess => 'Thank you for your donation!';

  @override
  String donateSuccessDesc(String amount, String cause) {
    return 'Your donation of $amount to $cause has been processed successfully.';
  }

  @override
  String get donateFailed => 'Donation Failed';

  @override
  String get donateFailedDesc =>
      'We couldn\'t process your donation. Please try again.';

  @override
  String get donateRetry => 'Try Again';

  @override
  String get donateDone => 'Done';

  @override
  String get historyTitle => 'Donation History';

  @override
  String get historySubtitle => 'View your past donations';

  @override
  String get historyEnterPhone =>
      'Enter your phone number to view your donation history';

  @override
  String get historyPhoneHint => 'Phone number';

  @override
  String get historySearch => 'View History';

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
  String get historyStatusCompleted => 'Completed';

  @override
  String get historyStatusFailed => 'Failed';

  @override
  String get historyStatusRefunded => 'Refunded';

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
  String payoutSuccessDesc(String amount) {
    return 'Your payout request of $amount has been submitted.';
  }

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
  String get categoryAll => 'All';

  @override
  String get categoryHealth => 'Health';

  @override
  String get categoryEducation => 'Education';

  @override
  String get categoryEnvironment => 'Environment';

  @override
  String get categoryEmergency => 'Emergency';

  @override
  String get categoryCommunity => 'Community';

  @override
  String get categoryAnimal => 'Animals';

  @override
  String get categoryGeneral => 'General';

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
  String get commonNoInternet => 'No internet connection';

  @override
  String get commonNoInternetDesc =>
      'Please check your connection and try again.';

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
  String get currencySymbol => '\$';

  @override
  String get currencyCode => 'USD';

  @override
  String get dateFormat => 'MMM d, yyyy';

  @override
  String get timeFormat => 'h:mm a';
}
