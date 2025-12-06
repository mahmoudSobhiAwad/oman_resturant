import 'package:dio/dio.dart';

import 'api_consumer.dart';

class DioConsumer implements ApiConsumer {
  final Dio dio;
  DioConsumer({
    required this.dio,
  });

  @override
  Future get({
    required String path,
    Options? options,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
  }) async {
    final response = await dio.get(
      cancelToken: cancelToken,
      path,
      queryParameters: queryParameters,
      data: body,
      options: options,
    );
    return response.data;
  }

  @override
  Future post(
      {required String path,
      Object? body,
      Map<String, dynamic>? queryParameters,
      CancelToken? cancelToken}) async {
    final response = await dio.post(
      cancelToken: cancelToken,
      path,
      queryParameters: queryParameters,
      data: body,
    );

    return response.data;
  }

  @override
  Future put(
      {required String path,
      Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters,
      CancelToken? cancelToken}) async {
    final response = await dio.put(
      cancelToken: cancelToken,
      path,
      data: body,
      queryParameters: queryParameters,
    );
    return response.data;
  }

  @override
  Future patch(
      {required String path,
      Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters,
      CancelToken? cancelToken}) async {
    final response = await dio.patch(
      cancelToken: cancelToken,
      path,
      data: body,
      queryParameters: queryParameters,
    );
    return response.data;
  }

  @override
  Future delete(
      {required String path,
      Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters,
      CancelToken? cancelToken}) async {
    final response = await dio.delete(path,
        queryParameters: queryParameters, data: body, cancelToken: cancelToken);
    return response.data;
  }
}
