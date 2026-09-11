import '../../../../core/common/result.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/interfaces/auth_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;

  AuthRepositoryImpl({
    required this.authDataSource,
  });

  @override
  Future<Result<UserEntity>> signIn({required String email, required String name}) async {
    try {
      final res = await authDataSource.signIn(email: email, name: name);
      if (res.isFailure) return Result.failure(error: res.error!);

      return Result.success(data: res.data!.toEntity());
    } catch (e) {
      return Result.failure(error: e);
    }
  }

  @override
  Future<Result<void>> signOut() async {
    try {
      final res = await authDataSource.signOut();
      if (res.isFailure) return Result.failure(error: res.error!);

      return Result.success(data: null);
    } catch (e) {
      return Result.failure(error: e);
    }
  }

  @override
  Future<Result<UserEntity?>> getCurrentUser() async {
    try {
      final res = await authDataSource.getCurrentUser();
      if (res.isFailure) return Result.failure(error: res.error!);

      return Result.success(data: res.data?.toEntity());
    } catch (e) {
      return Result.failure(error: e);
    }
  }
}
