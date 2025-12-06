import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';

abstract class LayoutRepo {
  Future<Either<Failures, bool>> checkNonSeenNotification();

  // Future<Either<Failures, List<ProductDetailsEntity>>> updateLocalProductsList(
  //   List<ProductDetailsEntity> products,
  // );

  // Future<Either<Failures, List<ProductDetailsEntity>>> getLocalProductsList();
}
