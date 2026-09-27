import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/di/app_providers.dart';
import '../../../core/utilities/console_logger.dart';
import '../../../domain/usecases/user_usecases.dart';
import '../auth/auth_notifier.dart';
import '../products/products_notifier.dart';
import 'main_state.dart';

final mainNotifierProvider = NotifierProvider<MainNotifier, MainState>(
  MainNotifier.new,
);

class MainNotifier extends Notifier<MainState> {
  @override
  MainState build() {
    return const MainState();
  }

  String _requireUserId() {
    final authState = ref.read(authNotifierProvider);
    if (authState.isAuthenticated) return authState.user!.id;
    throw 'Unauthenticated!';
  }

  Future<void> initMainProvider() async {
    await loadCurrentUser();

    try {
      await startPingService();
    } catch (e) {
      cl('Failed to start connectivity check: $e');
    }
  }

  Future<void> startPingService() async {
    final deviceInfoService = ref.read(deviceInfoServiceProvider);
    final pingService = ref.read(pingServiceProvider);

    // Note: The ICMP protocol may not work on virtual devices
    final isPhysicalDevice = await deviceInfoService.checkDeviceType();

    pingService.startPing(host: isPhysicalDevice ? '8.8.8.8' : '127.0.0.1');
    pingService.addConnectionStatusListener((isConnected) {
      state = state.copyWith(isHasInternet: isConnected);
    });
  }

  Future<void> loadCurrentUser() async {
    final userId = _requireUserId();
    final userRepository = ref.read(userRepositoryProvider);
    final res = await GetUserUsecase(userRepository).call(userId);

    if (res.isSuccess) {
      state = state.copyWith(user: res.data);
    }

    ref.read(productsNotifierProvider.notifier).getAllProducts();

    state = state.copyWith(isLoaded: true);
  }
}
