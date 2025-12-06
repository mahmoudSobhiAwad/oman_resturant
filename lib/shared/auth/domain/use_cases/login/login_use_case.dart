import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../../../../../core/uses_cases/use_cases.dart';
import '../../../data/models/login/login_param_model.dart';
import '../../../data/models/user_model.dart';
import '../../repositories/login_repo.dart';

class LoginUseCase extends UseCase<UserModel, LoginParamModel> {
  final LoginRepo loginRepo;

  LoginUseCase({required this.loginRepo});

  @override
  Future<Either<Failures, UserModel>> call(LoginParamModel params) async {
    return await loginRepo.login(params: params);
  }
}
