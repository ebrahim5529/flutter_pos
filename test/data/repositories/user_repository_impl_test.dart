import 'package:flutter_pos/core/common/result.dart';
import 'package:flutter_pos/data/datasources/local/user_local_datasource_impl.dart';
import 'package:flutter_pos/data/models/user_model.dart';
import 'package:flutter_pos/data/repositories/user_repository_impl.dart';
import 'package:flutter_pos/domain/entities/user_entity.dart';
import 'package:flutter_test/flutter_test.dart';

class _FakeUserLocalDatasource extends Fake implements UserLocalDatasourceImpl {
  Result<UserModel?> getUserResult = Result.success(data: null);
  Result<String> createUserResult = Result.success(data: 'user-1');
  Result<void> updateUserResult = Result.success(data: null);
  Result<void> deleteUserResult = Result.success(data: null);

  @override
  Future<Result<UserModel?>> getUser(String id) async => getUserResult;

  @override
  Future<Result<String>> createUser(UserModel user) async => createUserResult;

  @override
  Future<Result<void>> updateUser(UserModel user) async => updateUserResult;

  @override
  Future<Result<void>> deleteUser(String id) async => deleteUserResult;
}

void main() {
  late _FakeUserLocalDatasource local;
  late UserRepositoryImpl repository;

  const user = UserEntity(id: 'user-1', name: 'Ada', email: 'ada@local.test');

  setUp(() {
    local = _FakeUserLocalDatasource();
    repository = UserRepositoryImpl(userLocalDatasource: local);
  });

  test('returns the local user', () async {
    local.getUserResult = Result.success(data: UserModel.fromEntity(user));

    final result = await repository.getUser('user-1');

    expect(result.data?.name, 'Ada');
  });

  test('creates, updates, and deletes a user locally', () async {
    expect((await repository.createUser(user)).data, 'user-1');
    expect((await repository.updateUser(user)).isSuccess, isTrue);
    expect((await repository.deleteUser('user-1')).isSuccess, isTrue);
  });

  test('returns failure when loading a user fails', () async {
    local.getUserResult = Result.failure(error: 'missing');

    final result = await repository.getUser('user-1');

    expect(result.isFailure, isTrue);
    expect(result.error, 'missing');
  });
}
