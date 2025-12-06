import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/constants/app_constants.dart';
import '../../domain/repositories/sign_up_repo.dart';
import '../models/sign_up/sign_up_params.dart';
import '../models/user_model.dart';
import 'login_repo_impl.dart';

class SignUpRepoImpl extends SignUpRepo {
  final ApiConsumer apiConsumer;

  SignUpRepoImpl({required this.apiConsumer});

  @override
  Future<Either<Failures, UserModel>> createAccount({
    required SignUpParams params,
  }) async {
    try {
      final result = await apiConsumer.post(
        path: EndPoints.signup,
        body: params.toJson(),
      );
      await saveUserAuth(UserModel.fromJson(result));
      return right(UserModel.fromJson(result));
    } on DioException catch (error) {
      return left(ServerFailure.fromDioException(dioException: error));
    } catch (error) {
      return left(ServerFailure(errMessage: error.toString()));
    }
  }

  @override
  Future<Either<Failures, String>> verifyNumber({
    required SignUpParams params,
  }) async {
    try {
      final result = await apiConsumer.post(
        path: EndPoints.sendVerificationCodeForPhone,
        body: params.toVerifyNumber(),
      );
      return right(result['message']);
    } on DioException catch (error) {
      return left(ServerFailure.fromDioException(dioException: error));
    } catch (error) {
      return left(ServerFailure(errMessage: error.toString()));
    }
  }

  @override
  Future<Either<Failures, String>> checkOtp({
    required SignUpParams params,
  }) async {
    try {
      final result = await apiConsumer.post(
        path: EndPoints.verifyCode,
        body: {
          'code': params.code,
          // "phone":"+201093080158",
          'phone': "${AppConstants.phoneCode}${params.phone}",
        },
      );
      return right(result['message']);
    } on DioException catch (error) {
      return left(ServerFailure.fromDioException(dioException: error));
    } catch (error) {
      return left(ServerFailure(errMessage: error.toString()));
    }
  }
}
