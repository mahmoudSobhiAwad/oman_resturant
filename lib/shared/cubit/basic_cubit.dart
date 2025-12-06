import 'package:bloc/bloc.dart';

import '../../core/uses_cases/params.dart';
import '../app_layout/domain/use_cases/check_non_seen_notification.dart';
part 'basic_states.dart';

class BasicCubit extends Cubit<BasicStates> {
  BasicCubit({
    // required this.checkCartUseCase,
    // required this.updateLocalUseCase,
    // required this.getLocalProductsUseCase,
    // required this.getCustomerProfileUseCase,
    // required this.checkCouponUseCase,
    // required this.toggleFaveUseCase,
    required this.checkNonSeenNotificationUseCase,
    // required this.getAllFavItems,
  }) : super(LocalProductInitial());
  @override
  void emit(BasicStates state) {
    if (isClosed) return;
    super.emit(state);
  }

  //final CheckCartUseCase checkCartUseCase;

  // final UpdateLocalUseCase updateLocalUseCase;
  // final GetLocalProductsUseCase getLocalProductsUseCase;
  // final GetCustomerProfileUseCase getCustomerProfileUseCase;
  // final CheckCouponUseCase checkCouponUseCase;
  // final UpdatePetLocalUseCase updatePetLocalUseCase;
  // final ToggleFaveUseCase toggleFaveUseCase;
  final CheckNonSeenNotificationUseCase checkNonSeenNotificationUseCase;
  // final UpdateLocalStoreUseCase updateLocalStoreList;
  // final GetAllFavItems getAllFavItems;
  // final CustomerSingleStoreUseCase getSingleStoreUseCase;
  bool isUpdateAnimalForSell = false;
  // List<ProductDetailsEntity> localProducts = [];
  bool isAuthroized = false;
  bool hasNotificationNotSeen = false;

  void changeIndex({required int index, bool fromFav = false}) {
    emit(ChangePageIndexState(index: index, isFromFav: fromFav));
  }

  int getTotalCartLength() {
    int totalLength = 0;
    // for (var product in localProducts) {
    //   totalLength += product.pickedVariant?.quantityInCart ?? 0;
    // }

    return totalLength;
  }

  void changeNotification(bool value) {
    hasNotificationNotSeen = value;
    emit(SuccessCheckNotificationState(status: value));
  }

  int getCartItemsCount() {
    return 0;
    // localProducts
    //  .where((product) => (product.pickedVariant?.quantityInCart ?? 0) > 0)
    //.length;
  }

  num getTotalAmountAfterDiscount() {
    num totalAmount = 0;
    // for (var product in localProducts) {
    //   totalAmount +=
    //       (product.pickedVariant?.priceAfterDiscount ?? 0) *
    //       (product.pickedVariant?.quantityInCart ?? 0);
    // }

    return totalAmount;
  }

  // List<ProductDetailsEntity> getCartItems() {
  //   return localProducts
  //       .where((product) => (product.pickedVariant?.quantityInCart ?? 0) > 0)
  //       .toList();
  // }

  num getTotalAmountBeforeDiscount() {
    num totalAmount = 0;
    // for (var product in localProducts) {
    //   totalAmount += product.pickedVariant?.price ?? 0;
    // }

    return totalAmount;
  }

  Future<void> checkNonSeenNotification() async {
    emit(LoadingCheckNotificationState());

    final result = await checkNonSeenNotificationUseCase.call(NoParams());
    result.fold(
      (failed) {
        emit(FailureCheckNotificationState());
      },
      (value) {
        hasNotificationNotSeen = value;
        emit(SuccessCheckNotificationState(status: value));
      },
    );
  }

  // Future<void> checkCartItemsIds() async {
  //   if (localProducts.where((product) => product.cartCounter > 0).isEmpty &&
  //       localPets.where((pet) => pet.isInCart).isEmpty) {
  //     return;
  //   }
  //   CustomerStoreModel? storeModel;
  //   String storeId =
  //       localProducts
  //           .where((product) => product.cartCounter > 0)
  //           .toList()
  //           .firstOrNull
  //           ?.customerStoreModel
  //           ?.id ??
  //       localPets.where((pet) => pet.isInCart).firstOrNull?.storeId ??
  //       '';

  //   emit(LoadingCheckCartItemsState());
  //   final storeResult = await getSingleStoreUseCase.call(storeId);
  //   storeResult.fold(
  //     (failure) {
  //       emit(ErrorCheckCartItemsState(failure.errMessage));
  //       return;
  //     },
  //     (store) {
  //       storeModel = store;
  //       if (store.isDeleted || store.isActive == false) {
  //         localProducts.removeWhere((product) => product.cartCounter > 0);
  //         localPets.removeWhere((pet) => pet.isInCart);
  //         updateProductsListInLocalData();
  //         updatePetsListInLocalData();
  //         emit(
  //           SuccessCheckCartItemsState(
  //             model: CheckOutModel(),
  //             store: storeModel,
  //           ),
  //         );
  //         return;
  //       }
  //     },
  //   );

  //   if (localProducts.where((product) => product.cartCounter > 0).isEmpty &&
  //       localPets.where((pet) => pet.isInCart).isEmpty) {
  //     return;
  //   }

  //   final result = await checkCartUseCase(
  //     CheckOutModel(
  //       products: localProducts
  //           .where((product) => product.cartCounter > 0)
  //           .toList(),
  //       pets: localPets.where((pet) => pet.isInCart).toList(),
  //     ),
  //   );

  //   result.fold(
  //     (failure) {
  //       emit(ErrorCheckCartItemsState(failure.errMessage));
  //     },
  //     (checkOutModel) {
  //       for (var item in checkOutModel.products) {
  //         final index = localProducts.indexWhere((p) => p.id == item.id);
  //         if (index != -1) {
  //           (item.isDeleted || item.isAvailable == false)
  //               ? localProducts.removeAt(index)
  //               : localProducts[index] = localProducts[index].copyWith(
  //                   price: item.price,
  //                   priceAfterDiscount: item.priceAfterDiscount,
  //                   balance: item.balance,
  //                   cartCounter: localProducts[index].cartCounter > item.balance
  //                       ? item.balance
  //                       : localProducts[index].cartCounter,
  //                   discountPercentage: item.discountPercentage,
  //                 );
  //         }
  //       }
  //       for (var item in checkOutModel.pets) {
  //         final index = localPets.indexWhere((p) => p.id == item.id);
  //         if (index != -1) {
  //           (item.isDeleted ||
  //                   (item.publishStatus != PetPublishStatus.accepted))
  //               ? localPets.removeAt(index)
  //               : localPets[index] = localPets[index].copyWith(
  //                   price: item.price,
  //                   priceAfterDiscount: item.priceAfterDiscount,
  //                   discountPercentage: item.discountPercentage,
  //                 );
  //         }
  //       }
  //       emit(
  //         SuccessCheckCartItemsState(model: checkOutModel, store: storeModel),
  //       );
  //     },
  //   );
  // }

  // bool isProductFav(String id) {
  //   return localProducts.any((p) => p.id == id && p.isFavourite);
  // }

  // bool isItemInLocal(String id) {
  //   return localProducts.any((p) => p.id == id && p.cartCounter > 0);
  // }

  // Future<void> checkNonSeenNotification() async {
  //   try {
  //     emit(LoadingCheckNotificationState());

  //     final result = await checkNonSeenNotificationUseCase.call(NoParams());
  //     result.fold(
  //       (failed) {
  //         emit(FailureCheckNotificationState());
  //       },
  //       (value) {
  //         hasNotificationNotSeen = value;
  //         emit(SuccessCheckNotificationState(status: value));
  //       },
  //     );
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }

  // // void toggleProductFav(CustomerProductModel product) async {
  // //   final index = localProducts.indexWhere((p) => p.id == product.id);
  // //   if (index != -1) {
  // //     localProducts[index].isFavourite = !localProducts[index].isFavourite;
  // //     if (localProducts[index].isFavourite == false &&
  // //         localProducts[index].cartCounter == 0) {
  // //       localProducts.removeAt(index);
  // //     }
  // //   } else {
  // //     product.isFavourite = true;
  // //     localProducts.add(product.copyWith());
  // //   }
  // //   emit(ToggleLocalFavState(id: product.id!));
  // //   await toggleAllFav(type: 'items', id: product.id!);

  // //   await updateProductsListInLocalData(fromFav: true);
  // // }

  // Future<void> getAllFavs() async {
  //   emit(GetAllFavLoadingState());
  //   await Future.delayed(const Duration(seconds: 1));
  //   final result = await getAllFavItems.call(NoParams());
  //   result.fold(
  //     (failure) {
  //       emit(GetAllFavErrorState(failure.errMessage));
  //     },
  //     (favModel) async {
  //       for (var item in favModel.products) {
  //         final index = localProducts.indexWhere((p) => p.id == item.id);
  //         if (index != -1) {
  //           item.isDeleted
  //               ? localProducts.removeAt(index)
  //               : localProducts[index] = localProducts[index].copyWith(
  //                   price: item.price,
  //                   priceAfterDiscount: item.priceAfterDiscount,
  //                   balance: item.balance,
  //                   discountPercentage: item.discountPercentage,
  //                   isFavourite: true,
  //                   cartCounter: localProducts[index].cartCounter > item.balance
  //                       ? item.balance
  //                       : localProducts[index].cartCounter,
  //                 );
  //         } else {
  //           item.isFavourite = true;
  //           localProducts.add(item);
  //         }
  //       }
  //       for (var item in favModel.pets) {
  //         final index = localPets.indexWhere((p) => p.id == item.id);
  //         if (index != -1) {
  //           item.isDeleted
  //               ? localPets.removeAt(index)
  //               : localPets[index] = localPets[index].copyWith(
  //                   price: item.price,
  //                   publishStatus: item.publishStatus,
  //                   isInCart: item.publishStatus == PetPublishStatus.complete
  //                       ? false
  //                       : localPets[index].isInCart,
  //                   priceAfterDiscount:
  //                       ((item.price ?? 0) -
  //                               (item.price ?? 0) *
  //                                   (item.discountPercentage ?? 0) /
  //                                   100)
  //                           .round(),
  //                   discountPercentage: item.discountPercentage,
  //                   isFavourite: true,
  //                 );
  //         } else {
  //           item.isFavourite = true;
  //           localPets.add(item);
  //         }
  //       }
  //       for (var item in favModel.stores) {
  //         final index = localFavStores.indexWhere((s) => s.id == item.id);
  //         if (index != -1) {
  //           localFavStores[index] = localFavStores[index].copyWith(isFav: true);
  //         } else {
  //           item.isFav = true;
  //           localFavStores.add(item);
  //         }
  //       }
  //       emit(GetAllFavSuccessState());
  //       await updateProductsListInLocalData(fromFav: true);
  //       await updatePetsListInLocalData(fromFav: true);
  //       await updateFavStoreList();
  //     },
  //   );
  // }
  void navigateToCart() {
   // removeCartLocalAfterCreateOrder();
    emit(NavigateToOrderState());
  }

  // Future<void> getCustomerProfile() async {
  //   emit(LoadingGetCustomerProfileState());
  //   final result = await getCustomerProfileUseCase.call(NoParams());
  //   result.fold(
  //     (fail) {
  //       emit(FailureGetCustomerProfileState(message: fail.errMessage));
  //     },
  //     (profile) {
  //       emit(SuccessGetCustomerProfileState(profile: profile));
  //     },
  //   );
  // }

  // Future<void> checkCoupon(String code) async {
  //   emit(LoadingCheckCouponState());
  //   final result = await checkCouponUseCase.call(code);
  //   result.fold(
  //     (fail) {
  //       emit(FailureCheckCouponState(message: fail.errMessage));
  //     },
  //     (coupon) {
  //       emit(SuccessCheckCouponState(coupon: coupon));
  //     },
  //   );
  // }

  // int getMatchedProductNumInCart(ProductDetailsEntity model) {
  //   return localProducts
  //           .where(
  //             (p) =>
  //                 p.id == model.id &&
  //                 (p.pickedVariant?.isEqual(model.pickedVariant) ?? false),
  //           )
  //           .firstOrNull
  //           ?.pickedVariant
  //           ?.quantityInCart ??
  //       0;
  // }

  // Future<void> addProductsIntoList(ProductDetailsEntity model) async {
  //   bool addedOrUpdated = false;
  //   if (localProducts.isEmpty) {
  //     model.pickedVariant = model.pickedVariant?.copyWith(quantityInCart: 1);
  //     localProducts.add(model);
  //     addedOrUpdated = true;
  //   } else if (localProducts.any((p) => p.id == model.id)) {
  //     final index = localProducts.indexWhere(
  //       (p) =>
  //           p.id == model.id &&
  //           (p.pickedVariant?.isEqual(model.pickedVariant) ?? false),
  //     );
  //     if (index != -1) {
  //       if ((localProducts[index].pickedVariant?.quantityInCart ?? 0) <
  //           (model.pickedVariant?.quantity ?? 0)) {
  //         localProducts[index].pickedVariant?.quantityInCart++;
  //         emit(SuccessAddIntoCartState());
  //         addedOrUpdated = true;
  //       } else {
  //         emit(
  //           FailureAddIntoCartState(
  //             errMessage: "لديك بالفعل الكمية المتوفرة في السلة",
  //           ),
  //         );
  //         return;
  //       }
  //     } else {
  //       model.pickedVariant = model.pickedVariant?.copyWith(quantityInCart: 1);
  //       localProducts.add(model);
  //       addedOrUpdated = true;
  //     }
  //   } else {
  //     model.pickedVariant = model.pickedVariant?.copyWith(quantityInCart: 1);
  //     localProducts.add(model);
  //     addedOrUpdated = true;
  //   }

  //   if (addedOrUpdated) {
  //     await updateProductsListInLocalData();
  //   }
  // }

  // Future<void> getAllItemsFromLocal() async {
  //   emit(LoadingGetLocalGetItemsState());
  //   final result = await getLocalProductsUseCase.call(NoParams());
  //   result.fold(
  //     (fail) {
  //       emit(FailureGetLocalGetItemsState(message: fail.errMessage));
  //     },
  //     (products) {
  //       localProducts = products;
  //       emit(SuccessGetLocalGetItemsState());
  //     },
  //   );
  // }

  // Future<void> updateProductsListInLocalData({bool fromFav = false}) async {
  //   emit(LoadingUpdateLocalGetItemsState());
  //   final result = await updateLocalUseCase.call(localProducts);
  //   result.fold(
  //     (fail) {
  //       emit(FailureUpdateLocalGetItemsState(errMessage: fail.errMessage));
  //     },
  //     (products) {
  //       emit(
  //         SuccessUpdateLocalGetItemsState(products: products, fromFav: fromFav),
  //       );
  //     },
  //   );
  // }

  // void increaseCounter(
  //   String? productId,
  //   ProductVariantEntity? pickedVariant,
  // ) async {
  //   final index = localProducts.indexWhere(
  //     (p) =>
  //         p.id == productId &&
  //         (p.pickedVariant?.isEqual(pickedVariant) ?? false),
  //   );
  //   if (index != -1) {
  //     if ((localProducts[index].pickedVariant?.quantityInCart ?? 0) <
  //         (pickedVariant?.quantity ?? 0)) {
  //       localProducts[index].pickedVariant?.quantityInCart++;
  //     } else {
  //       emit(
  //         FailureAddIntoCartState(
  //           errMessage: "لديك بالفعل الكمية المتوفرة في السلة",
  //         ),
  //       );
  //     }
  //   }
  //   emit(SuccessUpdateLocalGetItemsState(products: localProducts));
  //   await updateProductsListInLocalData();
  // }

  // void decreaseCounter(
  //   String productId,
  //   ProductVariantEntity? pickedVariant,
  // ) async {
  //   final index = localProducts.indexWhere(
  //     (p) =>
  //         p.id == productId &&
  //         (p.pickedVariant?.isEqual(pickedVariant) ?? false),
  //   );
  //   if (index != -1) {
  //     localProducts[index].pickedVariant?.quantityInCart--;
  //   }
  //   emit(SuccessUpdateLocalGetItemsState(products: localProducts));
  //   await updateProductsListInLocalData();
  // }

  // Future<void> removeCartLocalAfterCreateOrder() async {
  //   // Set cartCounter = 0 for all items
  //   for (var product in localProducts) {
  //     product.pickedVariant = null;
  //   }

  //   // Remove items where isFav == false and cartCounter == 0
  //   localProducts.isNotEmpty
  //       ? localProducts.removeWhere(
  //           (product) =>
  //               product.isFav == false &&
  //               (product.pickedVariant == null ||
  //                   product.pickedVariant?.quantityInCart == 0),
  //         )
  //       : null;

  //   await updateProductsListInLocalData();
  // }

  // Future<void> removeProductFromCart(
  //   ProductDetailsEntity productDetailsEntity,
  // ) async {
  //   final index = localProducts.indexWhere(
  //     (p) => p.id == productDetailsEntity.id,
  //   );
  //   if (index != -1) {
  //     localProducts[index].pickedVariant?.quantityInCart = 0;

  //     if (localProducts[index].isFav == false) {
  //       localProducts.removeAt(index);
  //     }
  //     await updateProductsListInLocalData();
  //   }
  // }
}
