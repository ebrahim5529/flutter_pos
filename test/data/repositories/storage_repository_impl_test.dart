import 'dart:io';

import 'package:flutter_pos/data/repositories/storage_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Directory documentsDir;
  late StorageRepositoryImpl repository;

  setUp(() async {
    documentsDir = await Directory.systemTemp.createTemp('flutter_pos_images');
    repository = StorageRepositoryImpl(documentsDirectory: () async => documentsDir);
  });

  tearDown(() async {
    if (await documentsDir.exists()) {
      await documentsDir.delete(recursive: true);
    }
  });

  test('copies a user photo into the app documents directory', () async {
    final source = File('${documentsDir.path}/source.png');
    await source.writeAsBytes([1, 2, 3]);

    final result = await repository.uploadUserPhoto(source.path);

    expect(result.isSuccess, isTrue);
    expect(File(result.data!).readAsBytesSync(), [1, 2, 3]);
    expect(result.data!.contains('user_photos'), isTrue);
  });

  test('copies a product image into the app documents directory', () async {
    final source = File('${documentsDir.path}/product.jpg');
    await source.writeAsBytes([4, 5]);

    final result = await repository.uploadProductImage(source.path);

    expect(result.isSuccess, isTrue);
    expect(result.data!.contains('product_images'), isTrue);
  });

  test('returns failure when the image file is missing', () async {
    final result = await repository.uploadUserPhoto('${documentsDir.path}/missing.png');

    expect(result.isFailure, isTrue);
  });
}
