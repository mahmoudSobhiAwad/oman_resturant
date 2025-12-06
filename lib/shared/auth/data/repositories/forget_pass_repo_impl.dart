import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/constants/app_constants.dart';
import '../../domain/repositories/forget_pass_repo.dart';
import '../models/forget_pass/forget_pass_params.dart';

class ForgetPassRepoImpl extends ForgetPassRepo {
  final ApiConsumer apiConsumer;

  ForgetPassRepoImpl({required this.apiConsumer});

  @override
  Future<Either<Failures, bool>> resetPassword({
    required ForgetPassParams params,
  }) async {
    try {
      final result = await apiConsumer.put(
        path: 'user/resetPassword',
        body: params.toJson(),
      );
      return right(result['success']);
    } on DioException catch (error) {
      return left(ServerFailure.fromDioException(dioException: error));
    } catch (error) {
      return left(ServerFailure(errMessage: error.toString()));
    }
  }

  @override
  Future<Either<Failures, bool>> verifyPhoneNumberInForgetPass({
    required String params,
  }) async {
    try {
      final result = await apiConsumer.post(
        path: EndPoints.sendVerificationCodeForPhone,

        body: {'phone': "${AppConstants.phoneCode}$params", 'register': false},
      );
      return right(result['success']);
    } on DioException catch (error) {
      return left(ServerFailure.fromDioException(dioException: error));
    } catch (error) {
      return left(ServerFailure(errMessage: error.toString()));
    }
  }

  @override
  Future<Either<Failures, String>> checkOtp({
    required Map<String, dynamic> params,
  }) async {
    try {
      await apiConsumer.post(path: EndPoints.verifyCode, body: params);
      return right("Success");
    } on DioException catch (error) {
      return left(ServerFailure.fromDioException(dioException: error));
    } catch (error) {
      return left(ServerFailure(errMessage: error.toString()));
    }
  }
}
