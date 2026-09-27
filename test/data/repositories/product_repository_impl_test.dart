import 'package:flutter_pos/core/common/result.dart';
import 'package:flutter_pos/data/datasources/local/product_local_datasource_impl.dart';
import 'package:flutter_pos/data/models/product_model.dart';
import 'package:flutter_pos/data/repositories/product_repository_impl.dart';
import 'package:flutter_pos/domain/entities/product_entity.dart';
import 'package:flutter_test/flutter_test.dart';

class _FakeProductLocalDatasource extends Fake implements ProductLocalDatasourceImpl {
  Result<List<ProductModel>> getUserProductsResult = Result.success(data: []);
  Result<ProductModel?> getProductResult = Result.success(data: null);
  Result<int> createProductResult = Result.success(data: 1);
  Result<void> updateProductResult = Result.success(data: null);
  Result<void> deleteProductResult = Result.success(data: null);

  @override
  Future<Result<List<ProductModel>>> getUserProducts(
    String userId, {
    String orderBy = 'createdAt',
    String sortBy = 'DESC',
    int limit = 10,
    int? offset,
    String? contains,
  }) async {
    return getUserProductsResult;
  }

  @override
  Future<Result<ProductModel?>> getProduct(int id) async => getProductResult;

  @override
  Future<Result<int>> createProduct(ProductModel product) async => createProductResult;

  @override
  Future<Result<void>> updateProduct(ProductModel product) async => updateProductResult;

  @override
  Future<Result<void>> deleteProduct(int id) async => deleteProductResult;
}

void main() {
  late _FakeProductLocalDatasource local;
  late ProductRepositoryImpl repository;

  const product = ProductEntity(
    id: 1,
    createdById: 'user-1',
    name: 'Tea',
    imageUrl: '/tmp/tea.png',
    stock: 4,
    price: 10,
  );

  setUp(() {
    local = _FakeProductLocalDatasource();
    repository = ProductRepositoryImpl(productLocalDatasource: local);
  });

  test('returns local products', () async {
    local.getUserProductsResult = Result.success(
      data: [ProductModel.fromEntity(product)],
    );

    final result = await repository.getUserProducts('user-1');

    expect(result.isSuccess, isTrue);
    expect(result.data?.single.name, 'Tea');
  });

  test('returns failure when listing products fails', () async {
    local.getUserProductsResult = Result.failure(error: 'db');

    final result = await repository.getUserProducts('user-1');

    expect(result.isFailure, isTrue);
    expect(result.error, 'db');
  });

  test('creates a product locally', () async {
    local.createProductResult = Result.success(data: 7);

    final result = await repository.createProduct(product);

    expect(result.data, 7);
  });

  test('updates and deletes a product locally', () async {
    expect((await repository.updateProduct(product)).isSuccess, isTrue);
    expect((await repository.deleteProduct(1)).isSuccess, isTrue);
  });
}
