import 'package:dartz/dartz.dart';
import 'package:oman_resturant/core/errors/failures.dart';
import 'package:oman_resturant/core/uses_cases/params.dart';
import 'package:oman_resturant/core/uses_cases/use_cases.dart';
import 'package:oman_resturant/features/app_layout/data/models/resturant_about_model.dart';
import 'package:oman_resturant/features/app_layout/domain/repo/app_layout_repo.dart';

class GetRestaurantAboutUseCase
    implements UseCase<ResturantAboutModel, NoParams> {
  final AppLayoutRepo repository;
  GetRestaurantAboutUseCase(this.repository);

  @override
  Future<Either<Failures, ResturantAboutModel>> call(NoParams params) async {
    return await repository.getRestaurantAbout();
  }
}
