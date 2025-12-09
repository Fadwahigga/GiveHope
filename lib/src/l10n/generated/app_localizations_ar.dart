// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appName => 'أعطِ أملاً';

  @override
  String get appTagline => 'نصنع الفرق، تبرعاً تلو الآخر';

  @override
  String get navHome => 'الرئيسية';

  @override
  String get navExplore => 'استكشف';

  @override
  String get navHistory => 'السجل';

  @override
  String get navSettings => 'الإعدادات';

  @override
  String get homeTitle => 'اكتشف القضايا';

  @override
  String get homeSubtitle => 'ادعم القضايا التي تهمك';

  @override
  String get homeSearchPlaceholder => 'ابحث عن قضايا...';

  @override
  String get homeFeatured => 'المميزة';

  @override
  String get homeAllCauses => 'جميع القضايا';

  @override
  String get homeCategories => 'التصنيفات';

  @override
  String get homeNoCauses => 'لا توجد قضايا';

  @override
  String get homeNoCausesDesc => 'لا توجد قضايا نشطة حالياً. تحقق لاحقاً!';

  @override
  String get homeRefresh => 'تحديث';

  @override
  String get causeDetailTitle => 'تفاصيل القضية';

  @override
  String get causeRaised => 'تم جمع';

  @override
  String get causeGoal => 'الهدف';

  @override
  String get causeProgress => 'التقدم';

  @override
  String get causeDonors => 'المتبرعون';

  @override
  String get causeDonations => 'التبرعات';

  @override
  String get causeDaysLeft => 'يوم متبقي';

  @override
  String get causeEnded => 'انتهت الحملة';

  @override
  String get causeAbout => 'عن هذه القضية';

  @override
  String get causeOrganizer => 'المنظم';

  @override
  String get causeRecentDonations => 'التبرعات الأخيرة';

  @override
  String get causeNoDonations => 'لا توجد تبرعات بعد';

  @override
  String get causeBeFirst => 'كن أول من يتبرع!';

  @override
  String get causeShare => 'مشاركة';

  @override
  String get causeReport => 'إبلاغ';

  @override
  String get donateTitle => 'قدّم تبرعاً';

  @override
  String get donateAmount => 'مبلغ التبرع';

  @override
  String get donateAmountHint => 'أدخل المبلغ';

  @override
  String get donateAmountError => 'الرجاء إدخال مبلغ صحيح';

  @override
  String donateAmountMin(String amount) {
    return 'الحد الأدنى للتبرع هو $amount';
  }

  @override
  String get donatePhone => 'رقم الهاتف';

  @override
  String get donatePhoneHint => 'أدخل رقم هاتفك';

  @override
  String get donatePhoneError => 'الرجاء إدخال رقم هاتف صحيح';

  @override
  String get donateName => 'اسمك (اختياري)';

  @override
  String get donateNameHint => 'أدخل اسمك';

  @override
  String get donateMessage => 'اترك رسالة (اختياري)';

  @override
  String get donateMessageHint => 'اكتب رسالة دعم...';

  @override
  String get donateAnonymous => 'تبرع بشكل مجهول';

  @override
  String get donateQuickAmount => 'مبالغ سريعة';

  @override
  String get donateCustomAmount => 'مبلغ مخصص';

  @override
  String get donateContinue => 'المتابعة للدفع';

  @override
  String get donateProcessing => 'جارٍ المعالجة...';

  @override
  String get donateSuccess => 'شكراً لتبرعك!';

  @override
  String donateSuccessDesc(String amount, String cause) {
    return 'تم معالجة تبرعك بمبلغ $amount لـ $cause بنجاح.';
  }

  @override
  String get donateFailed => 'فشل التبرع';

  @override
  String get donateFailedDesc =>
      'لم نتمكن من معالجة تبرعك. الرجاء المحاولة مرة أخرى.';

  @override
  String get donateRetry => 'حاول مجدداً';

  @override
  String get donateDone => 'تم';

  @override
  String get historyTitle => 'سجل التبرعات';

  @override
  String get historySubtitle => 'عرض تبرعاتك السابقة';

  @override
  String get historyEnterPhone => 'أدخل رقم هاتفك لعرض سجل تبرعاتك';

  @override
  String get historyPhoneHint => 'رقم الهاتف';

  @override
  String get historySearch => 'عرض السجل';

  @override
  String get historyNoResults => 'لا توجد تبرعات';

  @override
  String get historyNoResultsDesc =>
      'لم تقم بأي تبرعات بعد. ابدأ بالعطاء اليوم!';

  @override
  String get historyTotal => 'إجمالي التبرعات';

  @override
  String historyCount(int count) {
    return '$count تبرعات';
  }

  @override
  String get historyStatusPending => 'قيد الانتظار';

  @override
  String get historyStatusCompleted => 'مكتمل';

  @override
  String get historyStatusFailed => 'فشل';

  @override
  String get historyStatusRefunded => 'مسترد';

  @override
  String get payoutTitle => 'إدارة المدفوعات';

  @override
  String get payoutSubtitle => 'إدارة أموال قضيتك';

  @override
  String get payoutAvailable => 'متاح للسحب';

  @override
  String get payoutTotal => 'إجمالي المستلم';

  @override
  String get payoutRequest => 'طلب سحب';

  @override
  String get payoutAmount => 'مبلغ السحب';

  @override
  String get payoutAmountHint => 'أدخل المبلغ للسحب';

  @override
  String get payoutAmountError => 'الرجاء إدخال مبلغ صحيح';

  @override
  String payoutAmountMax(String amount) {
    return 'الحد الأقصى المتاح: $amount';
  }

  @override
  String get payoutNotes => 'ملاحظات (اختياري)';

  @override
  String get payoutNotesHint => 'أضف أي ملاحظات...';

  @override
  String get payoutSubmit => 'تقديم الطلب';

  @override
  String get payoutProcessing => 'جارٍ المعالجة...';

  @override
  String get payoutSuccess => 'تم طلب السحب';

  @override
  String payoutSuccessDesc(String amount) {
    return 'تم تقديم طلب السحب بمبلغ $amount.';
  }

  @override
  String get payoutFailed => 'فشل السحب';

  @override
  String get payoutFailedDesc =>
      'لم نتمكن من معالجة طلب السحب. الرجاء المحاولة مرة أخرى.';

  @override
  String get payoutHistory => 'سجل المدفوعات';

  @override
  String get payoutNoHistory => 'لا توجد مدفوعات بعد';

  @override
  String get payoutStatusPending => 'قيد الانتظار';

  @override
  String get payoutStatusProcessing => 'قيد المعالجة';

  @override
  String get payoutStatusCompleted => 'مكتمل';

  @override
  String get payoutStatusFailed => 'فشل';

  @override
  String get payoutStatusCancelled => 'ملغى';

  @override
  String get settingsTitle => 'الإعدادات';

  @override
  String get settingsAppearance => 'المظهر';

  @override
  String get settingsTheme => 'السمة';

  @override
  String get settingsThemeLight => 'فاتح';

  @override
  String get settingsThemeDark => 'داكن';

  @override
  String get settingsThemeSystem => 'النظام';

  @override
  String get settingsLanguage => 'اللغة';

  @override
  String get settingsLanguageEn => 'English';

  @override
  String get settingsLanguageAr => 'العربية';

  @override
  String get settingsProfile => 'الملف الشخصي';

  @override
  String get settingsEditProfile => 'تعديل الملف الشخصي';

  @override
  String get settingsNotifications => 'الإشعارات';

  @override
  String get settingsAbout => 'حول';

  @override
  String get settingsPrivacy => 'سياسة الخصوصية';

  @override
  String get settingsTerms => 'شروط الخدمة';

  @override
  String settingsVersion(String version) {
    return 'الإصدار $version';
  }

  @override
  String get settingsContact => 'تواصل معنا';

  @override
  String get settingsRate => 'قيّم التطبيق';

  @override
  String get categoryAll => 'الكل';

  @override
  String get categoryHealth => 'الصحة';

  @override
  String get categoryEducation => 'التعليم';

  @override
  String get categoryEnvironment => 'البيئة';

  @override
  String get categoryEmergency => 'الطوارئ';

  @override
  String get categoryCommunity => 'المجتمع';

  @override
  String get categoryAnimal => 'الحيوانات';

  @override
  String get categoryGeneral => 'عام';

  @override
  String get commonLoading => 'جارٍ التحميل...';

  @override
  String get commonError => 'حدث خطأ ما';

  @override
  String get commonRetry => 'إعادة المحاولة';

  @override
  String get commonCancel => 'إلغاء';

  @override
  String get commonConfirm => 'تأكيد';

  @override
  String get commonSave => 'حفظ';

  @override
  String get commonClose => 'إغلاق';

  @override
  String get commonBack => 'رجوع';

  @override
  String get commonNext => 'التالي';

  @override
  String get commonDone => 'تم';

  @override
  String get commonOk => 'حسناً';

  @override
  String get commonYes => 'نعم';

  @override
  String get commonNo => 'لا';

  @override
  String get commonSearch => 'بحث';

  @override
  String get commonSeeAll => 'عرض الكل';

  @override
  String get commonNoInternet => 'لا يوجد اتصال بالإنترنت';

  @override
  String get commonNoInternetDesc =>
      'الرجاء التحقق من اتصالك والمحاولة مرة أخرى.';

  @override
  String get commonServerError => 'خطأ في الخادم';

  @override
  String get commonServerErrorDesc =>
      'حدث خطأ من جانبنا. الرجاء المحاولة لاحقاً.';

  @override
  String get commonUnknownError => 'خطأ غير معروف';

  @override
  String get commonUnknownErrorDesc =>
      'حدث خطأ غير متوقع. الرجاء المحاولة مرة أخرى.';

  @override
  String get currencySymbol => '\$';

  @override
  String get currencyCode => 'USD';

  @override
  String get dateFormat => 'd MMM yyyy';

  @override
  String get timeFormat => 'h:mm a';
}
