import '../../core/common/result.dart';
import '../../core/usecase/usecase.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';
import 'params/no_param.dart';
import 'params/sign_in_param.dart';

class SignInUsecase extends Usecase<Result, SignInParam> {
  SignInUsecase(this._authRepository);

  final AuthRepository _authRepository;

  @override
  Future<Result<UserEntity?>> call(SignInParam params) async => _authRepository.signIn(
    email: params.email,
    name: params.name,
  );
}

class SignOutUsecase extends Usecase<Result, NoParam> {
  SignOutUsecase(this._authRepository);

  final AuthRepository _authRepository;

  @override
  Future<Result<void>> call(NoParam params) async => _authRepository.signOut();
}

class GetCurrentUserUsecase extends Usecase<Result, NoParam> {
  GetCurrentUserUsecase(this._authRepository);

  final AuthRepository _authRepository;

  @override
  Future<Result<UserEntity?>> call(NoParam params) async => _authRepository.getCurrentUser();
}
