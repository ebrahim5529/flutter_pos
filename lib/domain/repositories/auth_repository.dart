// lib/features/auth/domain/repositories/auth_repository.dart

import '../../../../core/common/result.dart';
import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<Result<UserEntity>> signIn({required String email, required String name});

  Future<Result<void>> signOut();

  Future<Result<UserEntity?>> getCurrentUser();
}
