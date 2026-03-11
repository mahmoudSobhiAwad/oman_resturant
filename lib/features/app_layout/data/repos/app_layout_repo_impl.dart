import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:oman_resturant/core/errors/failures.dart';
import 'package:oman_resturant/core/utils/constants/app_constants.dart';
import 'package:oman_resturant/features/app_layout/data/models/atmosphere_model.dart';
import 'package:oman_resturant/features/app_layout/data/models/resturant_about_model.dart';
import 'package:oman_resturant/features/app_layout/domain/repo/app_layout_repo.dart';

class AppLayoutRepoImpl implements AppLayoutRepo {
  @override
  Future<Either<Failures, ResturantAboutModel>> getRestaurantAbout() async {
    try {
      final result = jsonDecode(
        await rootBundle.loadString(AppConstants.resturantAbout),
      );
      return Right(ResturantAboutModel.fromJson(result));
    } catch (error, stackTrace) {
      log(stackTrace.toString());
      return Left(ServerFailure(errMessage: error.toString()));
    }
  }

  @override
  Future<Either<Failures, List<AtmosphereModel>>> getAtmospheres() async {
    try {
      final result = jsonDecode(
        await rootBundle.loadString(AppConstants.atmospheresPath),
      );
      return Right(
        (result as List)
            .map((e) => AtmosphereModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
    } catch (error, stackTrace) {
      log(stackTrace.toString());
      return Left(ServerFailure(errMessage: error.toString()));
    }
  }
}
