import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// The name of the application
  ///
  /// In en, this message translates to:
  /// **'GiveHope'**
  String get appName;

  /// App tagline shown on splash screen
  ///
  /// In en, this message translates to:
  /// **'Making a difference, one donation at a time'**
  String get appTagline;

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navExplore.
  ///
  /// In en, this message translates to:
  /// **'Explore'**
  String get navExplore;

  /// No description provided for @navHistory.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get navHistory;

  /// No description provided for @navSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get navSettings;

  /// No description provided for @homeTitle.
  ///
  /// In en, this message translates to:
  /// **'Discover Causes'**
  String get homeTitle;

  /// No description provided for @homeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Support causes that matter to you'**
  String get homeSubtitle;

  /// No description provided for @homeSearchPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Search causes...'**
  String get homeSearchPlaceholder;

  /// No description provided for @homeFeatured.
  ///
  /// In en, this message translates to:
  /// **'Featured'**
  String get homeFeatured;

  /// No description provided for @homeAllCauses.
  ///
  /// In en, this message translates to:
  /// **'All Causes'**
  String get homeAllCauses;

  /// No description provided for @homeCategories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get homeCategories;

  /// No description provided for @homeNoCauses.
  ///
  /// In en, this message translates to:
  /// **'No causes found'**
  String get homeNoCauses;

  /// No description provided for @homeNoCausesDesc.
  ///
  /// In en, this message translates to:
  /// **'There are no active causes at the moment. Check back later!'**
  String get homeNoCausesDesc;

  /// No description provided for @homeRefresh.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get homeRefresh;

  /// No description provided for @causeDetailTitle.
  ///
  /// In en, this message translates to:
  /// **'Cause Details'**
  String get causeDetailTitle;

  /// No description provided for @causeRaised.
  ///
  /// In en, this message translates to:
  /// **'Raised'**
  String get causeRaised;

  /// No description provided for @causeGoal.
  ///
  /// In en, this message translates to:
  /// **'Goal'**
  String get causeGoal;

  /// No description provided for @causeProgress.
  ///
  /// In en, this message translates to:
  /// **'Progress'**
  String get causeProgress;

  /// No description provided for @causeDonors.
  ///
  /// In en, this message translates to:
  /// **'Donors'**
  String get causeDonors;

  /// No description provided for @causeDonations.
  ///
  /// In en, this message translates to:
  /// **'Donations'**
  String get causeDonations;

  /// No description provided for @causeDaysLeft.
  ///
  /// In en, this message translates to:
  /// **'days left'**
  String get causeDaysLeft;

  /// No description provided for @causeEnded.
  ///
  /// In en, this message translates to:
  /// **'Campaign ended'**
  String get causeEnded;

  /// No description provided for @causeAbout.
  ///
  /// In en, this message translates to:
  /// **'About this cause'**
  String get causeAbout;

  /// No description provided for @causeOrganizer.
  ///
  /// In en, this message translates to:
  /// **'Organizer'**
  String get causeOrganizer;

  /// No description provided for @causeRecentDonations.
  ///
  /// In en, this message translates to:
  /// **'Recent Donations'**
  String get causeRecentDonations;

  /// No description provided for @causeNoDonations.
  ///
  /// In en, this message translates to:
  /// **'No donations yet'**
  String get causeNoDonations;

  /// No description provided for @causeBeFirst.
  ///
  /// In en, this message translates to:
  /// **'Be the first to donate!'**
  String get causeBeFirst;

  /// No description provided for @causeShare.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get causeShare;

  /// No description provided for @causeReport.
  ///
  /// In en, this message translates to:
  /// **'Report'**
  String get causeReport;

  /// No description provided for @donateTitle.
  ///
  /// In en, this message translates to:
  /// **'Make a Donation'**
  String get donateTitle;

  /// No description provided for @donateAmount.
  ///
  /// In en, this message translates to:
  /// **'Donation Amount'**
  String get donateAmount;

  /// No description provided for @donateAmountHint.
  ///
  /// In en, this message translates to:
  /// **'Enter amount'**
  String get donateAmountHint;

  /// No description provided for @donateAmountError.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid amount'**
  String get donateAmountError;

  /// No description provided for @donateAmountMin.
  ///
  /// In en, this message translates to:
  /// **'Minimum donation is {amount}'**
  String donateAmountMin(String amount);

  /// No description provided for @donatePhone.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get donatePhone;

  /// No description provided for @donatePhoneHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number'**
  String get donatePhoneHint;

  /// No description provided for @donatePhoneError.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid phone number'**
  String get donatePhoneError;

  /// No description provided for @donateName.
  ///
  /// In en, this message translates to:
  /// **'Your Name (Optional)'**
  String get donateName;

  /// No description provided for @donateNameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your name'**
  String get donateNameHint;

  /// No description provided for @donateMessage.
  ///
  /// In en, this message translates to:
  /// **'Leave a Message (Optional)'**
  String get donateMessage;

  /// No description provided for @donateMessageHint.
  ///
  /// In en, this message translates to:
  /// **'Write a message of support...'**
  String get donateMessageHint;

  /// No description provided for @donateAnonymous.
  ///
  /// In en, this message translates to:
  /// **'Donate anonymously'**
  String get donateAnonymous;

  /// No description provided for @donateQuickAmount.
  ///
  /// In en, this message translates to:
  /// **'Quick amounts'**
  String get donateQuickAmount;

  /// No description provided for @donateCustomAmount.
  ///
  /// In en, this message translates to:
  /// **'Custom amount'**
  String get donateCustomAmount;

  /// No description provided for @donateContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue to Payment'**
  String get donateContinue;

  /// No description provided for @donateProcessing.
  ///
  /// In en, this message translates to:
  /// **'Processing...'**
  String get donateProcessing;

  /// No description provided for @donateSuccess.
  ///
  /// In en, this message translates to:
  /// **'Thank you for your donation!'**
  String get donateSuccess;

  /// No description provided for @donateSuccessDesc.
  ///
  /// In en, this message translates to:
  /// **'Your donation of {amount} to {cause} has been processed successfully.'**
  String donateSuccessDesc(String amount, String cause);

  /// No description provided for @donateFailed.
  ///
  /// In en, this message translates to:
  /// **'Donation Failed'**
  String get donateFailed;

  /// No description provided for @donateFailedDesc.
  ///
  /// In en, this message translates to:
  /// **'We couldn\'t process your donation. Please try again.'**
  String get donateFailedDesc;

  /// No description provided for @donateRetry.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get donateRetry;

  /// No description provided for @donateDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get donateDone;

  /// No description provided for @historyTitle.
  ///
  /// In en, this message translates to:
  /// **'Donation History'**
  String get historyTitle;

  /// No description provided for @historySubtitle.
  ///
  /// In en, this message translates to:
  /// **'View your past donations'**
  String get historySubtitle;

  /// No description provided for @historyEnterPhone.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number to view your donation history'**
  String get historyEnterPhone;

  /// No description provided for @historyPhoneHint.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get historyPhoneHint;

  /// No description provided for @historySearch.
  ///
  /// In en, this message translates to:
  /// **'View History'**
  String get historySearch;

  /// No description provided for @historyNoResults.
  ///
  /// In en, this message translates to:
  /// **'No donations found'**
  String get historyNoResults;

  /// No description provided for @historyNoResultsDesc.
  ///
  /// In en, this message translates to:
  /// **'You haven\'t made any donations yet. Start giving today!'**
  String get historyNoResultsDesc;

  /// No description provided for @historyTotal.
  ///
  /// In en, this message translates to:
  /// **'Total Donated'**
  String get historyTotal;

  /// No description provided for @historyCount.
  ///
  /// In en, this message translates to:
  /// **'{count} donations'**
  String historyCount(int count);

  /// No description provided for @historyStatusPending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get historyStatusPending;

  /// No description provided for @historyStatusCompleted.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get historyStatusCompleted;

  /// No description provided for @historyStatusFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed'**
  String get historyStatusFailed;

  /// No description provided for @historyStatusRefunded.
  ///
  /// In en, this message translates to:
  /// **'Refunded'**
  String get historyStatusRefunded;

  /// No description provided for @payoutTitle.
  ///
  /// In en, this message translates to:
  /// **'Payout Management'**
  String get payoutTitle;

  /// No description provided for @payoutSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Manage your cause\'s funds'**
  String get payoutSubtitle;

  /// No description provided for @payoutAvailable.
  ///
  /// In en, this message translates to:
  /// **'Available for Payout'**
  String get payoutAvailable;

  /// No description provided for @payoutTotal.
  ///
  /// In en, this message translates to:
  /// **'Total Received'**
  String get payoutTotal;

  /// No description provided for @payoutRequest.
  ///
  /// In en, this message translates to:
  /// **'Request Payout'**
  String get payoutRequest;

  /// No description provided for @payoutAmount.
  ///
  /// In en, this message translates to:
  /// **'Payout Amount'**
  String get payoutAmount;

  /// No description provided for @payoutAmountHint.
  ///
  /// In en, this message translates to:
  /// **'Enter amount to withdraw'**
  String get payoutAmountHint;

  /// No description provided for @payoutAmountError.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid amount'**
  String get payoutAmountError;

  /// No description provided for @payoutAmountMax.
  ///
  /// In en, this message translates to:
  /// **'Maximum available: {amount}'**
  String payoutAmountMax(String amount);

  /// No description provided for @payoutNotes.
  ///
  /// In en, this message translates to:
  /// **'Notes (Optional)'**
  String get payoutNotes;

  /// No description provided for @payoutNotesHint.
  ///
  /// In en, this message translates to:
  /// **'Add any notes...'**
  String get payoutNotesHint;

  /// No description provided for @payoutSubmit.
  ///
  /// In en, this message translates to:
  /// **'Submit Request'**
  String get payoutSubmit;

  /// No description provided for @payoutProcessing.
  ///
  /// In en, this message translates to:
  /// **'Processing...'**
  String get payoutProcessing;

  /// No description provided for @payoutSuccess.
  ///
  /// In en, this message translates to:
  /// **'Payout Requested'**
  String get payoutSuccess;

  /// No description provided for @payoutSuccessDesc.
  ///
  /// In en, this message translates to:
  /// **'Your payout request of {amount} has been submitted.'**
  String payoutSuccessDesc(String amount);

  /// No description provided for @payoutFailed.
  ///
  /// In en, this message translates to:
  /// **'Payout Failed'**
  String get payoutFailed;

  /// No description provided for @payoutFailedDesc.
  ///
  /// In en, this message translates to:
  /// **'We couldn\'t process your payout request. Please try again.'**
  String get payoutFailedDesc;

  /// No description provided for @payoutHistory.
  ///
  /// In en, this message translates to:
  /// **'Payout History'**
  String get payoutHistory;

  /// No description provided for @payoutNoHistory.
  ///
  /// In en, this message translates to:
  /// **'No payouts yet'**
  String get payoutNoHistory;

  /// No description provided for @payoutStatusPending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get payoutStatusPending;

  /// No description provided for @payoutStatusProcessing.
  ///
  /// In en, this message translates to:
  /// **'Processing'**
  String get payoutStatusProcessing;

  /// No description provided for @payoutStatusCompleted.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get payoutStatusCompleted;

  /// No description provided for @payoutStatusFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed'**
  String get payoutStatusFailed;

  /// No description provided for @payoutStatusCancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get payoutStatusCancelled;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @settingsAppearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get settingsAppearance;

  /// No description provided for @settingsTheme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get settingsTheme;

  /// No description provided for @settingsThemeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get settingsThemeLight;

  /// No description provided for @settingsThemeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get settingsThemeDark;

  /// No description provided for @settingsThemeSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get settingsThemeSystem;

  /// No description provided for @settingsLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguage;

  /// No description provided for @settingsLanguageEn.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get settingsLanguageEn;

  /// No description provided for @settingsLanguageAr.
  ///
  /// In en, this message translates to:
  /// **'العربية'**
  String get settingsLanguageAr;

  /// No description provided for @settingsProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get settingsProfile;

  /// No description provided for @settingsEditProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get settingsEditProfile;

  /// No description provided for @settingsNotifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get settingsNotifications;

  /// No description provided for @settingsAbout.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get settingsAbout;

  /// No description provided for @settingsPrivacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get settingsPrivacy;

  /// No description provided for @settingsTerms.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get settingsTerms;

  /// No description provided for @settingsVersion.
  ///
  /// In en, this message translates to:
  /// **'Version {version}'**
  String settingsVersion(String version);

  /// No description provided for @settingsContact.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get settingsContact;

  /// No description provided for @settingsRate.
  ///
  /// In en, this message translates to:
  /// **'Rate App'**
  String get settingsRate;

  /// No description provided for @categoryAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get categoryAll;

  /// No description provided for @categoryHealth.
  ///
  /// In en, this message translates to:
  /// **'Health'**
  String get categoryHealth;

  /// No description provided for @categoryEducation.
  ///
  /// In en, this message translates to:
  /// **'Education'**
  String get categoryEducation;

  /// No description provided for @categoryEnvironment.
  ///
  /// In en, this message translates to:
  /// **'Environment'**
  String get categoryEnvironment;

  /// No description provided for @categoryEmergency.
  ///
  /// In en, this message translates to:
  /// **'Emergency'**
  String get categoryEmergency;

  /// No description provided for @categoryCommunity.
  ///
  /// In en, this message translates to:
  /// **'Community'**
  String get categoryCommunity;

  /// No description provided for @categoryAnimal.
  ///
  /// In en, this message translates to:
  /// **'Animals'**
  String get categoryAnimal;

  /// No description provided for @categoryGeneral.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get categoryGeneral;

  /// No description provided for @commonLoading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get commonLoading;

  /// No description provided for @commonError.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get commonError;

  /// No description provided for @commonRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get commonRetry;

  /// No description provided for @commonCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get commonCancel;

  /// No description provided for @commonConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get commonConfirm;

  /// No description provided for @commonSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get commonSave;

  /// No description provided for @commonClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get commonClose;

  /// No description provided for @commonBack.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get commonBack;

  /// No description provided for @commonNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get commonNext;

  /// No description provided for @commonDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get commonDone;

  /// No description provided for @commonOk.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get commonOk;

  /// No description provided for @commonYes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get commonYes;

  /// No description provided for @commonNo.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get commonNo;

  /// No description provided for @commonSearch.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get commonSearch;

  /// No description provided for @commonSeeAll.
  ///
  /// In en, this message translates to:
  /// **'See All'**
  String get commonSeeAll;

  /// No description provided for @commonNoInternet.
  ///
  /// In en, this message translates to:
  /// **'No internet connection'**
  String get commonNoInternet;

  /// No description provided for @commonNoInternetDesc.
  ///
  /// In en, this message translates to:
  /// **'Please check your connection and try again.'**
  String get commonNoInternetDesc;

  /// No description provided for @commonServerError.
  ///
  /// In en, this message translates to:
  /// **'Server error'**
  String get commonServerError;

  /// No description provided for @commonServerErrorDesc.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong on our end. Please try again later.'**
  String get commonServerErrorDesc;

  /// No description provided for @commonUnknownError.
  ///
  /// In en, this message translates to:
  /// **'Unknown error'**
  String get commonUnknownError;

  /// No description provided for @commonUnknownErrorDesc.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred. Please try again.'**
  String get commonUnknownErrorDesc;

  /// No description provided for @currencySymbol.
  ///
  /// In en, this message translates to:
  /// **'\$'**
  String get currencySymbol;

  /// No description provided for @currencyCode.
  ///
  /// In en, this message translates to:
  /// **'USD'**
  String get currencyCode;

  /// No description provided for @dateFormat.
  ///
  /// In en, this message translates to:
  /// **'MMM d, yyyy'**
  String get dateFormat;

  /// No description provided for @timeFormat.
  ///
  /// In en, this message translates to:
  /// **'h:mm a'**
  String get timeFormat;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
