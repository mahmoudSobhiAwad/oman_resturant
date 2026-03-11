import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'package:oman_resturant/core/api/app_interceptor.dart';
import 'package:oman_resturant/core/api/dio_consumer.dart';
import 'package:oman_resturant/core/api/end_points.dart';

import 'package:oman_resturant/features/app_layout/data/repos/app_layout_repo_impl.dart';
import 'package:oman_resturant/features/app_layout/domain/repo/app_layout_repo.dart';
import 'package:oman_resturant/features/app_layout/domain/use_cases/get_atmospheres_use_case.dart';
import 'package:oman_resturant/features/app_layout/domain/use_cases/get_restaurant_about_use_case.dart';

import 'package:oman_resturant/features/meal/data/repos/meal_repo_impl.dart';
import 'package:oman_resturant/features/meal/domain/repo/meal_repo.dart';
import 'package:oman_resturant/features/meal/domain/use_cases/get_meal_by_id_use_case.dart';
import 'package:oman_resturant/features/meal/domain/use_cases/get_meals_use_case.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  //============== DIO CONFIGURATIONS ====================//
  getIt.registerSingleton<Dio>(
    Dio(
      BaseOptions(
          baseUrl: EndPoints.baseUrl,
          connectTimeout: const Duration(seconds: 90),
          receiveTimeout: const Duration(seconds: 90),
        )
        ..followRedirects = false
        ..receiveDataWhenStatusError = true,
    ),
  );

  getIt.registerSingleton<DioConsumer>(
    DioConsumer(
      dio: getIt.get<Dio>()
        ..interceptors.add(AppInterceptors(dio: getIt.get<Dio>()))
        ..interceptors.addAll([
          if (kDebugMode)
            PrettyDioLogger(
              request: true,
              requestBody: true,
              responseHeader: true,
              responseBody: true,
              error: true,
              compact: true,
            ),
        ]),
    ),
  );
  getIt.registerSingleton<CancelToken>(CancelToken());

  //============== App Layout ====================//
  getIt.registerLazySingleton<AppLayoutRepo>(() => AppLayoutRepoImpl());
  getIt.registerLazySingleton(
    () => GetRestaurantAboutUseCase(getIt.get<AppLayoutRepo>()),
  );
  getIt.registerLazySingleton(
    () => GetAtmospheresUseCase(getIt.get<AppLayoutRepo>()),
  );

  //============== Meal ==========================//
  getIt.registerLazySingleton<MealRepo>(() => MealRepoImpl());
  getIt.registerLazySingleton(() => GetMealsUseCase(getIt.get<MealRepo>()));
  getIt.registerLazySingleton(() => GetMealByIdUseCase(getIt.get<MealRepo>()));
}
