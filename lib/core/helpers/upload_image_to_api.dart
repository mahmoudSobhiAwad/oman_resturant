import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';

Future<MultipartFile> uploadImageToAPI(File image) async {
  return MultipartFile.fromFile(
    image.path,
    filename: image.path.split('/').last,
    contentType: DioMediaType.parse('image/jpeg'),
  );
}

Future<MultipartFile> uploadImageToAPIWeb(
    Uint8List bytes, String fileName) async {
  return MultipartFile.fromBytes(
    bytes,
    filename: fileName,
    contentType: DioMediaType.parse('image/jpeg'),
  );
}
