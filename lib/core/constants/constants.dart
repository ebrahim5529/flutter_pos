class Constants {
  // Prevents instantiation and extension
  Constants._();

  static const String selectedDeviceIdKey = 'selected_device_id';
  static const String selectedConnectionTypeKey = 'selected_connection_type';
  static const String selectedPaperSizeKey = 'selected_paper_size';
  static const String selectedBrightnessKey = 'selected_brightness';

  // Non-critical error libraries that should be logged but not navigate to error screen
  static const nonCriticalErrorLibraries = {
    'image resource service',
  };
}
