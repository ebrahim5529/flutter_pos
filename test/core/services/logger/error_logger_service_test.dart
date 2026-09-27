import 'package:flutter_pos/core/services/logger/error_logger_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('logs an error without a crash reporter', () {
    final logger = ErrorLoggerService();

    expect(
      () => logger.log(error: Exception('local error'), stackTrace: StackTrace.empty),
      returnsNormally,
    );
  });
}
