import 'package:flutter_pos/core/common/result.dart';
import 'package:flutter_pos/data/datasources/local/transaction_local_datasource_impl.dart';
import 'package:flutter_pos/data/models/transaction_model.dart';
import 'package:flutter_pos/data/repositories/transaction_repository_impl.dart';
import 'package:flutter_pos/domain/entities/transaction_entity.dart';
import 'package:flutter_test/flutter_test.dart';

class _FakeTransactionLocalDatasource extends Fake implements TransactionLocalDatasourceImpl {
  Result<List<TransactionModel>> getUserTransactionsResult = Result.success(data: []);
  Result<int> createTransactionResult = Result.success(data: 1);
  Result<void> updateTransactionResult = Result.success(data: null);
  Result<void> deleteTransactionResult = Result.success(data: null);

  @override
  Future<Result<List<TransactionModel>>> getUserTransactions(
    String userId, {
    String orderBy = 'createdAt',
    String sortBy = 'DESC',
    int limit = 10,
    int? offset,
    String? contains,
  }) async {
    return getUserTransactionsResult;
  }

  @override
  Future<Result<int>> createTransaction(TransactionModel transaction) async => createTransactionResult;

  @override
  Future<Result<void>> updateTransaction(TransactionModel transaction) async => updateTransactionResult;

  @override
  Future<Result<void>> deleteTransaction(int id) async => deleteTransactionResult;
}

void main() {
  late _FakeTransactionLocalDatasource local;
  late TransactionRepositoryImpl repository;

  const transaction = TransactionEntity(
    id: 1,
    paymentMethod: 'cash',
    createdById: 'user-1',
    receivedAmount: 20,
    returnAmount: 0,
    totalAmount: 20,
    totalOrderedProduct: 1,
  );

  setUp(() {
    local = _FakeTransactionLocalDatasource();
    repository = TransactionRepositoryImpl(transactionLocalDatasource: local);
  });

  test('returns local transactions', () async {
    local.getUserTransactionsResult = Result.success(
      data: [TransactionModel.fromEntity(transaction)],
    );

    final result = await repository.getUserTransactions('user-1');

    expect(result.isSuccess, isTrue);
    expect(result.data?.single.paymentMethod, 'cash');
  });

  test('creates, updates, and deletes a transaction locally', () async {
    local.createTransactionResult = Result.success(data: 3);

    expect((await repository.createTransaction(transaction)).data, 3);
    expect((await repository.updateTransaction(transaction)).isSuccess, isTrue);
    expect((await repository.deleteTransaction(1)).isSuccess, isTrue);
  });

  test('returns failure when listing transactions fails', () async {
    local.getUserTransactionsResult = Result.failure(error: 'db');

    final result = await repository.getUserTransactions('user-1');

    expect(result.isFailure, isTrue);
  });
}
