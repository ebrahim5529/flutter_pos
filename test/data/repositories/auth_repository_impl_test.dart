import 'package:flutter_pos/core/common/result.dart';
import 'package:flutter_pos/data/datasources/interfaces/auth_datasource.dart';
import 'package:flutter_pos/data/models/user_model.dart';
import 'package:flutter_pos/data/repositories/auth_repository_impl.dart';
import 'package:flutter_pos/domain/entities/user_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_repository_impl_test.mocks.dart';

// Generate mocks with: flutter pub run build_runner build
@GenerateMocks([AuthDataSource, UserModel, UserEntity])
void main() {
  late MockAuthDataSource mockAuthDataSource;
  late AuthRepositoryImpl repository;

  const email = 'test@example.com';
  const name = 'Test User';

  setUp(() {
    mockAuthDataSource = MockAuthDataSource();
    repository = AuthRepositoryImpl(authDataSource: mockAuthDataSource);

    provideDummy<Result<UserModel>>(Result.success(data: UserModel(id: '')));
    provideDummy<Result<UserModel?>>(Result.success(data: null));
    provideDummy<Result<void>>(Result.success(data: null));
  });

  group('AuthRepositoryImpl - signIn', () {
    test('should return UserEntity on successful sign in', () async {
      // Arrange
      final mockUserModel = MockUserModel();
      final mockUserEntity = MockUserEntity();

      when(mockUserModel.toEntity()).thenReturn(mockUserEntity);
      when(
        mockAuthDataSource.signIn(email: email, name: name),
      ).thenAnswer((_) async => Result.success(data: mockUserModel));

      // Act
      final result = await repository.signIn(email: email, name: name);

      // Assert
      expect(result.isSuccess, true);
      expect(result.data, mockUserEntity);
      verify(mockAuthDataSource.signIn(email: email, name: name)).called(1);
      verify(mockUserModel.toEntity()).called(1);
    });

    test('should return failure when datasource fails', () async {
      // Arrange
      final error = Exception('Sign in failed');
      when(mockAuthDataSource.signIn(email: email, name: name)).thenAnswer((_) async => Result.failure(error: error));

      // Act
      final result = await repository.signIn(email: email, name: name);

      // Assert
      expect(result.isFailure, true);
      expect(result.error, error);
      verify(mockAuthDataSource.signIn(email: email, name: name)).called(1);
    });

    test('should catch and return exception as failure', () async {
      // Arrange
      final exception = Exception('Network error');
      when(mockAuthDataSource.signIn(email: email, name: name)).thenThrow(exception);

      // Act
      final result = await repository.signIn(email: email, name: name);

      // Assert
      expect(result.isFailure, true);
      expect(result.error, exception);
      verify(mockAuthDataSource.signIn(email: email, name: name)).called(1);
    });

    test('should handle different types of errors', () async {
      // Arrange
      final errors = [
        'String error',
        StateError('State error'),
        ArgumentError('Argument error'),
      ];

      for (final error in errors) {
        // Arrange
        when(mockAuthDataSource.signIn(email: email, name: name)).thenAnswer((_) async => Result.failure(error: error));

        // Act
        final result = await repository.signIn(email: email, name: name);

        // Assert
        expect(result.isFailure, true);
        expect(result.error, error);
      }
    });
  });

  group('AuthRepositoryImpl - signOut', () {
    test('should return success on successful sign out', () async {
      // Arrange
      when(mockAuthDataSource.signOut()).thenAnswer((_) async => Result.success(data: null));

      // Act
      final result = await repository.signOut();

      // Assert
      expect(result.isSuccess, true);
      verify(mockAuthDataSource.signOut()).called(1);
    });

    test('should return failure when datasource fails', () async {
      // Arrange
      final error = Exception('Sign out failed');
      when(mockAuthDataSource.signOut()).thenAnswer((_) async => Result.failure(error: error));

      // Act
      final result = await repository.signOut();

      // Assert
      expect(result.isFailure, true);
      expect(result.error, error);
      verify(mockAuthDataSource.signOut()).called(1);
    });

    test('should catch and return exception as failure', () async {
      // Arrange
      final exception = Exception('Unexpected error');
      when(mockAuthDataSource.signOut()).thenThrow(exception);

      // Act
      final result = await repository.signOut();

      // Assert
      expect(result.isFailure, true);
      expect(result.error, exception);
      verify(mockAuthDataSource.signOut()).called(1);
    });
  });

  group('AuthRepositoryImpl - getCurrentUser', () {
    test('should return UserEntity when user is logged in', () async {
      // Arrange
      final mockUserModel = MockUserModel();
      final mockUserEntity = MockUserEntity();

      when(mockUserModel.toEntity()).thenReturn(mockUserEntity);
      when(mockAuthDataSource.getCurrentUser()).thenAnswer((_) async => Result.success(data: mockUserModel));

      // Act
      final result = await repository.getCurrentUser();

      // Assert
      expect(result.isSuccess, true);
      expect(result.data, mockUserEntity);
      verify(mockAuthDataSource.getCurrentUser()).called(1);
      verify(mockUserModel.toEntity()).called(1);
    });

    test('should return null when no user is logged in', () async {
      // Arrange
      when(mockAuthDataSource.getCurrentUser()).thenAnswer((_) async => Result.success(data: null));

      // Act
      final result = await repository.getCurrentUser();

      // Assert
      expect(result.isSuccess, true);
      expect(result.data, null);
      verify(mockAuthDataSource.getCurrentUser()).called(1);
    });

    test('should return failure when datasource fails', () async {
      // Arrange
      final error = Exception('Failed to get user');
      when(mockAuthDataSource.getCurrentUser()).thenAnswer((_) async => Result.failure(error: error));

      // Act
      final result = await repository.getCurrentUser();

      // Assert
      expect(result.isFailure, true);
      expect(result.error, error);
      verify(mockAuthDataSource.getCurrentUser()).called(1);
    });

    test('should catch and return exception as failure', () async {
      // Arrange
      final exception = Exception('Unexpected error');
      when(mockAuthDataSource.getCurrentUser()).thenThrow(exception);

      // Act
      final result = await repository.getCurrentUser();

      // Assert
      expect(result.isFailure, true);
      expect(result.error, exception);
      verify(mockAuthDataSource.getCurrentUser()).called(1);
    });

    test('should handle null user model gracefully', () async {
      // Arrange
      when(mockAuthDataSource.getCurrentUser()).thenAnswer((_) async => Result.success(data: null));

      // Act
      final result = await repository.getCurrentUser();

      // Assert
      expect(result.isSuccess, true);
      expect(result.data, null);
    });
  });

  group('AuthRepositoryImpl - Integration', () {
    test('should handle multiple consecutive operations', () async {
      // Arrange
      final mockUserModel = MockUserModel();
      final mockUserEntity = MockUserEntity();

      when(mockUserModel.toEntity()).thenReturn(mockUserEntity);
      when(
        mockAuthDataSource.signIn(email: email, name: name),
      ).thenAnswer((_) async => Result.success(data: mockUserModel));
      when(mockAuthDataSource.getCurrentUser()).thenAnswer((_) async => Result.success(data: mockUserModel));
      when(mockAuthDataSource.signOut()).thenAnswer((_) async => Result.success(data: null));

      // Act
      final signInResult = await repository.signIn(email: email, name: name);
      final getUserResult = await repository.getCurrentUser();
      final signOutResult = await repository.signOut();

      // Assert
      expect(signInResult.isSuccess, true);
      expect(getUserResult.isSuccess, true);
      expect(signOutResult.isSuccess, true);

      verify(mockAuthDataSource.signIn(email: email, name: name)).called(1);
      verify(mockAuthDataSource.getCurrentUser()).called(1);
      verify(mockAuthDataSource.signOut()).called(1);
    });

    test('should not propagate data between operations', () async {
      // Arrange
      final mockUserModel1 = MockUserModel();
      final mockUserModel2 = MockUserModel();
      final mockUserEntity1 = MockUserEntity();
      final mockUserEntity2 = MockUserEntity();

      when(mockUserModel1.toEntity()).thenReturn(mockUserEntity1);
      when(mockUserModel2.toEntity()).thenReturn(mockUserEntity2);

      when(
        mockAuthDataSource.signIn(email: email, name: name),
      ).thenAnswer((_) async => Result.success(data: mockUserModel1));
      when(mockAuthDataSource.getCurrentUser()).thenAnswer((_) async => Result.success(data: mockUserModel2));

      // Act
      final signInResult = await repository.signIn(email: email, name: name);
      final getUserResult = await repository.getCurrentUser();

      // Assert
      expect(signInResult.data, mockUserEntity1);
      expect(getUserResult.data, mockUserEntity2);
      expect(signInResult.data, isNot(equals(getUserResult.data)));
    });
  });

  group('AuthRepositoryImpl - Error Recovery', () {
    test('should handle recovery after failure', () async {
      // Arrange
      final error = Exception('First attempt failed');
      final mockUserModel = MockUserModel();
      final mockUserEntity = MockUserEntity();

      when(mockUserModel.toEntity()).thenReturn(mockUserEntity);
      when(mockAuthDataSource.signIn(email: email, name: name)).thenAnswer((_) async => Result.failure(error: error));

      // Act - First attempt (fails)
      final firstResult = await repository.signIn(email: email, name: name);

      // Arrange - Second attempt (succeeds)
      when(
        mockAuthDataSource.signIn(email: email, name: name),
      ).thenAnswer((_) async => Result.success(data: mockUserModel));

      // Act - Second attempt
      final secondResult = await repository.signIn(email: email, name: name);

      // Assert
      expect(firstResult.isFailure, true);
      expect(secondResult.isSuccess, true);
      expect(secondResult.data, mockUserEntity);
      verify(mockAuthDataSource.signIn(email: email, name: name)).called(2);
    });
  });
}
