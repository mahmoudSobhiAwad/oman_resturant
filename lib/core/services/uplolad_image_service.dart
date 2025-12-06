import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import '../../shared/widgets/custom_add_image_with_edit_delete.dart';
import '../api/api_consumer.dart';
import '../api/end_points.dart';
import '../errors/failures.dart';

Future<Either<Failures, String>> uploadImage({
  required ImageTypeModel params,
  required ApiConsumer apiConsumer,
}) async {
  try {
    // Compress image to max 1MB
    String compressedPath = await _compressImage(params.path);

    var data = FormData.fromMap({
      'image': await MultipartFile.fromFile(
        compressedPath,
        filename: params.path.split('/').last,
        contentType: DioMediaType.parse("image/${params.path.split('.').last}"),
      ),
    });
    final result = await apiConsumer.post(
      path: EndPoints.uploadOneImage,
      body: data,
    );

    // Clean up compressed file if it's different from original
    if (compressedPath != params.path) {
      try {
        await File(compressedPath).delete();
      } catch (e) {
        // Ignore cleanup errors
      }
    }

    return right(result['fileName']);
  } on DioException catch (error) {
    return left(ServerFailure.fromDioException(dioException: error));
  } catch (error) {
    return left(ServerFailure(errMessage: error.toString()));
  }
}

Future<String> _compressImage(String imagePath) async {
  final file = File(imagePath);
  final fileSize = await file.length();

  // If file is already under 1MB, return original path
  const maxSizeInBytes = 1 * 1024 * 1024; // 1MB
  if (fileSize <= maxSizeInBytes) {
    return imagePath;
  }

  // Calculate compression quality based on file size
  int quality = 85;
  if (fileSize > 5 * 1024 * 1024) {
    // > 5MB
    quality = 60;
  } else if (fileSize > 3 * 1024 * 1024) {
    // > 3MB
    quality = 70;
  }

  try {
    final compressedFile = await FlutterImageCompress.compressAndGetFile(
      imagePath,
      '${imagePath}_compressed.jpg',
      quality: quality,
      minWidth: 1920,
      minHeight: 1080,
      format: CompressFormat.jpeg,
    );

    if (compressedFile != null) {
      final compressedSize = await compressedFile.length();

      // If still too large, compress more aggressively
      if (compressedSize > maxSizeInBytes && quality > 30) {
        final moreCompressed = await FlutterImageCompress.compressAndGetFile(
          compressedFile.path,
          '${imagePath}_compressed_final.jpg',
          quality: 30,
          minWidth: 1280,
          minHeight: 720,
          format: CompressFormat.jpeg,
        );
        return moreCompressed?.path ?? imagePath;
      }

      return compressedFile.path;
    }
  } catch (e) {
    // If compression fails, return original path
    return imagePath;
  }

  return imagePath;
}
