import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/enums/role_enum.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/storage/cache_helper.dart';
import '../../../../core/utils/constants/app_constants.dart';
import '../../domain/repositories/login_repo.dart';
import '../models/login/login_param_model.dart';
import '../models/user_model.dart';

class LoginRepoImpl extends LoginRepo {
  final ApiConsumer apiConsumer;

  LoginRepoImpl({required this.apiConsumer});

  @override
  Future<Either<Failures, UserModel>> login({
    required LoginParamModel params,
  }) async {
    try {
      final String path = switch (params.roleEnum) {
        RoleEnum.user => EndPoints.login,
        RoleEnum.influencers => EndPoints.storeLogin,
        RoleEnum.employees => EndPoints.storeLogin,
      };
      final result = await apiConsumer.post(path: path, body: params.toJson());
      await saveUserAuth(UserModel.fromJson(result, roleEnum: params.roleEnum));
      final UserModel user = UserModel.fromJson(
        result,
        roleEnum: params.roleEnum,
      );

      return right(user);
    } on DioException catch (error) {
      return left(ServerFailure.fromDioException(dioException: error));
    } catch (error, stackTrace) {
      log(stackTrace.toString());
      return left(ServerFailure(errMessage: error.toString()));
    }
  }
}

Future<void> saveUserAuth(UserModel user) async {
  await AppSharedPreferences.setString(
    value: user.accessToken,
    key: AppConstants.accessToken,
  );
  await AppSharedPreferences.setString(
    value: user.refreshToken,
    key: AppConstants.refreshToken,
  );
  await AppSharedPreferences.setString(
    value: user.id,
    key: AppConstants.userId,
  );
  await AppSharedPreferences.setString(
    value: user.id,
    key: AppConstants.merchantId,
  );
  await AppSharedPreferences.setString(
    value: jsonEncode(user.toJson()),
    key: AppConstants.userModel,
  );
}
