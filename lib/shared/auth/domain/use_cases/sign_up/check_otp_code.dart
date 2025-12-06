import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../../../../../core/uses_cases/use_cases.dart';
import '../../../data/models/sign_up/sign_up_params.dart';
import '../../repositories/sign_up_repo.dart';

class CheckOtpCodeUseCase extends UseCase<String, SignUpParams> {
  final SignUpRepo signUpRepo;

  CheckOtpCodeUseCase({required this.signUpRepo});
  @override
  Future<Either<Failures, String>> call(SignUpParams params) async {
    return await signUpRepo.checkOtp(params: params);
  }
}
