import 'package:dartz/dartz.dart';
import 'package:oman_resturant/core/errors/failures.dart';
import 'package:oman_resturant/core/uses_cases/params.dart';
import 'package:oman_resturant/core/uses_cases/use_cases.dart';
import 'package:oman_resturant/features/meal/data/meal_model.dart';
import 'package:oman_resturant/features/meal/domain/repo/meal_repo.dart';

class GetMealsUseCase implements UseCase<List<MealModel>, NoParams> {
  final MealRepo repository;
  GetMealsUseCase(this.repository);

  @override
  Future<Either<Failures, List<MealModel>>> call(NoParams params) async {
    return await repository.getMeals();
  }
}
