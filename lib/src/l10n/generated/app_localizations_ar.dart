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
  String get donateCurrency => 'العملة';

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
  String get settingsHelp => 'المساعدة والأسئلة الشائعة';

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
  String get errorConnectionFailed =>
      'تعذر الاتصال بالخادم. الرجاء التحقق من اتصالك والمحاولة مرة أخرى.';

  @override
  String get errorRequestTimeout =>
      'انتهت مهلة الطلب. الرجاء المحاولة مرة أخرى.';

  @override
  String get errorNetworkError => 'خطأ في الشبكة. الرجاء المحاولة مرة أخرى.';

  @override
  String get errorUnexpected => 'حدث خطأ غير متوقع. الرجاء المحاولة مرة أخرى.';

  @override
  String get errorAnErrorOccurred => 'حدث خطأ';

  @override
  String get validationPhoneRequired => 'رقم الهاتف مطلوب';

  @override
  String get validationPhoneInvalid => 'الرجاء إدخال رقم هاتف صحيح';

  @override
  String get validationPhoneTooLong => 'رقم الهاتف طويل جداً';

  @override
  String get validationAmountRequired => 'المبلغ مطلوب';

  @override
  String get validationAmountInvalid => 'الرجاء إدخال مبلغ صحيح';

  @override
  String validationAmountMin(String symbol, String amount) {
    return 'الحد الأدنى للمبلغ هو $symbol$amount';
  }

  @override
  String validationAmountMax(String symbol, String amount) {
    return 'الحد الأقصى للمبلغ هو $symbol$amount';
  }

  @override
  String get validationEmailRequired => 'البريد الإلكتروني مطلوب';

  @override
  String get validationEmailInvalid => 'الرجاء إدخال بريد إلكتروني صحيح';

  @override
  String get validationNameRequired => 'الاسم مطلوب';

  @override
  String get validationNameTooLong => 'الاسم طويل جداً';

  @override
  String get validationNameInvalid => 'الرجاء إدخال اسم صحيح';

  @override
  String validationMessageTooLong(int max) {
    return 'الرسالة طويلة جداً (الحد الأقصى $max حرف)';
  }

  @override
  String get validationFieldRequired => 'هذا الحقل مطلوب';

  @override
  String get validationPositiveNumberRequired => 'هذا الحقل مطلوب';

  @override
  String get validationPositiveNumberInvalid => 'الرجاء إدخال رقم موجب صحيح';

  @override
  String get currencySymbol => 'FCFA';

  @override
  String get currencyCode => 'XAF';

  @override
  String get dateFormat => 'd MMM yyyy';

  @override
  String get timeFormat => 'h:mm a';

  @override
  String get privacyTitle => 'سياسة الخصوصية';

  @override
  String get privacyLastUpdated => 'آخر تحديث: يناير 2024';

  @override
  String get privacyIntroduction => 'مقدمة';

  @override
  String get privacyIntroductionDesc =>
      'في أعطِ أملاً، نحن ملتزمون بحماية خصوصيتك ومعلوماتك الشخصية. توضح سياسة الخصوصية هذه كيفية جمع واستخدام وحماية بياناتك عند استخدام تطبيق التبرعات والمدفوعات الصغيرة الخاص بنا.';

  @override
  String get privacyInformationWeCollect => 'المعلومات التي نجمعها';

  @override
  String get privacyInformationWeCollectDesc =>
      'نجمع المعلومات التي تقدمها لنا مباشرة، بما في ذلك اسمك وعنوان بريدك الإلكتروني ورقم هاتفك ومعلومات الدفع عند إنشاء حساب أو إجراء تبرعات أو إنشاء قضايا. كما نجمع بيانات الاستخدام ومعلومات الجهاز لتحسين خدماتنا.';

  @override
  String get privacyHowWeUse => 'كيف نستخدم معلوماتك';

  @override
  String get privacyHowWeUseDesc =>
      'نستخدم معلوماتك لمعالجة التبرعات وإدارة حسابك والتواصل معك حول معاملاتك وتحسين خدماتنا والامتثال للالتزامات القانونية. لا نبيع معلوماتك الشخصية لأطراف ثالثة.';

  @override
  String get privacyDataSecurity => 'أمان البيانات';

  @override
  String get privacyDataSecurityDesc =>
      'نطبق تدابير أمنية معيارية في الصناعة لحماية معلوماتك الشخصية، بما في ذلك التشفير والمصادقة الآمنة والتدقيق الأمني المنتظم. ومع ذلك، لا توجد طريقة نقل عبر الإنترنت آمنة بنسبة 100٪.';

  @override
  String get privacyThirdParty => 'خدمات الطرف الثالث';

  @override
  String get privacyThirdPartyDesc =>
      'نستخدم MTN Mobile Money (MoMo) لمعالجة المدفوعات. عند إجراء تبرع، تتم معالجة معلومات الدفع الخاصة بك بأمان من خلال بوابة الدفع الخاصة بـ MTN. يرجى مراجعة سياسة الخصوصية الخاصة بـ MTN للحصول على معلومات حول كيفية تعاملهم مع بياناتك.';

  @override
  String get privacyYourRights => 'حقوقك';

  @override
  String get privacyYourRightsDesc =>
      'لديك الحق في الوصول إلى معلوماتك الشخصية أو تحديثها أو حذفها في أي وقت. يمكنك أيضاً إلغاء الاشتراك في بعض الاتصالات. لممارسة هذه الحقوق، يرجى الاتصال بنا باستخدام المعلومات المقدمة أدناه.';

  @override
  String get privacyChildren => 'خصوصية الأطفال';

  @override
  String get privacyChildrenDesc =>
      'خدماتنا غير مخصصة للأطفال دون سن 18 عاماً. لا نجمع معلومات شخصية من الأطفال عن علم. إذا كنت تعتقد أننا جمعنا معلومات من طفل، يرجى الاتصال بنا على الفور.';

  @override
  String get privacyChanges => 'تغييرات سياسة الخصوصية';

  @override
  String get privacyChangesDesc =>
      'قد نحدث سياسة الخصوصية هذه من وقت لآخر. سنخطرك بأي تغييرات عن طريق نشر سياسة الخصوصية الجديدة على هذه الصفحة وتحديث تاريخ \"آخر تحديث\". يُنصح بمراجعة سياسة الخصوصية هذه بشكل دوري.';

  @override
  String get privacyContact => 'تواصل معنا';

  @override
  String get privacyContactDesc =>
      'إذا كان لديك أي أسئلة حول سياسة الخصوصية هذه، يرجى الاتصال بنا:';

  @override
  String get privacyContactEmail => 'fadwa.ali20@gmail.com';

  @override
  String get privacyContactUs => 'تواصل معنا';

  @override
  String get termsTitle => 'شروط الخدمة';

  @override
  String get termsLastUpdated => 'آخر تحديث: يناير 2024';

  @override
  String get termsIntroduction => 'مقدمة';

  @override
  String get termsIntroductionDesc =>
      'مرحباً بك في أعطِ أملاً. تحكم شروط الخدمة هذه استخدامك لتطبيق التبرعات والمدفوعات الصغيرة الخاص بنا. باستخدام تطبيقنا، فإنك توافق على الالتزام بهذه الشروط. يرجى قراءتها بعناية.';

  @override
  String get termsAcceptance => 'قبول الشروط';

  @override
  String get termsAcceptanceDesc =>
      'من خلال الوصول إلى أعطِ أملاً أو استخدامه، فإنك توافق على الامتثال والالتزام بشروط الخدمة هذه. إذا كنت لا توافق على أي جزء من هذه الشروط، فلا يجوز لك استخدام خدماتنا.';

  @override
  String get termsUseOfService => 'استخدام الخدمة';

  @override
  String get termsUseOfServiceDesc =>
      'يمكنك استخدام أعطِ أملاً لتصفح القضايا وإجراء التبرعات وإنشاء القضايا. توافق على استخدام الخدمة فقط للأغراض القانونية ووفقاً لهذه الشروط. أنت مسؤول عن الحفاظ على سرية بيانات اعتماد حسابك.';

  @override
  String get termsUserAccounts => 'حسابات المستخدمين';

  @override
  String get termsUserAccountsDesc =>
      'لاستخدام ميزات معينة، يجب عليك إنشاء حساب. أنت مسؤول عن تقديم معلومات دقيقة والحفاظ على أمان حسابك. يجب عليك إخطارنا فوراً بأي استخدام غير مصرح به لحسابك.';

  @override
  String get termsDonations => 'التبرعات والمدفوعات';

  @override
  String get termsDonationsDesc =>
      'يتم معالجة جميع التبرعات من خلال MTN Mobile Money (MoMo). التبرعات نهائية وغير قابلة للاسترداد ما لم يقتض القانون ذلك. نحن لسنا مسؤولين عن أفعال منشئي القضايا أو استخدام الأموال المتبرع بها. يرجى التحقق من معلومات القضية قبل التبرع.';

  @override
  String get termsProhibited => 'الأنشطة المحظورة';

  @override
  String get termsProhibitedDesc =>
      'توافق على عدم استخدام أعطِ أملاً لأي أنشطة غير قانونية أو احتيال أو غسيل أموال أو لإنشاء قضايا كاذبة. لا يجوز لك التدخل في تشغيل الخدمة أو محاولة الحصول على وصول غير مصرح به لأنظمتنا.';

  @override
  String get termsIntellectual => 'الملكية الفكرية';

  @override
  String get termsIntellectualDesc =>
      'جميع المحتويات والميزات والوظائف الخاصة بأعطِ أملاً مملوكة لنا ومحمية بموجب قوانين حقوق النشر والعلامات التجارية وقوانين الملكية الفكرية الأخرى. لا يجوز لك نسخ أو توزيع أو إنشاء أعمال مشتقة دون إذننا.';

  @override
  String get termsLiability => 'تحديد المسؤولية';

  @override
  String get termsLiabilityDesc =>
      'يتم توفير أعطِ أملاً \"كما هو\" دون ضمانات من أي نوع. نحن لسنا مسؤولين عن أي أضرار ناتجة عن استخدامك للخدمة، بما في ذلك على سبيل المثال لا الحصر نزاعات التبرعات أو مشاكل معالجة المدفوعات أو الأمور المتعلقة بالقضايا.';

  @override
  String get termsTermination => 'إنهاء الخدمة';

  @override
  String get termsTerminationDesc =>
      'نحتفظ بالحق في تعليق أو إنهاء حسابك في أي وقت لانتهاك هذه الشروط أو لأي سبب آخر نراه ضرورياً. يمكنك أيضاً إنهاء حسابك في أي وقت عن طريق الاتصال بنا.';

  @override
  String get termsChanges => 'تغييرات الشروط';

  @override
  String get termsChangesDesc =>
      'قد نعدل شروط الخدمة هذه في أي وقت. سنخطرك بالتغييرات المهمة عن طريق نشر الشروط المحدثة في التطبيق. استمرارك في استخدام الخدمة بعد التغييرات يشكل قبولاً للشروط الجديدة.';

  @override
  String get termsContact => 'تواصل معنا';

  @override
  String get termsContactDesc =>
      'إذا كان لديك أي أسئلة حول شروط الخدمة هذه، يرجى الاتصال بنا:';

  @override
  String get termsContactEmail => 'fadwa.ali20@gmail.com';

  @override
  String get termsContactUs => 'تواصل معنا';

  @override
  String get faqTitle => 'الأسئلة الشائعة';

  @override
  String get faqSubtitle => 'ابحث عن إجابات للأسئلة الشائعة';

  @override
  String get faqQuestion1 => 'كيف أقوم بالتبرع؟';

  @override
  String get faqAnswer1 =>
      'لإجراء تبرع، تصفح القضايا على الشاشة الرئيسية، واختر قضية ترغب في دعمها، واضغط على زر \"تبرع\". أدخل المبلغ ورقم هاتف MTN MoMo الخاص بك. سيتم إرسال طلب دفع إلى هاتفك للموافقة.';

  @override
  String get faqQuestion2 => 'هل دفعي آمن؟';

  @override
  String get faqAnswer2 =>
      'نعم، يتم معالجة جميع المدفوعات بأمان من خلال MTN Mobile Money (MoMo)، وهي بوابة دفع موثوقة. لا نخزن بيانات اعتماد الدفع الخاصة بك، وجميع المعاملات مشفرة.';

  @override
  String get faqQuestion3 => 'هل يمكنني الحصول على استرداد؟';

  @override
  String get faqAnswer3 =>
      'التبرعات نهائية بشكل عام وغير قابلة للاسترداد. ومع ذلك، إذا كنت تعتقد أن هناك خطأ أو احتيال، يرجى الاتصال بنا على الفور على fadwa.ali20@gmail.com مع تفاصيل معاملتك.';

  @override
  String get faqQuestion4 => 'كيف أنشئ قضية؟';

  @override
  String get faqAnswer4 =>
      'لإنشاء قضية، يجب أن تكون مسجلاً الدخول. اضغط على زر \"إنشاء قضية\"، واملأ تفاصيل القضية بما في ذلك الاسم والوصف ورقم هاتف MTN MoMo الخاص بك (حيث ستستلم المدفوعات). أرسل النموذج لإنشاء قضيتك.';

  @override
  String get faqQuestion5 => 'كيف أستلم المدفوعات؟';

  @override
  String get faqAnswer5 =>
      'كمالك قضية، يمكنك طلب المدفوعات من شاشة إدارة المدفوعات. أدخل المبلغ الذي تريد سحبه، وسيتم تحويل الأموال إلى حساب MTN MoMo المسجل لديك. قد تستغرق المدفوعات بضع دقائق للمعالجة.';

  @override
  String get faqQuestion6 => 'ماذا لو كان دفعي قيد الانتظار؟';

  @override
  String get faqAnswer6 =>
      'إذا كان دفعتك قيد الانتظار، تحقق من هاتفك لطلب دفع MTN MoMo ووافق عليه. إذا كنت قد وافقت بالفعل لكنه لا يزال قيد الانتظار، انتظر لحظات حيث قد تستغرق المعالجة وقتاً. يمكنك أيضاً التحقق من حالة التبرع في التطبيق.';

  @override
  String get faqQuestion7 => 'كيف أعرض سجل تبرعاتي؟';

  @override
  String get faqAnswer7 =>
      'انتقل إلى علامة تبويب السجل وأدخل رقم هاتفك. سترى جميع تبرعاتك السابقة، بما في ذلك المبلغ والقضية والتاريخ وحالة كل تبرع.';

  @override
  String get faqQuestion8 => 'هل معلوماتي الشخصية آمنة؟';

  @override
  String get faqAnswer8 =>
      'نعم، نحن نأخذ خصوصيتك على محمل الجد. نستخدم تدابير أمنية معيارية في الصناعة لحماية بياناتك. لا نبيع معلوماتك الشخصية لأطراف ثالثة. لمزيد من التفاصيل، يرجى قراءة سياسة الخصوصية الخاصة بنا.';

  @override
  String get faqStillHaveQuestions => 'لا تزال لديك أسئلة؟';

  @override
  String get faqContactUs =>
      'لا تتردد في التواصل معنا عبر البريد الإلكتروني أو استخدم نموذج الاتصال أعلاه.';

  @override
  String get contactTitle => 'تواصل معنا';

  @override
  String get contactSubtitle => 'نحن هنا للمساعدة. تواصل معنا!';

  @override
  String get contactEmailLabel => 'عنوان البريد الإلكتروني';

  @override
  String get contactEmail => 'fadwa.ali20@gmail.com';

  @override
  String get contactCopyEmail => 'نسخ عنوان البريد الإلكتروني';

  @override
  String get contactEmailCopied => 'تم نسخ عنوان البريد الإلكتروني إلى الحافظة';

  @override
  String get contactOpenEmail => 'فتح تطبيق البريد';

  @override
  String get contactFormTitle => 'أرسل لنا رسالة';

  @override
  String get contactFormName => 'اسمك';

  @override
  String get contactFormNameHint => 'أدخل اسمك الكامل';

  @override
  String get contactFormNameRequired => 'الاسم مطلوب';

  @override
  String get contactFormEmail => 'بريدك الإلكتروني';

  @override
  String get contactFormEmailHint => 'أدخل عنوان بريدك الإلكتروني';

  @override
  String get contactFormEmailRequired => 'البريد الإلكتروني مطلوب';

  @override
  String get contactFormEmailInvalid => 'الرجاء إدخال عنوان بريد إلكتروني صحيح';

  @override
  String get contactFormSubject => 'الموضوع';

  @override
  String get contactFormSubjectHint => 'بم يتعلق هذا؟';

  @override
  String get contactFormSubjectRequired => 'الموضوع مطلوب';

  @override
  String get contactFormMessage => 'الرسالة';

  @override
  String get contactFormMessageHint => 'أخبرنا كيف يمكننا المساعدة...';

  @override
  String get contactFormMessageRequired => 'الرسالة مطلوب';

  @override
  String get contactFormMessageMinLength =>
      'يجب أن تكون الرسالة 10 أحرف على الأقل';

  @override
  String get contactFormSubmit => 'إرسال الرسالة';

  @override
  String get contactFormSuccess =>
      'تم فتح تطبيق البريد بنجاح! يرجى إرسال رسالتك.';

  @override
  String get contactFormError =>
      'تعذر فتح تطبيق البريد. يرجى المحاولة مرة أخرى أو مراسلتنا مباشرة على fadwa.ali20@gmail.com';

  @override
  String get contactStillHaveQuestions => 'لا تزال لديك أسئلة؟';

  @override
  String get contactContactUs =>
      'لا تتردد في التواصل معنا عبر البريد الإلكتروني أو استخدم نموذج الاتصال أعلاه.';
}
