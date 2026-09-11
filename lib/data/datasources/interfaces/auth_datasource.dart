import '../../../core/common/result.dart';
import '../../models/user_model.dart';

abstract class AuthDataSource {
  Future<Result<UserModel>> signIn({required String email, required String name});

  Future<Result<void>> signOut();

  Future<Result<UserModel?>> getCurrentUser();
}
