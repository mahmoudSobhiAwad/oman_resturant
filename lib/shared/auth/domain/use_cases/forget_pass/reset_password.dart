import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../../../../../core/uses_cases/use_cases.dart';
import '../../../data/models/forget_pass/forget_pass_params.dart';
import '../../repositories/forget_pass_repo.dart';

class ResetPasswordUseCase extends UseCase<bool, ForgetPassParams> {
  final ForgetPassRepo forgetPassRepo;

  ResetPasswordUseCase({required this.forgetPassRepo});

  @override
  Future<Either<Failures, bool>> call(ForgetPassParams params) async {
    return await forgetPassRepo.resetPassword(params: params);
  }
}
