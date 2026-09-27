import '../../../domain/entities/user_entity.dart';

class MainState {
  final bool isLoaded;
  final bool isHasInternet;
  final UserEntity? user;

  const MainState({
    this.isLoaded = false,
    this.isHasInternet = true,
    this.user,
  });

  MainState copyWith({
    bool? isLoaded,
    bool? isHasInternet,
    UserEntity? user,
  }) {
    return MainState(
      isLoaded: isLoaded ?? this.isLoaded,
      isHasInternet: isHasInternet ?? this.isHasInternet,
      user: user ?? this.user,
    );
  }
}
