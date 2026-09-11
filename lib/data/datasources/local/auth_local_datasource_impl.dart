import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/common/result.dart';
import '../../../domain/entities/user_entity.dart';
import '../../models/user_model.dart';
import '../interfaces/auth_datasource.dart';

class AuthLocalDatasourceImpl implements AuthDataSource {
  static const _sessionKey = 'local_auth_user';

  final SharedPreferences _sharedPreferences;

  AuthLocalDatasourceImpl(this._sharedPreferences);

  @override
  Future<Result<UserModel>> signIn({required String email, required String name}) async {
    try {
      final trimmedEmail = email.trim();
      final trimmedName = name.trim();
      final now = DateTime.now().toIso8601String();

      final user = UserModel(
        id: trimmedEmail.isNotEmpty ? trimmedEmail.toLowerCase() : 'guest_$now',
        email: trimmedEmail.isNotEmpty ? trimmedEmail : null,
        name: trimmedName.isNotEmpty ? trimmedName : 'Guest',
        authProvider: AuthProvider.local.value,
        createdAt: now,
        updatedAt: now,
      );

      await _sharedPreferences.setString(_sessionKey, jsonEncode(user.toJson()));

      return Result.success(data: user);
    } catch (e) {
      return Result.failure(error: e);
    }
  }

  @override
  Future<Result<void>> signOut() async {
    try {
      await _sharedPreferences.remove(_sessionKey);

      return Result.success(data: null);
    } catch (e) {
      return Result.failure(error: e);
    }
  }

  @override
  Future<Result<UserModel?>> getCurrentUser() async {
    try {
      final raw = _sharedPreferences.getString(_sessionKey);

      if (raw == null || raw.isEmpty) {
        return Result.success(data: null);
      }

      return Result.success(data: UserModel.fromJson(jsonDecode(raw) as Map<String, dynamic>));
    } catch (e) {
      return Result.failure(error: e);
    }
  }
}
