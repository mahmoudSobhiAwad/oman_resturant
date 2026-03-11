import 'package:dartz/dartz.dart';

import '../errors/failures.dart';

abstract class UseCase<T, Params> {
  Future<Either<Failures, T>> call(Params params);
}
