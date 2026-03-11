import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:oman_resturant/core/errors/failures.dart';
import 'package:oman_resturant/core/utils/constants/app_constants.dart';
import 'package:oman_resturant/features/meal/data/meal_model.dart';
import 'package:oman_resturant/features/meal/domain/repo/meal_repo.dart';

class MealRepoImpl implements MealRepo {
  @override
  Future<Either<Failures, List<MealModel>>> getMeals() async {
    try {
      final result = jsonDecode(
        await rootBundle.loadString(AppConstants.mealPath),
      );
      return Right((result as List).map((e) => MealModel.fromJson(e)).toList());
    } catch (error, stackTrace) {
      log(stackTrace.toString());
      return Left(ServerFailure(errMessage: error.toString()));
    }
  }

  @override
  Future<Either<Failures, MealModel>> getMealById(String id) async {
    try {
      final result = jsonDecode(
        await rootBundle.loadString(AppConstants.mealPath),
      );

      final matchedMeal = (result as List)
          .where((item) => item['id'] == id)
          .firstOrNull;

      if (matchedMeal == null) {
        return const Left(ServerFailure(errMessage: 'Meal not found.'));
      }

      return Right(MealModel.fromJson(matchedMeal));
    } catch (error, stackTrace) {
      log(stackTrace.toString());
      return Left(ServerFailure(errMessage: error.toString()));
    }
  }
}
