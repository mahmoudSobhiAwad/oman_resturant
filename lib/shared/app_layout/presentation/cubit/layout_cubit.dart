// import 'dart:developer';

// import 'package:huda_yousef/shared/app_layout/domain/use_cases/check_non_seen_notification.dart';
// import 'package:huda_yousef/core/storage/cache_helper.dart';
// import 'package:huda_yousef/core/uses_cases/params.dart';
// import 'package:huda_yousef/core/utils/constants/app_constants.dart';
// import 'package:bloc/bloc.dart';

// part 'layout_state.dart';

// class LayoutCubit extends Cubit<LayoutState> {
//   LayoutCubit({
//     required this.checkNonSeenNotificationUseCase,
//   }) : super(LayoutInitial());
//   final CheckNonSeenNotificationUseCase checkNonSeenNotificationUseCase;

//   void changeIndex({required int index}) {
//     emit(ChangePageIndexState(index: index));
//   }

//   Future<void> checkIfLogin() async {
//     emit(LoadingCheckNotificationState());
//     final String? isLogin =
//         AppSharedPreferences.getString(key: AppConstants.accessToken);
//     if (isLogin != null && isLogin.isNotEmpty) {
//       await checkNonSeenNotification();
//       //emit(SuccessAuthorizedState());
//     } else {
//       emit(FaliedAuthorizedState());
//     }
//   }

//   Future<void> checkNonSeenNotification() async {
//     try {
//       final result = await checkNonSeenNotificationUseCase.call(NoParams());
//       result.fold((failed) {
//         emit(FailureCheckNotificationState());
//       }, (value) {
//         emit(SuccessCheckNotificationState(status: value));
//       });
//     } catch (e) {
//       log(e.toString());
//     }
//   }
// }
