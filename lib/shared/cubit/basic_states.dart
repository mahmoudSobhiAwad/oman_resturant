part of 'basic_cubit.dart';

sealed class BasicStates {}

final class LocalProductInitial extends BasicStates {}

final class ChangeAnimalForSellState extends BasicStates {}

final class ToggleLocalFavState extends BasicStates {
  final String id;

  ToggleLocalFavState({required this.id});
}

final class LoadingGetLocalGetItemsState extends BasicStates {}

final class SuccessGetLocalGetItemsState extends BasicStates {}

final class FailureGetLocalGetItemsState extends BasicStates {
  final String message;

  FailureGetLocalGetItemsState({required this.message});
}

final class LoadingUpdateLocalGetItemsState extends BasicStates {}

final class SuccessUpdateLocalGetItemsState extends BasicStates {
 // final List<ProductDetailsEntity> products;
  final bool fromFav;
  SuccessUpdateLocalGetItemsState({
   // required this.products,
    this.fromFav = false,
  });
}

final class FailureUpdateLocalGetItemsState extends BasicStates {
  final String errMessage;

  FailureUpdateLocalGetItemsState({required this.errMessage});
}

final class SuccessAddIntoCartState extends BasicStates {}

final class FailureAddIntoCartState extends BasicStates {
  final String errMessage;

  FailureAddIntoCartState({required this.errMessage});
}

final class ChangePageIndexState extends BasicStates {
  final int index;
  final bool isFromFav;

  ChangePageIndexState({required this.index, this.isFromFav = false});
}

final class NavigateToOrderState extends BasicStates {}

final class CheckNotificationState extends BasicStates {}

final class LoadingCheckNotificationState extends CheckNotificationState {}

final class SuccessCheckNotificationState extends CheckNotificationState {
  final bool status;

  SuccessCheckNotificationState({required this.status});
}

final class FailureCheckNotificationState extends CheckNotificationState {}

final class FailedAuthorizedState extends BasicStates {}

final class SuccessAuthorizedState extends BasicStates {}

final class LoadingUpdateLocalPetsState extends BasicStates {}

// final class SuccessUpdateLocalPetsState extends BasicStates {
//   final List<CustomerPetModel> pets;
//   final bool fromFav;
//   SuccessUpdateLocalPetsState({required this.pets, this.fromFav = false});
// }

final class FailureUpdateLocalPetsState extends BasicStates {
  final String errMessage;

  FailureUpdateLocalPetsState({required this.errMessage});
}

final class LoadingGetAllCitiesState extends BasicStates {}

// final class SuccessGetAllCitiesState extends BasicStates {
//   final List<GovernmentModel> governments;
//   SuccessGetAllCitiesState({required this.governments});
// }

final class FailedGetAllCitiesState extends BasicStates {
  final String errMessage;
  FailedGetAllCitiesState({required this.errMessage});
}

final class LoadingUpdateLocalStoreState extends BasicStates {}

// final class SuccessUpdateLocalStoreState extends BasicStates {
//   final List<CustomerStoreModel> stores;
//   SuccessUpdateLocalStoreState({required this.stores});
// }

final class FailureUpdateLocalStoreState extends BasicStates {
  final String errMessage;

  FailureUpdateLocalStoreState({required this.errMessage});
}

final class LoadingCheckCartItemsState extends BasicStates {}

// final class SuccessCheckCartItemsState extends BasicStates {
//   final CheckOutModel model;
//   final CustomerStoreModel? store;

//   SuccessCheckCartItemsState({required this.model, this.store});
// }

final class ErrorCheckCartItemsState extends BasicStates {
  final String message;

  ErrorCheckCartItemsState(this.message);
}

final class ToggleAllFavLoadingState extends BasicStates {}

final class ToggleAllFavSuccessState extends BasicStates {}

final class ToggleAllFavErrorState extends BasicStates {
  final String message;

  ToggleAllFavErrorState(this.message);
}

final class GetAllFavLoadingState extends BasicStates {}

final class GetAllFavSuccessState extends BasicStates {}

final class GetAllFavErrorState extends BasicStates {
  final String message;

  GetAllFavErrorState(this.message);
}

final class GetCustomerProfileState extends BasicStates {}

final class LoadingGetCustomerProfileState extends GetCustomerProfileState {}

final class SuccessGetCustomerProfileState extends GetCustomerProfileState {
  // final CustomerProfileModel profile;

  // SuccessGetCustomerProfileState({required this.profile});
}

final class FailureGetCustomerProfileState extends GetCustomerProfileState {
  final String message;

  FailureGetCustomerProfileState({required this.message});
}

final class CheckCouponState extends BasicStates {}

final class LoadingCheckCouponState extends CheckCouponState {}

final class SuccessCheckCouponState extends CheckCouponState {
  // final CouponModel coupon;

  // SuccessCheckCouponState({required this.coupon});
}

final class FailureCheckCouponState extends CheckCouponState {
  final String message;

  FailureCheckCouponState({required this.message});
}
