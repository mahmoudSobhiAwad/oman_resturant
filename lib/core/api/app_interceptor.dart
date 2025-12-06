import 'dart:developer';

import 'package:dio/dio.dart';

import '../routing/app_router.dart';
import '../routing/routes.dart';
import '../storage/cache_helper.dart';
import '../utils/constants/app_constants.dart';
import 'end_points.dart';
import 'status_code.dart';

class AppInterceptors extends Interceptor {
  final Dio dio;

  AppInterceptors({required this.dio});

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    String? authToken = AppSharedPreferences.getString(
      key: AppConstants.accessToken,
    );
    if (authToken != null && authToken.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $authToken';
    }
    // getIt.unregister<CancelToken>();
    // getIt.registerSingleton<CancelToken>(CancelToken());
    // options.cancelToken = getIt<CancelToken>();

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // ToDo
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    log("err.response?.statusCode ${err.response?.statusCode}");

    if (err.response?.statusCode == StatusCode.unauthorized) {
      String? accessToken = AppSharedPreferences.getString(
        key: AppConstants.accessToken,
      );
      String? refreshToken = AppSharedPreferences.getString(
        key: AppConstants.refreshToken,
      );
      log(accessToken ?? '');
      log(refreshToken ?? '');
      if (refreshToken != null && refreshToken.isNotEmpty) {
        dio.options.baseUrl = EndPoints.baseUrl;
        await dio
            .post(EndPoints.refreshUserToken, data: {"token": refreshToken})
            .then((value) async {
              log("value : $value");
              String token = value.data["accessToken"];
              await AppSharedPreferences.setString(
                value: token,
                key: AppConstants.accessToken,
              );
            });
        accessToken = AppSharedPreferences.getString(
          key: AppConstants.accessToken,
        );
        err.requestOptions.headers['Authorization'] = 'Bearer $accessToken';
        return handler.resolve(await dio.fetch(err.requestOptions));
      }
    } else if (err.response?.statusCode == StatusCode.forbidden) {
      if (err.response?.data != null) {
        if (err.response?.data['message'] != null) {
          String message = err.response?.data['message'];
          if (message.contains("Not Allowed")) {
            log("Not Allowed");
          } else {
            AppSharedPreferences.remove(key: AppConstants.accessToken);
            AppSharedPreferences.remove(key: AppConstants.refreshToken);
            appRouter.go(AppRouter.login);
          }
        }
      }
    }
    super.onError(err, handler);
  }
}
