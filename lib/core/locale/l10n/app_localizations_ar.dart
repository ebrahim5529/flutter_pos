// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get welcome => 'أهلاً!';

  @override
  String get welcomeSubtitle => 'أهلاً بك في تطبيق نقاط البيع';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get emailHint => 'any@email.com';

  @override
  String get name => 'الاسم';

  @override
  String get yourName => 'اسمك';

  @override
  String get yourNameHint => 'اسمك...';

  @override
  String get signIn => 'تسجيل الدخول';

  @override
  String get enterEmailOrName => 'أدخل بريداً أو اسماً للمتابعة';

  @override
  String get home => 'الرئيسية';

  @override
  String get products => 'المنتجات';

  @override
  String get transactions => 'المعاملات';

  @override
  String get account => 'الحساب';

  @override
  String get profile => 'الملف الشخصي';

  @override
  String get theme => 'المظهر';

  @override
  String get language => 'اللغة';

  @override
  String get arabic => 'العربية';

  @override
  String get english => 'English';

  @override
  String get close => 'إغلاق';

  @override
  String get printerSettings => 'إعدادات الطابعة';

  @override
  String get about => 'من أنا';

  @override
  String get darkMode => 'الوضع الداكن';

  @override
  String get signOut => 'تسجيل الخروج';

  @override
  String get confirm => 'تأكيد';

  @override
  String get signOutConfirm => 'هل تريد تسجيل الخروج؟';

  @override
  String get cancel => 'إلغاء';

  @override
  String get noName => '(بدون اسم)';

  @override
  String get noProductName => '(بدون اسم)';

  @override
  String get online => 'متصل';

  @override
  String get offline => 'غير متصل';

  @override
  String get onlineMessage => 'متصل بالإنترنت';

  @override
  String get offlineMessage => 'لا يوجد اتصال، التطبيق يعمل محلياً';

  @override
  String get noProducts => 'لا توجد منتجات، أضف منتجاً للمتابعة';

  @override
  String get addProduct => 'إضافة منتج';

  @override
  String get searchProducts => 'البحث في المنتجات...';

  @override
  String get enterAmount => 'أدخل الكمية';

  @override
  String get addToCart => 'أضف إلى السلة';

  @override
  String get noTransactions => 'لا توجد معاملات';

  @override
  String get searchTransactionId => 'البحث برقم المعاملة...';

  @override
  String get notFound => 'غير موجود';

  @override
  String get reprint => 'إعادة الطباعة';

  @override
  String get transactionCreated => 'تم إنشاء المعاملة';

  @override
  String get transactionId => 'رقم المعاملة';

  @override
  String get paymentMethod => 'طريقة الدفع';

  @override
  String get createdBy => 'أنشئت بواسطة';

  @override
  String get createdAt => 'تاريخ الإنشاء';

  @override
  String get customerName => 'اسم العميل';

  @override
  String get description => 'الوصف';

  @override
  String get orderedProducts => 'المنتجات المطلوبة';

  @override
  String get total => 'الإجمالي';

  @override
  String get paymentReceived => 'المبلغ المستلم';

  @override
  String get change => 'الباقي';

  @override
  String get productDetail => 'تفاصيل المنتج';

  @override
  String get editProduct => 'تعديل المنتج';

  @override
  String get createProduct => 'إنشاء منتج';

  @override
  String get productImage => 'صورة المنتج';

  @override
  String get price => 'السعر';

  @override
  String get stock => 'المخزون';

  @override
  String get sold => 'المباع';

  @override
  String get noDescription => '(بدون وصف)';

  @override
  String get productNameHint => 'اسم المنتج...';

  @override
  String get productPriceHint => 'سعر المنتج...';

  @override
  String get productStockHint => 'مخزون المنتج...';

  @override
  String get productDescriptionHint => 'وصف المنتج...';

  @override
  String get updateProduct => 'تحديث المنتج';

  @override
  String get delete => 'حذف';

  @override
  String get deleteProductConfirm => 'هل تريد حذف هذا المنتج؟';

  @override
  String get productCreated => 'تم إنشاء المنتج';

  @override
  String get productUpdated => 'تم تحديث المنتج';

  @override
  String get productDeleted => 'تم حذف المنتج';

  @override
  String get cropPhoto => 'قص الصورة';

  @override
  String get profileUpdated => 'تم تحديث الملف الشخصي';

  @override
  String get editProfile => 'تعديل الملف الشخصي';

  @override
  String get profileImage => 'صورة الملف الشخصي';

  @override
  String get phoneNumber => 'رقم الهاتف';

  @override
  String get yourPhoneHint => 'رقم هاتفك...';

  @override
  String get yourEmailHint => 'بريدك الإلكتروني...';

  @override
  String get update => 'تحديث';

  @override
  String get empty => 'فارغ';

  @override
  String get emptyCart => 'لا توجد منتجات في السلة';

  @override
  String totalCount(int count) {
    return 'الإجمالي ($count)';
  }

  @override
  String stockValue(int stock) {
    return 'المخزون: $stock';
  }

  @override
  String stockSold(int stock, int sold) {
    return 'المخزون $stock  |  المباع $sold';
  }

  @override
  String get outOfStock => 'نفد المخزون';

  @override
  String get remove => 'إزالة';

  @override
  String get removeProductConfirm => 'هل تريد إزالة هذا المنتج؟';

  @override
  String get removeAll => 'إزالة الكل';

  @override
  String get removeAllConfirm => 'هل تريد إزالة كل المنتجات؟';

  @override
  String get back => 'رجوع';

  @override
  String get pay => 'دفع';

  @override
  String get transaction => 'المعاملة';

  @override
  String productsCount(int count) {
    return '$count منتجات';
  }

  @override
  String get perPiece => '/قطعة';

  @override
  String productsTotal(int count, String amount) {
    return '$count منتجات = $amount';
  }

  @override
  String get receivedAmount => 'المبلغ المستلم';

  @override
  String get receivedAmountHint => 'المبلغ المستلم...';

  @override
  String get bank => 'بطاقة';

  @override
  String get cash => 'نقداً';

  @override
  String get customerNameOptional => 'اسم العميل (اختياري)';

  @override
  String get customerHint => 'مثال: أحمد';

  @override
  String get descriptionOptional => 'الوصف (اختياري)';

  @override
  String get descriptionHint => 'الوصف...';

  @override
  String get backToHome => 'العودة للرئيسية';

  @override
  String get paperSize => 'حجم الورق';

  @override
  String get connectionTypes => 'أنواع الاتصال';

  @override
  String get selectConnectionTypes => 'اختر أنواع الاتصال';

  @override
  String get usb => 'USB';

  @override
  String get bluetooth => 'Bluetooth';

  @override
  String get ble => 'BLE';

  @override
  String get network => 'شبكة';

  @override
  String get allConnectionTypes => 'كل أنواع الاتصال';

  @override
  String get availableDevices => 'الأجهزة المتاحة';

  @override
  String get scanningPrinters => 'جارٍ البحث عن الطابعات...';

  @override
  String get noPrinter => '(لم يتم العثور على طابعة)';

  @override
  String get printerDisconnected => 'تم فصل الطابعة';

  @override
  String get oops => 'عذراً!';

  @override
  String get somethingWentWrong => 'حدث خطأ.\nحاول مرة أخرى لاحقاً.';

  @override
  String get somethingWentWrongAdmin =>
      'حدث خطأ، تواصل مع مسؤول النظام أو أعد تشغيل التطبيق';

  @override
  String get nothingToShow => 'لا يوجد شيء للعرض';

  @override
  String get pleaseWait => 'يرجى الانتظار';

  @override
  String get selectOptions => 'اختر';

  @override
  String get developerName => 'إبراهيم حمزة إبراهيم المدني';

  @override
  String get developerRole => 'System Analyst & Full Stack Developer';

  @override
  String get aboutIntro =>
      'أعمل في مجال تحليل الأنظمة وتطوير تطبيقات الويب والأنظمة الإدارية، مع اهتمام خاص بتصميم الأنظمة القابلة للتوسع وسهلة الاستخدام.';

  @override
  String get aboutExperience =>
      'لدي خبرة في تحليل متطلبات الأنظمة وتحويل احتياجات الأعمال إلى حلول تقنية متكاملة، بدءًا من تحليل النظام وقواعد البيانات، مرورًا بتصميم الواجهات وتطوير الـ Backend والـ Frontend، وحتى تشغيل النظام ودعمه.';

  @override
  String get aboutPosTitle => 'عن نظام Point of Sales';

  @override
  String get aboutPosBody =>
      'تم تطوير هذا النظام لتوفير حل عملي لإدارة عمليات البيع ونقاط البيع، مع التركيز على سهولة الاستخدام، تنظيم البيانات، ودعم العمليات اليومية للمنشآت التجارية.';

  @override
  String get aboutPosFeatures =>
      'يساعد النظام في إدارة المبيعات والمنتجات والعملاء والمستخدمين والتقارير، مع تصميم قابل للتطوير وإضافة المزيد من الخصائص مستقبلًا.';

  @override
  String get aboutSkillsTitle => 'التقنيات والخبرات';

  @override
  String get aboutSkills =>
      'System Analysis & Requirements Engineering\nDatabase Design & ERD\nFull Stack Web Development\nPHP / Laravel\nJavaScript / TypeScript\nReact / Next.js\nMySQL\nREST APIs\nUI/UX & Responsive Design\nAI-Assisted Software Development';

  @override
  String get aboutContactTitle => 'التواصل';

  @override
  String get mobile => 'الجوال';

  @override
  String get aboutPhone => '0111638872';

  @override
  String get aboutEmail => 'ebrahim5529@gmail.com';

  @override
  String get aboutVisionTitle => 'رؤيتي';

  @override
  String get aboutVision =>
      'هدفي هو بناء أنظمة تقنية عملية تساعد المؤسسات والمنشآت على تحسين عملياتها، تقليل العمل اليدوي، وتنظيم البيانات بطريقة تسهّل اتخاذ القرارات.';

  @override
  String get developedBy => 'طُوّر بواسطة إبراهيم حمزة إبراهيم المدني';

  @override
  String get copyright => '© 2026 جميع الحقوق محفوظة';

  @override
  String versionLabel(String version) {
    return 'الإصدار $version';
  }

  @override
  String get flutterPos => 'Flutter POS';

  @override
  String addedAt(String date) {
    return 'أُضيف في $date';
  }

  @override
  String lastUpdatedAt(String date) {
    return 'آخر تحديث في $date';
  }
}
