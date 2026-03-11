import 'package:dartz/dartz.dart';
import 'package:oman_resturant/core/errors/failures.dart';
import 'package:oman_resturant/core/uses_cases/params.dart';
import 'package:oman_resturant/core/uses_cases/use_cases.dart';
import 'package:oman_resturant/features/app_layout/data/models/atmosphere_model.dart';
import 'package:oman_resturant/features/app_layout/domain/repo/app_layout_repo.dart';

class GetAtmospheresUseCase
    implements UseCase<List<AtmosphereModel>, NoParams> {
  final AppLayoutRepo repository;
  GetAtmospheresUseCase(this.repository);

  @override
  Future<Either<Failures, List<AtmosphereModel>>> call(NoParams params) async {
    return await repository.getAtmospheres();
  }
}
