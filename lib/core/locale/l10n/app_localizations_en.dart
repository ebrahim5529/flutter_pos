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
  String get about => 'About';

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
  String get aboutDescription =>
      'A Point of Sale (POS) application built with Flutter, demonstrating Clean Architecture principles and offline-first design patterns.';

  @override
  String get aboutLocal =>
      'This project stores products, transactions, and account data locally with SQLite, so the point of sale keeps working without a cloud backend.';

  @override
  String get developedBy => 'Developed with ❤️ by';

  @override
  String versionLabel(String version) {
    return 'version $version';
  }

  @override
  String get github => 'GitHub';

  @override
  String get website => 'Website';

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
