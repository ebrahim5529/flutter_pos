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
/// import 'l10n/app_localizations.dart';
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

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
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

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome!'**
  String get welcome;

  /// No description provided for @welcomeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Flutter POS app'**
  String get welcomeSubtitle;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @emailHint.
  ///
  /// In en, this message translates to:
  /// **'any@email.com'**
  String get emailHint;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @yourName.
  ///
  /// In en, this message translates to:
  /// **'Your name'**
  String get yourName;

  /// No description provided for @yourNameHint.
  ///
  /// In en, this message translates to:
  /// **'Your name...'**
  String get yourNameHint;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @enterEmailOrName.
  ///
  /// In en, this message translates to:
  /// **'Enter an email or name to continue'**
  String get enterEmailOrName;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @products.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get products;

  /// No description provided for @transactions.
  ///
  /// In en, this message translates to:
  /// **'Transactions'**
  String get transactions;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'العربية'**
  String get arabic;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @printerSettings.
  ///
  /// In en, this message translates to:
  /// **'Printer Settings'**
  String get printerSettings;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About Me'**
  String get about;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// No description provided for @signOut.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get signOut;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @signOutConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure want to sign out?'**
  String get signOutConfirm;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @noName.
  ///
  /// In en, this message translates to:
  /// **'(No Name)'**
  String get noName;

  /// No description provided for @noProductName.
  ///
  /// In en, this message translates to:
  /// **'(No name)'**
  String get noProductName;

  /// No description provided for @online.
  ///
  /// In en, this message translates to:
  /// **'Online'**
  String get online;

  /// No description provided for @offline.
  ///
  /// In en, this message translates to:
  /// **'Offline'**
  String get offline;

  /// No description provided for @onlineMessage.
  ///
  /// In en, this message translates to:
  /// **'Connected to the internet'**
  String get onlineMessage;

  /// No description provided for @offlineMessage.
  ///
  /// In en, this message translates to:
  /// **'No connection, the app is working locally'**
  String get offlineMessage;

  /// No description provided for @noProducts.
  ///
  /// In en, this message translates to:
  /// **'No products available, add product to continue'**
  String get noProducts;

  /// No description provided for @addProduct.
  ///
  /// In en, this message translates to:
  /// **'Add Product'**
  String get addProduct;

  /// No description provided for @searchProducts.
  ///
  /// In en, this message translates to:
  /// **'Search Products...'**
  String get searchProducts;

  /// No description provided for @enterAmount.
  ///
  /// In en, this message translates to:
  /// **'Enter Amount'**
  String get enterAmount;

  /// No description provided for @addToCart.
  ///
  /// In en, this message translates to:
  /// **'Add To Cart'**
  String get addToCart;

  /// No description provided for @noTransactions.
  ///
  /// In en, this message translates to:
  /// **'No transaction available'**
  String get noTransactions;

  /// No description provided for @searchTransactionId.
  ///
  /// In en, this message translates to:
  /// **'Search Transaction ID...'**
  String get searchTransactionId;

  /// No description provided for @notFound.
  ///
  /// In en, this message translates to:
  /// **'Not Found'**
  String get notFound;

  /// No description provided for @reprint.
  ///
  /// In en, this message translates to:
  /// **'Reprint'**
  String get reprint;

  /// No description provided for @transactionCreated.
  ///
  /// In en, this message translates to:
  /// **'Transaction Created'**
  String get transactionCreated;

  /// No description provided for @transactionId.
  ///
  /// In en, this message translates to:
  /// **'Transaction ID'**
  String get transactionId;

  /// No description provided for @paymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Payment Method'**
  String get paymentMethod;

  /// No description provided for @createdBy.
  ///
  /// In en, this message translates to:
  /// **'Created By'**
  String get createdBy;

  /// No description provided for @createdAt.
  ///
  /// In en, this message translates to:
  /// **'Created At'**
  String get createdAt;

  /// No description provided for @customerName.
  ///
  /// In en, this message translates to:
  /// **'Customer Name'**
  String get customerName;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @orderedProducts.
  ///
  /// In en, this message translates to:
  /// **'Ordered Products'**
  String get orderedProducts;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @paymentReceived.
  ///
  /// In en, this message translates to:
  /// **'Payment Received'**
  String get paymentReceived;

  /// No description provided for @change.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get change;

  /// No description provided for @productDetail.
  ///
  /// In en, this message translates to:
  /// **'Product Detail'**
  String get productDetail;

  /// No description provided for @editProduct.
  ///
  /// In en, this message translates to:
  /// **'Edit Product'**
  String get editProduct;

  /// No description provided for @createProduct.
  ///
  /// In en, this message translates to:
  /// **'Create Product'**
  String get createProduct;

  /// No description provided for @productImage.
  ///
  /// In en, this message translates to:
  /// **'Product Image'**
  String get productImage;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// No description provided for @stock.
  ///
  /// In en, this message translates to:
  /// **'Stock'**
  String get stock;

  /// No description provided for @sold.
  ///
  /// In en, this message translates to:
  /// **'Sold'**
  String get sold;

  /// No description provided for @noDescription.
  ///
  /// In en, this message translates to:
  /// **'(No description)'**
  String get noDescription;

  /// No description provided for @productNameHint.
  ///
  /// In en, this message translates to:
  /// **'Product name...'**
  String get productNameHint;

  /// No description provided for @productPriceHint.
  ///
  /// In en, this message translates to:
  /// **'Product price...'**
  String get productPriceHint;

  /// No description provided for @productStockHint.
  ///
  /// In en, this message translates to:
  /// **'Product stock...'**
  String get productStockHint;

  /// No description provided for @productDescriptionHint.
  ///
  /// In en, this message translates to:
  /// **'Product description...'**
  String get productDescriptionHint;

  /// No description provided for @updateProduct.
  ///
  /// In en, this message translates to:
  /// **'Update Product'**
  String get updateProduct;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @deleteProductConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure want to delete this product?'**
  String get deleteProductConfirm;

  /// No description provided for @productCreated.
  ///
  /// In en, this message translates to:
  /// **'Product created'**
  String get productCreated;

  /// No description provided for @productUpdated.
  ///
  /// In en, this message translates to:
  /// **'Product updated'**
  String get productUpdated;

  /// No description provided for @productDeleted.
  ///
  /// In en, this message translates to:
  /// **'Product deleted'**
  String get productDeleted;

  /// No description provided for @cropPhoto.
  ///
  /// In en, this message translates to:
  /// **'Crop Photo'**
  String get cropPhoto;

  /// No description provided for @profileUpdated.
  ///
  /// In en, this message translates to:
  /// **'Profile updated'**
  String get profileUpdated;

  /// No description provided for @editProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfile;

  /// No description provided for @profileImage.
  ///
  /// In en, this message translates to:
  /// **'Profile Image'**
  String get profileImage;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// No description provided for @yourPhoneHint.
  ///
  /// In en, this message translates to:
  /// **'Your phone number...'**
  String get yourPhoneHint;

  /// No description provided for @yourEmailHint.
  ///
  /// In en, this message translates to:
  /// **'Your email...'**
  String get yourEmailHint;

  /// No description provided for @update.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// No description provided for @empty.
  ///
  /// In en, this message translates to:
  /// **'Empty'**
  String get empty;

  /// No description provided for @emptyCart.
  ///
  /// In en, this message translates to:
  /// **'No products added to cart'**
  String get emptyCart;

  /// No description provided for @totalCount.
  ///
  /// In en, this message translates to:
  /// **'Total ({count})'**
  String totalCount(int count);

  /// No description provided for @stockValue.
  ///
  /// In en, this message translates to:
  /// **'Stock: {stock}'**
  String stockValue(int stock);

  /// No description provided for @stockSold.
  ///
  /// In en, this message translates to:
  /// **'Stock {stock}  |  Sold {sold}'**
  String stockSold(int stock, int sold);

  /// No description provided for @outOfStock.
  ///
  /// In en, this message translates to:
  /// **'Out of stock'**
  String get outOfStock;

  /// No description provided for @remove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get remove;

  /// No description provided for @removeProductConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure want to remove this product?'**
  String get removeProductConfirm;

  /// No description provided for @removeAll.
  ///
  /// In en, this message translates to:
  /// **'Remove All'**
  String get removeAll;

  /// No description provided for @removeAllConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure want to remove all product?'**
  String get removeAllConfirm;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @pay.
  ///
  /// In en, this message translates to:
  /// **'Pay'**
  String get pay;

  /// No description provided for @transaction.
  ///
  /// In en, this message translates to:
  /// **'Transaction'**
  String get transaction;

  /// No description provided for @productsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} Products'**
  String productsCount(int count);

  /// No description provided for @perPiece.
  ///
  /// In en, this message translates to:
  /// **'/pcs'**
  String get perPiece;

  /// No description provided for @productsTotal.
  ///
  /// In en, this message translates to:
  /// **'{count} Products = {amount}'**
  String productsTotal(int count, String amount);

  /// No description provided for @receivedAmount.
  ///
  /// In en, this message translates to:
  /// **'Received Amount'**
  String get receivedAmount;

  /// No description provided for @receivedAmountHint.
  ///
  /// In en, this message translates to:
  /// **'Received amount...'**
  String get receivedAmountHint;

  /// No description provided for @bank.
  ///
  /// In en, this message translates to:
  /// **'Bank'**
  String get bank;

  /// No description provided for @cash.
  ///
  /// In en, this message translates to:
  /// **'Cash'**
  String get cash;

  /// No description provided for @customerNameOptional.
  ///
  /// In en, this message translates to:
  /// **'Customer Name (Optional)'**
  String get customerNameOptional;

  /// No description provided for @customerHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Jhone Doe'**
  String get customerHint;

  /// No description provided for @descriptionOptional.
  ///
  /// In en, this message translates to:
  /// **'Description (Optional)'**
  String get descriptionOptional;

  /// No description provided for @descriptionHint.
  ///
  /// In en, this message translates to:
  /// **'Description...'**
  String get descriptionHint;

  /// No description provided for @backToHome.
  ///
  /// In en, this message translates to:
  /// **'Back to home'**
  String get backToHome;

  /// No description provided for @paperSize.
  ///
  /// In en, this message translates to:
  /// **'Paper Size'**
  String get paperSize;

  /// No description provided for @connectionTypes.
  ///
  /// In en, this message translates to:
  /// **'Connection Types'**
  String get connectionTypes;

  /// No description provided for @selectConnectionTypes.
  ///
  /// In en, this message translates to:
  /// **'Select connection types'**
  String get selectConnectionTypes;

  /// No description provided for @usb.
  ///
  /// In en, this message translates to:
  /// **'USB'**
  String get usb;

  /// No description provided for @bluetooth.
  ///
  /// In en, this message translates to:
  /// **'Bluetooth'**
  String get bluetooth;

  /// No description provided for @ble.
  ///
  /// In en, this message translates to:
  /// **'BLE'**
  String get ble;

  /// No description provided for @network.
  ///
  /// In en, this message translates to:
  /// **'Network'**
  String get network;

  /// No description provided for @allConnectionTypes.
  ///
  /// In en, this message translates to:
  /// **'All connection types'**
  String get allConnectionTypes;

  /// No description provided for @availableDevices.
  ///
  /// In en, this message translates to:
  /// **'Available Devices'**
  String get availableDevices;

  /// No description provided for @scanningPrinters.
  ///
  /// In en, this message translates to:
  /// **'Scanning for printers...'**
  String get scanningPrinters;

  /// No description provided for @noPrinter.
  ///
  /// In en, this message translates to:
  /// **'(No printer detected)'**
  String get noPrinter;

  /// No description provided for @printerDisconnected.
  ///
  /// In en, this message translates to:
  /// **'Printer disconnected'**
  String get printerDisconnected;

  /// No description provided for @oops.
  ///
  /// In en, this message translates to:
  /// **'Oops!'**
  String get oops;

  /// No description provided for @somethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong.\nPlease try again later.'**
  String get somethingWentWrong;

  /// No description provided for @somethingWentWrongAdmin.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong, please contact your system administrator or try restart the app'**
  String get somethingWentWrongAdmin;

  /// No description provided for @nothingToShow.
  ///
  /// In en, this message translates to:
  /// **'Nothing to show'**
  String get nothingToShow;

  /// No description provided for @pleaseWait.
  ///
  /// In en, this message translates to:
  /// **'Please wait'**
  String get pleaseWait;

  /// No description provided for @selectOptions.
  ///
  /// In en, this message translates to:
  /// **'Select options'**
  String get selectOptions;

  /// No description provided for @developerName.
  ///
  /// In en, this message translates to:
  /// **'Ibrahim Hamza Ibrahim Al-Madani'**
  String get developerName;

  /// No description provided for @developerRole.
  ///
  /// In en, this message translates to:
  /// **'System Analyst & Full Stack Developer'**
  String get developerRole;

  /// No description provided for @aboutIntro.
  ///
  /// In en, this message translates to:
  /// **'I work in systems analysis and the development of web applications and administrative systems, with a particular focus on designing systems that scale and stay easy to use.'**
  String get aboutIntro;

  /// No description provided for @aboutExperience.
  ///
  /// In en, this message translates to:
  /// **'I have experience analyzing system requirements and turning business needs into complete technical solutions, from system analysis and database design, through interface design and backend and frontend development, to operating and supporting the system.'**
  String get aboutExperience;

  /// No description provided for @aboutPosTitle.
  ///
  /// In en, this message translates to:
  /// **'About the Point of Sales System'**
  String get aboutPosTitle;

  /// No description provided for @aboutPosBody.
  ///
  /// In en, this message translates to:
  /// **'This system was developed to provide a practical solution for managing sales and point-of-sale operations, with a focus on ease of use, organized data, and support for the daily work of commercial businesses.'**
  String get aboutPosBody;

  /// No description provided for @aboutPosFeatures.
  ///
  /// In en, this message translates to:
  /// **'The system helps manage sales, products, customers, users, and reports, with a design that can grow and take on more features in the future.'**
  String get aboutPosFeatures;

  /// No description provided for @aboutSkillsTitle.
  ///
  /// In en, this message translates to:
  /// **'Technologies & Expertise'**
  String get aboutSkillsTitle;

  /// No description provided for @aboutSkills.
  ///
  /// In en, this message translates to:
  /// **'System Analysis & Requirements Engineering\nDatabase Design & ERD\nFull Stack Web Development\nPHP / Laravel\nJavaScript / TypeScript\nReact / Next.js\nMySQL\nREST APIs\nUI/UX & Responsive Design\nAI-Assisted Software Development'**
  String get aboutSkills;

  /// No description provided for @aboutContactTitle.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get aboutContactTitle;

  /// No description provided for @mobile.
  ///
  /// In en, this message translates to:
  /// **'Mobile'**
  String get mobile;

  /// No description provided for @aboutPhone.
  ///
  /// In en, this message translates to:
  /// **'0111638872'**
  String get aboutPhone;

  /// No description provided for @aboutEmail.
  ///
  /// In en, this message translates to:
  /// **'ebrahim5529@gmail.com'**
  String get aboutEmail;

  /// No description provided for @aboutVisionTitle.
  ///
  /// In en, this message translates to:
  /// **'My Vision'**
  String get aboutVisionTitle;

  /// No description provided for @aboutVision.
  ///
  /// In en, this message translates to:
  /// **'My goal is to build practical technical systems that help organizations and businesses improve their operations, reduce manual work, and organize data in a way that makes decisions easier.'**
  String get aboutVision;

  /// No description provided for @developedBy.
  ///
  /// In en, this message translates to:
  /// **'Developed by Ibrahim Hamza Ibrahim Al-Madani'**
  String get developedBy;

  /// No description provided for @copyright.
  ///
  /// In en, this message translates to:
  /// **'© 2026 All Rights Reserved'**
  String get copyright;

  /// No description provided for @versionLabel.
  ///
  /// In en, this message translates to:
  /// **'version {version}'**
  String versionLabel(String version);

  /// No description provided for @flutterPos.
  ///
  /// In en, this message translates to:
  /// **'Flutter POS'**
  String get flutterPos;

  /// No description provided for @addedAt.
  ///
  /// In en, this message translates to:
  /// **'Added at {date}'**
  String addedAt(String date);

  /// No description provided for @lastUpdatedAt.
  ///
  /// In en, this message translates to:
  /// **'Last updated at {date}'**
  String lastUpdatedAt(String date);
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
