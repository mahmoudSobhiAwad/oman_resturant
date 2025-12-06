import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class Failures extends Equatable {
  final String errMessage;

  const Failures({required this.errMessage});
}

class ServerFailure extends Failures {
  const ServerFailure({required super.errMessage});

  factory ServerFailure.fromDioException({required DioException dioException}) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return const ServerFailure(
          errMessage: 'No internet connection, please try again!',
        );
      case DioExceptionType.sendTimeout:
        return const ServerFailure(errMessage: 'Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return const ServerFailure(
          errMessage: 'Receive timeout with ApiServer',
        );
      case DioExceptionType.badCertificate:
        return const ServerFailure(errMessage: 'badCertificate with ApiServer');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          statusCode: dioException.response!.statusCode,
          response: dioException.response!.data,
        );

      case DioExceptionType.cancel:
        return const ServerFailure(
          errMessage: 'Request to ApiServer was canceled',
        );
      case DioExceptionType.connectionError:
        {
          return const ServerFailure(
            errMessage: 'No internet connection, please try again!',
          );
        }
      case DioExceptionType.unknown:
        return const ServerFailure(
          errMessage: 'Unexpected error, please try later!',
        );
    }
  }

  factory ServerFailure.fromResponse({int? statusCode, dynamic response}) {
    if (statusCode == 400 ||
        statusCode == 401 ||
        statusCode == 422 ||
        statusCode == 406 ||
        statusCode == 409 ||
        statusCode == 424 ||
        statusCode == 404) {
      return ServerFailure(
        errMessage:
            response['message'] ??      response['error'] ?? 'Unexpected error, please try later!',
      );
    } else if (statusCode == 500) {
      return ServerFailure(
        errMessage: response['message'] ?? 'Server error, please try later!',
      );
    } else if (statusCode == 406) {
      return const ServerFailure(
        errMessage: 'تم تعطيل حسابك من قبل الادمن او الادارة',
      );
    } else if (statusCode == 403) {
      //    Helper.expiredToken();
      String message = response['message'] ?? 'Forbidden';
      if (message.contains("Not Allowed")) {
        return ServerFailure(errMessage: response['message']);
      }
      return const ServerFailure(
        errMessage: 'Your session has expired, please login again!',
      );
    } else {
      return const ServerFailure(
        errMessage: 'Oops there was an error, please try later!',
      );
    }
  }

  @override
  List<Object?> get props => [];
}

class OfflineFailures extends Failures {
  const OfflineFailures({required super.errMessage});

  @override
  List<Object?> get props => [];
}

class CacheFailures extends Failures {
  const CacheFailures({required super.errMessage});

  @override
  List<Object?> get props => [];
}
