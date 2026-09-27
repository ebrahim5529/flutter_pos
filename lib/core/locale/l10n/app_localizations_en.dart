// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get welcome => 'Welcome!';

  @override
  String get welcomeSubtitle => 'Welcome to Flutter POS app';

  @override
  String get email => 'Email';

  @override
  String get emailHint => 'any@email.com';

  @override
  String get name => 'Name';

  @override
  String get yourName => 'Your name';

  @override
  String get yourNameHint => 'Your name...';

  @override
  String get signIn => 'Sign In';

  @override
  String get enterEmailOrName => 'Enter an email or name to continue';

  @override
  String get home => 'Home';

  @override
  String get products => 'Products';

  @override
  String get transactions => 'Transactions';

  @override
  String get account => 'Account';

  @override
  String get profile => 'Profile';

  @override
  String get theme => 'Theme';

  @override
  String get language => 'Language';

  @override
  String get arabic => 'العربية';

  @override
  String get english => 'English';

  @override
  String get close => 'Close';

  @override
  String get printerSettings => 'Printer Settings';

  @override
  String get about => 'About Me';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get signOut => 'Sign Out';

  @override
  String get confirm => 'Confirm';

  @override
  String get signOutConfirm => 'Are you sure want to sign out?';

  @override
  String get cancel => 'Cancel';

  @override
  String get noName => '(No Name)';

  @override
  String get noProductName => '(No name)';

  @override
  String get online => 'Online';

  @override
  String get offline => 'Offline';

  @override
  String get onlineMessage => 'Connected to the internet';

  @override
  String get offlineMessage => 'No connection, the app is working locally';

  @override
  String get noProducts => 'No products available, add product to continue';

  @override
  String get addProduct => 'Add Product';

  @override
  String get searchProducts => 'Search Products...';

  @override
  String get enterAmount => 'Enter Amount';

  @override
  String get addToCart => 'Add To Cart';

  @override
  String get noTransactions => 'No transaction available';

  @override
  String get searchTransactionId => 'Search Transaction ID...';

  @override
  String get notFound => 'Not Found';

  @override
  String get reprint => 'Reprint';

  @override
  String get transactionCreated => 'Transaction Created';

  @override
  String get transactionId => 'Transaction ID';

  @override
  String get paymentMethod => 'Payment Method';

  @override
  String get createdBy => 'Created By';

  @override
  String get createdAt => 'Created At';

  @override
  String get customerName => 'Customer Name';

  @override
  String get description => 'Description';

  @override
  String get orderedProducts => 'Ordered Products';

  @override
  String get total => 'Total';

  @override
  String get paymentReceived => 'Payment Received';

  @override
  String get change => 'Change';

  @override
  String get productDetail => 'Product Detail';

  @override
  String get editProduct => 'Edit Product';

  @override
  String get createProduct => 'Create Product';

  @override
  String get productImage => 'Product Image';

  @override
  String get price => 'Price';

  @override
  String get stock => 'Stock';

  @override
  String get sold => 'Sold';

  @override
  String get noDescription => '(No description)';

  @override
  String get productNameHint => 'Product name...';

  @override
  String get productPriceHint => 'Product price...';

  @override
  String get productStockHint => 'Product stock...';

  @override
  String get productDescriptionHint => 'Product description...';

  @override
  String get updateProduct => 'Update Product';

  @override
  String get delete => 'Delete';

  @override
  String get deleteProductConfirm =>
      'Are you sure want to delete this product?';

  @override
  String get productCreated => 'Product created';

  @override
  String get productUpdated => 'Product updated';

  @override
  String get productDeleted => 'Product deleted';

  @override
  String get cropPhoto => 'Crop Photo';

  @override
  String get profileUpdated => 'Profile updated';

  @override
  String get editProfile => 'Edit Profile';

  @override
  String get profileImage => 'Profile Image';

  @override
  String get phoneNumber => 'Phone Number';

  @override
  String get yourPhoneHint => 'Your phone number...';

  @override
  String get yourEmailHint => 'Your email...';

  @override
  String get update => 'Update';

  @override
  String get empty => 'Empty';

  @override
  String get emptyCart => 'No products added to cart';

  @override
  String totalCount(int count) {
    return 'Total ($count)';
  }

  @override
  String stockValue(int stock) {
    return 'Stock: $stock';
  }

  @override
  String stockSold(int stock, int sold) {
    return 'Stock $stock  |  Sold $sold';
  }

  @override
  String get outOfStock => 'Out of stock';

  @override
  String get remove => 'Remove';

  @override
  String get removeProductConfirm =>
      'Are you sure want to remove this product?';

  @override
  String get removeAll => 'Remove All';

  @override
  String get removeAllConfirm => 'Are you sure want to remove all product?';

  @override
  String get back => 'Back';

  @override
  String get pay => 'Pay';

  @override
  String get transaction => 'Transaction';

  @override
  String productsCount(int count) {
    return '$count Products';
  }

  @override
  String get perPiece => '/pcs';

  @override
  String productsTotal(int count, String amount) {
    return '$count Products = $amount';
  }

  @override
  String get receivedAmount => 'Received Amount';

  @override
  String get receivedAmountHint => 'Received amount...';

  @override
  String get bank => 'Bank';

  @override
  String get cash => 'Cash';

  @override
  String get customerNameOptional => 'Customer Name (Optional)';

  @override
  String get customerHint => 'e.g. Jhone Doe';

  @override
  String get descriptionOptional => 'Description (Optional)';

  @override
  String get descriptionHint => 'Description...';

  @override
  String get backToHome => 'Back to home';

  @override
  String get paperSize => 'Paper Size';

  @override
  String get connectionTypes => 'Connection Types';

  @override
  String get selectConnectionTypes => 'Select connection types';

  @override
  String get usb => 'USB';

  @override
  String get bluetooth => 'Bluetooth';

  @override
  String get ble => 'BLE';

  @override
  String get network => 'Network';

  @override
  String get allConnectionTypes => 'All connection types';

  @override
  String get availableDevices => 'Available Devices';

  @override
  String get scanningPrinters => 'Scanning for printers...';

  @override
  String get noPrinter => '(No printer detected)';

  @override
  String get printerDisconnected => 'Printer disconnected';

  @override
  String get oops => 'Oops!';

  @override
  String get somethingWentWrong =>
      'Something went wrong.\nPlease try again later.';

  @override
  String get somethingWentWrongAdmin =>
      'Something went wrong, please contact your system administrator or try restart the app';

  @override
  String get nothingToShow => 'Nothing to show';

  @override
  String get pleaseWait => 'Please wait';

  @override
  String get selectOptions => 'Select options';

  @override
  String get developerName => 'Ibrahim Hamza Ibrahim Al-Madani';

  @override
  String get developerRole => 'System Analyst & Full Stack Developer';

  @override
  String get aboutIntro =>
      'I work in systems analysis and the development of web applications and administrative systems, with a particular focus on designing systems that scale and stay easy to use.';

  @override
  String get aboutExperience =>
      'I have experience analyzing system requirements and turning business needs into complete technical solutions, from system analysis and database design, through interface design and backend and frontend development, to operating and supporting the system.';

  @override
  String get aboutPosTitle => 'About the Point of Sales System';

  @override
  String get aboutPosBody =>
      'This system was developed to provide a practical solution for managing sales and point-of-sale operations, with a focus on ease of use, organized data, and support for the daily work of commercial businesses.';

  @override
  String get aboutPosFeatures =>
      'The system helps manage sales, products, customers, users, and reports, with a design that can grow and take on more features in the future.';

  @override
  String get aboutSkillsTitle => 'Technologies & Expertise';

  @override
  String get aboutSkills =>
      'System Analysis & Requirements Engineering\nDatabase Design & ERD\nFull Stack Web Development\nPHP / Laravel\nJavaScript / TypeScript\nReact / Next.js\nMySQL\nREST APIs\nUI/UX & Responsive Design\nAI-Assisted Software Development';

  @override
  String get aboutContactTitle => 'Contact';

  @override
  String get mobile => 'Mobile';

  @override
  String get aboutPhone => '0111638872';

  @override
  String get aboutEmail => 'ebrahim5529@gmail.com';

  @override
  String get aboutVisionTitle => 'My Vision';

  @override
  String get aboutVision =>
      'My goal is to build practical technical systems that help organizations and businesses improve their operations, reduce manual work, and organize data in a way that makes decisions easier.';

  @override
  String get developedBy => 'Developed by Ibrahim Hamza Ibrahim Al-Madani';

  @override
  String get copyright => '© 2026 All Rights Reserved';

  @override
  String versionLabel(String version) {
    return 'version $version';
  }

  @override
  String get flutterPos => 'Flutter POS';

  @override
  String addedAt(String date) {
    return 'Added at $date';
  }

  @override
  String lastUpdatedAt(String date) {
    return 'Last updated at $date';
  }
}
