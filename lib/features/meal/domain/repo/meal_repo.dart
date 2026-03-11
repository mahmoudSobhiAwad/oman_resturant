import 'package:dartz/dartz.dart';
import 'package:oman_resturant/core/errors/failures.dart';
import 'package:oman_resturant/features/meal/data/meal_model.dart';

abstract class MealRepo {
  Future<Either<Failures, List<MealModel>>> getMeals();
  Future<Either<Failures, MealModel>> getMealById(String id);
}
