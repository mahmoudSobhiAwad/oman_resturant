
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../data/models/sign_up/sign_up_params.dart';
import '../../data/models/user_model.dart';

abstract class SignUpRepo {
  Future<Either<Failures, String>> verifyNumber({required SignUpParams params});
  Future<Either<Failures, String>> checkOtp({required SignUpParams params});

  Future<Either<Failures, UserModel>> createAccount({
    required SignUpParams params,
  });
}
