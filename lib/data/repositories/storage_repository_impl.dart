import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../core/common/result.dart';
import '../../domain/repositories/storage_repository.dart';

class StorageRepositoryImpl implements StorageRepository {
  StorageRepositoryImpl({Future<Directory> Function()? documentsDirectory})
    : _documentsDirectory = documentsDirectory ?? getApplicationDocumentsDirectory;

  final Future<Directory> Function() _documentsDirectory;

  Future<Result<String>> _saveImage(String imgPath, String folder) async {
    try {
      final source = File(imgPath);

      if (!await source.exists()) {
        return Result.failure(error: 'Image file not found');
      }

      final documentsDir = await _documentsDirectory();
      final directory = Directory(p.join(documentsDir.path, folder));

      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }

      final fileName = '${DateTime.now().millisecondsSinceEpoch}_${p.basename(imgPath)}';
      final saved = await source.copy(p.join(directory.path, fileName));

      return Result.success(data: saved.path);
    } catch (e) {
      return Result.failure(error: e);
    }
  }

  @override
  Future<Result<String>> uploadUserPhoto(String imgPath) => _saveImage(imgPath, 'user_photos');

  @override
  Future<Result<String?>> uploadProductImage(String imgPath) async {
    final result = await _saveImage(imgPath, 'product_images');
    if (result.isFailure) return Result.failure(error: result.error!);

    return Result.success(data: result.data);
  }
}
