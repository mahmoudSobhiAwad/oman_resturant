// import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/repositories/layout_repo.dart';

class LayoutRepoImpl implements LayoutRepo {
  final ApiConsumer apiConsumer;

  LayoutRepoImpl({required this.apiConsumer});

  @override
  Future<Either<Failures, bool>> checkNonSeenNotification() async {
    try {
      final result = await apiConsumer.get(
        path: EndPoints.notifications,
        queryParameters: {'read': false, 'limit': 1, 'page': 1},
      );
      final bool data = (result['results'] != 0) ? true : false;
      return right(data);
    } on DioException catch (error) {
      return left(ServerFailure.fromDioException(dioException: error));
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  // @override
  // Future<Either<Failures, List<ProductDetailsEntity>>>
  // getLocalProductsList() async {
  //   try {
  //     List<ProductDetailsEntity> list = [];

  //     final productsResult = AppSharedPreferences.getStringList(
  //       key: AppConstants.localProducts,
  //     );

  //     if (productsResult != null && productsResult.isNotEmpty) {
  //       for (var item in productsResult) {
  //         list.add(ProductDetailsEntity.fromLocal(jsonDecode(item)));
  //       }
  //     }

  //     return right(list);
  //   } catch (e) {
  //     return left(ServerFailure(errMessage: e.toString()));
  //   }
  // }

  // @override
  // Future<Either<Failures, List<ProductDetailsEntity>>> updateLocalProductsList(
  //   List<ProductDetailsEntity> products,
  // ) async {
  //   try {
  //     List<String> localProducts = [];
  //     for (var product in products) {
  //       localProducts.add(jsonEncode(product.toLocal()));
  //     }
  //     await AppSharedPreferences.setListString(
  //       key: AppConstants.localProducts,
  //       value: localProducts,
  //     );
  //     return right(products);
  //   } catch (e) {
  //     return left(ServerFailure(errMessage: e.toString()));
  //   }
  // }

  // @override
  // Future<Either<Failures, List<CustomerPetModel>>> updateLocalPetList(
  //   List<CustomerPetModel> pets,
  // ) async {
  //   try {
  //     List<String> localPets = [];
  //     for (var product in pets) {
  //       localPets.add(jsonEncode(product.toLocal()));
  //     }
  //     await AppSharedPreferences.setListString(
  //       key: AppConstants.localPets,
  //       value: localPets,
  //     );
  //     return right(pets);
  //   } catch (e) {
  //     return left(ServerFailure(errMessage: e.toString()));
  //   }
  // }

  // @override
  // Future<Either<Failures, List<ProductDetailsEntity>>> updateLocalStoreList(
  //   List<ProductDetailsEntity> stores,
  // ) async {
  //   try {
  //     List<String> localStores = [];
  //     for (var store in stores) {
  //       localStores.add(jsonEncode(store.toLocal()));
  //     }
  //     await AppSharedPreferences.setListString(
  //       key: AppConstants.localFavStores,
  //       value: localStores,
  //     );
  //     return right(stores);
  //   } catch (e) {
  //     return left(ServerFailure(errMessage: e.toString()));
  //   }
  // }

  // @override
  // Future<Either<Failures, Unit>> toggleFav(ToggleTypeParam params) async {
  //   try {
  //     await apiConsumer.post(path: EndPoints.toggleFav, body: params.toJson());
  //     return right(unit);
  //   } on DioException catch (error) {
  //     return left(ServerFailure.fromDioException(dioException: error));
  //   } catch (e) {
  //     return left(ServerFailure(errMessage: e.toString()));
  //   }
  // }

  // @override
  // Future<Either<Failures, CustomerFavModel>> getAllFav() async {
  //   try {
  //     final result = await apiConsumer.get(path: EndPoints.getAllFav);
  //     return right(CustomerFavModel.fromJson(result));
  //   } on DioException catch (error) {
  //     return left(ServerFailure.fromDioException(dioException: error));
  //   } catch (e) {
  //     return left(ServerFailure(errMessage: e.toString()));
  //   }
  // }
}
