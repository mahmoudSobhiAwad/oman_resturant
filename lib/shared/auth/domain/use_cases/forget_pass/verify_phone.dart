import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../../../../../core/uses_cases/use_cases.dart';
import '../../repositories/forget_pass_repo.dart';

class VerifyPhoneInForgetPassewordUseCase extends UseCase<bool, String> {
  final ForgetPassRepo forgetPassRepo;

  VerifyPhoneInForgetPassewordUseCase({required this.forgetPassRepo});

  @override
  Future<Either<Failures, bool>> call(String params) async {
    return await forgetPassRepo.verifyPhoneNumberInForgetPass(params: params);
  }
}
