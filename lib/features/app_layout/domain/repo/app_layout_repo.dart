import 'package:dartz/dartz.dart';
import 'package:oman_resturant/core/errors/failures.dart';
import 'package:oman_resturant/features/app_layout/data/models/atmosphere_model.dart';
import 'package:oman_resturant/features/app_layout/data/models/resturant_about_model.dart';

abstract class AppLayoutRepo {
  Future<Either<Failures, ResturantAboutModel>> getRestaurantAbout();
  Future<Either<Failures, List<AtmosphereModel>>> getAtmospheres();
}
