import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/uses_cases/params.dart';
import '../../../../core/uses_cases/use_cases.dart';
import '../repositories/layout_repo.dart';

class CheckNonSeenNotificationUseCase extends UseCase<bool, NoParams> {
  final LayoutRepo layoutRepo;

  CheckNonSeenNotificationUseCase({required this.layoutRepo});

  @override
  Future<Either<Failures, bool>> call(NoParams params) async {
    return await layoutRepo.checkNonSeenNotification();
  }
}
