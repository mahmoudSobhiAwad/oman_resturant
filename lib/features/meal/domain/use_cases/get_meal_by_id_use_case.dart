import 'package:dartz/dartz.dart';
import 'package:oman_resturant/core/errors/failures.dart';
import 'package:oman_resturant/core/uses_cases/use_cases.dart';
import 'package:oman_resturant/features/meal/data/meal_model.dart';
import 'package:oman_resturant/features/meal/domain/repo/meal_repo.dart';

class GetMealByIdUseCase implements UseCase<MealModel, String> {
  final MealRepo repository;
  GetMealByIdUseCase(this.repository);

  @override
  Future<Either<Failures, MealModel>> call(String params) async {
    return await repository.getMealById(params);
  }
}
