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
  String get homeNoCausesYet => 'لا توجد قضايا بعد';

  @override
  String get homeNoCausesYetDesc => 'كن أول من ينشئ قضية!';

  @override
  String get homeCreateCause => 'إنشاء قضية';

  @override
  String get homeRefresh => 'تحديث';

  @override
  String get homeLoading => 'جارٍ تحميل القضايا...';

  @override
  String get bannerTitle1 => 'اصنع الفرق';

  @override
  String get bannerDesc1 =>
      'ادعم القضايا التي تهمك عبر مدفوعات MTN MoMo الآمنة';

  @override
  String get bannerTitle2 => 'سهل وسريع';

  @override
  String get bannerDesc2 => 'تبرع في ثوانٍ بضغطة واحدة. بدون تعقيدات';

  @override
  String get bannerTitle3 => 'شفاف';

  @override
  String get bannerDesc3 =>
      'تتبع تبرعاتك وشاهد كيف تساهم تبرعاتك في إحداث تأثير';

  @override
  String get bannerTitle4 => 'مدفوعات آمنة';

  @override
  String get bannerDesc4 =>
      'جميع المعاملات تتم معالجتها بأمان عبر MTN Mobile Money';

  @override
  String get authLogin => 'تسجيل الدخول';

  @override
  String get authLoginTitle => 'مرحباً بعودتك';

  @override
  String get authLoginSubtitle => 'سجل الدخول للمتابعة في صنع الفرق';

  @override
  String get authEmail => 'البريد الإلكتروني';

  @override
  String get authEmailHint => 'أدخل بريدك الإلكتروني';

  @override
  String get authPassword => 'كلمة المرور';

  @override
  String get authPasswordHint => 'أدخل كلمة المرور';

  @override
  String get authNoAccount => 'ليس لديك حساب؟ ';

  @override
  String get authSignUp => 'إنشاء حساب';

  @override
  String get authOr => 'أو';

  @override
  String get authContinueGuest => 'المتابعة كضيف';

  @override
  String get authRegister => 'إنشاء حساب';

  @override
  String get authRegisterTitle => 'انضم إلى أعطِ أملاً';

  @override
  String get authRegisterSubtitle => 'أنشئ حساباً لبدء التبرع';

  @override
  String get authName => 'الاسم الكامل (اختياري)';

  @override
  String get authNameHint => 'أدخل اسمك';

  @override
  String get authPhone => 'رقم الهاتف (اختياري)';

  @override
  String get authPhoneHint => 'مثال: +237670000001';

  @override
  String get authConfirmPassword => 'تأكيد كلمة المرور';

  @override
  String get authConfirmPasswordHint => 'أكد كلمة المرور';

  @override
  String get authPasswordMismatch => 'كلمات المرور غير متطابقة';

  @override
  String authPasswordMin(int length) {
    return 'يجب أن تكون كلمة المرور $length أحرف على الأقل';
  }

  @override
  String get authAlreadyAccount => 'لديك حساب بالفعل؟ ';

  @override
  String get authSignIn => 'تسجيل الدخول';

  @override
  String get authMoMoInfo => 'سيتم استخدام رقم هاتفك لمدفوعات MTN MoMo';

  @override
  String get authRequired => 'هذا الحقل مطلوب';

  @override
  String get authInvalidEmail => 'الرجاء إدخال بريد إلكتروني صحيح';

  @override
  String get authInvalidPassword =>
      'البريد الإلكتروني أو كلمة المرور غير صحيحة';

  @override
  String get authUserExists => 'يوجد مستخدم بهذا البريد الإلكتروني بالفعل';

  @override
  String get authRegistrationFailed => 'فشل التسجيل. الرجاء المحاولة مرة أخرى.';

  @override
  String get authLoginFailed => 'فشل تسجيل الدخول. الرجاء المحاولة مرة أخرى.';

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
  String get causeTotalReceived => 'إجمالي المستلم';

  @override
  String get causeAvailable => 'المتاح';

  @override
  String get causeBy => 'بواسطة';

  @override
  String get causeLoading => 'جارٍ تحميل تفاصيل القضية...';

  @override
  String get causeNotFound => 'القضية غير موجودة';

  @override
  String get causeNotFoundDesc => 'القضية التي تبحث عنها غير موجودة.';

  @override
  String get causeGoBack => 'رجوع';

  @override
  String get causeManagePayouts => 'إدارة المدفوعات';

  @override
  String get causeCreateTitle => 'إنشاء قضية';

  @override
  String get causeCreateHeader => 'ابدأ قضية';

  @override
  String get causeCreateSubtitle => 'أنشئ قضية لاستقبال التبرعات';

  @override
  String get causeCreateName => 'اسم القضية';

  @override
  String get causeCreateNameHint => 'مثال: مساعدة بناء مدرسة';

  @override
  String get causeCreateNameRequired => 'اسم القضية مطلوب';

  @override
  String get causeCreateDescription => 'الوصف (اختياري)';

  @override
  String get causeCreateDescriptionHint =>
      'اوصف قضيتك وكيف سيتم استخدام الأموال...';

  @override
  String get causeCreateOwnerPhone => 'رقم هاتف المالك';

  @override
  String get causeCreateOwnerPhoneHint => 'مثال: +237670000001';

  @override
  String get causeCreateMoMoWarning =>
      'سيتم استلام المدفوعات على هذا الرقم عبر MTN MoMo. تأكد أنه حساب MTN Mobile Money نشط.';

  @override
  String get causeCreateSuccess => 'تم إنشاء القضية بنجاح!';

  @override
  String get causeCreateFailed => 'فشل إنشاء القضية. الرجاء المحاولة مرة أخرى.';

  @override
  String get donateTitle => 'قدّم تبرعاً';

  @override
  String get donateDonatingTo => 'التبرع لـ';

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
  String get donatePhone => 'رقم هاتف MTN MoMo';

  @override
  String get donatePhoneHint => 'مثال: +237670000001';

  @override
  String get donatePhoneError => 'الرجاء إدخال رقم هاتف صحيح';

  @override
  String get donateMoMoInfo => 'سيتم إرسال طلب دفع إلى رقم MTN MoMo هذا';

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
  String donateQuickAmount(String currency) {
    return 'مبالغ سريعة ($currency)';
  }

  @override
  String get donateCustomAmount => 'مبلغ مخصص';

  @override
  String get donateContinue => 'تبرع عبر MTN MoMo';

  @override
  String get donateProcessing => 'جارٍ المعالجة...';

  @override
  String get donateWaiting => 'في انتظار الدفع';

  @override
  String donateWaitingDesc(String amount, String currency) {
    return 'تم إرسال طلب دفع إلى هاتفك.\n\nالرجاء الموافقة على دفع MTN MoMo بمبلغ $amount $currency.';
  }

  @override
  String get donateSuccess => 'شكراً لك!';

  @override
  String donateSuccessDesc(String amount, String currency, String cause) {
    return 'تم معالجة تبرعك بمبلغ $amount $currency لـ \"$cause\" بنجاح.';
  }

  @override
  String get donateFailed => 'فشل التبرع';

  @override
  String get donateFailedDesc =>
      'لم نتمكن من معالجة تبرعك. الرجاء المحاولة مرة أخرى.';

  @override
  String get donatePending => 'الدفع قيد الانتظار';

  @override
  String get donatePendingDesc =>
      'الدفع لا يزال قيد الانتظار. الرجاء التحقق من هاتفك والموافقة على طلب دفع MTN MoMo.\n\nإذا كنت قد وافقت بالفعل، قد يستغرق الأمر لحظة للمعالجة.';

  @override
  String get donateRetry => 'حاول مجدداً';

  @override
  String get donateDone => 'تم';

  @override
  String get donateCancel => 'إلغاء';

  @override
  String get historyTitle => 'سجل التبرعات';

  @override
  String get historySubtitle => 'عرض تبرعاتك السابقة';

  @override
  String get historyEnterPhone => 'أدخل رقم هاتفك لعرض سجل تبرعاتك';

  @override
  String get historyPhoneHint => 'مثال: +237670000001';

  @override
  String get historySearch => 'بحث';

  @override
  String get historyViewHistory => 'عرض السجل';

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
  String get historyStatusSuccess => 'نجح';

  @override
  String get historyStatusFailed => 'فشل';

  @override
  String get historyLoading => 'جارٍ تحميل السجل...';

  @override
  String get historyGetStarted => 'عرض سجل تبرعاتك';

  @override
  String get historyGetStartedDesc => 'أدخل رقم هاتفك أعلاه للبدء';

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
  String get payoutSuccessDesc => 'تم تقديم طلب السحب بنجاح!';

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
  String get payoutNoFunds =>
      'لا توجد أموال متاحة للسحب. استقبل بعض التبرعات أولاً!';

  @override
  String payoutMoMoInfo(String phone) {
    return 'سيتم إرسال الأموال إلى حساب MTN MoMo: $phone';
  }

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
  String get payoutLoading => 'جارٍ التحميل...';

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
  String get settingsChooseTheme => 'اختر السمة';

  @override
  String get settingsChooseLanguage => 'اختر اللغة';

  @override
  String get settingsAboutTitle => 'حول أعطِ أملاً';

  @override
  String get settingsAboutDesc =>
      'أعطِ أملاً هو تطبيق تبرعات ومدفوعات صغيرة مصمم لجعل العطاء الخيري سهلاً ومتاحاً.';

  @override
  String get settingsAboutMission =>
      'مهمتنا هي ربط المتبرعين الكرماء بالقضايا المهمة، وتمكين المجتمعات تبرعاً تلو الآخر.';

  @override
  String get settingsPrivacyComingSoon => 'سياسة الخصوصية قريباً';

  @override
  String get settingsTermsComingSoon => 'شروط الخدمة قريباً';

  @override
  String get settingsHelpComingSoon => 'المساعدة والأسئلة الشائعة قريباً';

  @override
  String get settingsContactComingSoon => 'نموذج الاتصال قريباً';

  @override
  String get settingsRateComingSoon => 'تقييم المتجر قريباً';

  @override
  String get settingsLogout => 'تسجيل الخروج';

  @override
  String get settingsLogoutConfirm => 'هل أنت متأكد من تسجيل الخروج؟';

  @override
  String get settingsLogoutConfirmDesc =>
      'ستحتاج إلى تسجيل الدخول مرة أخرى للوصول إلى حسابك.';

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
      'يبدو أنك غير متصل بالإنترنت. الرجاء التحقق من اتصالك بالإنترنت والمحاولة مرة أخرى.';

  @override
  String get noInternetTip1 => 'تحقق من Wi-Fi أو بيانات الجوال';

  @override
  String get noInternetTip2 => 'تأكد من إيقاف وضع الطيران';

  @override
  String get noInternetTip3 => 'حاول الانتقال إلى منطقة بإشارة أفضل';

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
  String get commonCreated => 'تم الإنشاء';

  @override
  String get commonRaised => 'تم جمع';

  @override
  String get commonDonations => 'تبرعات';

  @override
  String get commonWelcome => 'مرحباً';

  @override
  String get currencySymbol => 'FCFA';

  @override
  String get currencyCode => 'XAF';

  @override
  String get dateFormat => 'd MMM yyyy';

  @override
  String get timeFormat => 'h:mm a';
}
