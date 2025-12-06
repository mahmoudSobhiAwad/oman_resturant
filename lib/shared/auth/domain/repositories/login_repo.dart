
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../data/models/login/login_param_model.dart' show LoginParamModel;
import '../../data/models/user_model.dart';

abstract class LoginRepo {
  Future<Either<Failures, UserModel>> login({required LoginParamModel params});
}
