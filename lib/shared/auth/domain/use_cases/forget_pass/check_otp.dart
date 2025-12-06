
import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../../../../../core/uses_cases/use_cases.dart';
import '../../repositories/forget_pass_repo.dart';

class CheckOtpUseCase extends UseCase<String, Map<String, dynamic>> {
  final ForgetPassRepo forgetPassRepo;

  CheckOtpUseCase({required this.forgetPassRepo});

  @override
  Future<Either<Failures, String>> call(Map<String, dynamic> params) async {
    return await forgetPassRepo.checkOtp(params: params);
  }
}
