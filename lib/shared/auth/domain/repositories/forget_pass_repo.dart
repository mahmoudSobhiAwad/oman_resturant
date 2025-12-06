
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../data/models/forget_pass/forget_pass_params.dart';

abstract class ForgetPassRepo {
  Future<Either<Failures, bool>> verifyPhoneNumberInForgetPass({
    required String params,
  });

  Future<Either<Failures, String>> checkOtp({
    required Map<String, dynamic> params,
  });

  Future<Either<Failures, bool>> resetPassword({
    required ForgetPassParams params,
  });
}
