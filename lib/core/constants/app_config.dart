class AppConfig {
  AppConfig._();

  /// When false, the app runs fully offline (local auth + SQLite only). No Firebase required.
  static const bool useFirebase = false;
}
