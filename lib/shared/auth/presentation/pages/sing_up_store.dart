// import 'package:huda_yousef/shared/auth/domain/entities/store_sing_up.dart';
// import 'package:huda_yousef/shared/auth/domain/repositories/sign_up_repo.dart';
// import 'package:huda_yousef/shared/auth/domain/repositories/store_sign_up_repo.dart';
// import 'package:huda_yousef/shared/auth/domain/use_cases/sign_up/check_otp_code.dart';
// import 'package:huda_yousef/shared/auth/domain/use_cases/sign_up/verify_number.dart';
// import 'package:huda_yousef/shared/auth/domain/use_cases/sign_up_store/create_account_use_case.dart';
// import 'package:huda_yousef/shared/auth/domain/use_cases/sign_up_store/get_all_subscription.dart';
// import 'package:huda_yousef/shared/auth/presentation/cubits/sign_up_store/sign_up_cubit.dart';
// import 'package:huda_yousef/shared/auth/presentation/pages/otp_page.dart';
// import 'package:huda_yousef/core/dependency_injection/dependency_injection.dart';
// import 'package:huda_yousef/core/routing/routes.dart';
// import 'package:huda_yousef/shared/auth/presentation/widgets/sing_up_store/account_set_up_store.dart';
// import 'package:huda_yousef/shared/widgets/custom_toast.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:toastification/toastification.dart';

// class SignUpStore extends StatefulWidget {
//   const SignUpStore({super.key});

//   @override
//   State<SignUpStore> createState() => _SignUpStoreState();
// }

// class _SignUpStoreState extends State<SignUpStore> {
//   final PageController _pageController = PageController();
//   int currIndex = 0;
//   StoreSignUpParams? _params;

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<SignUpStoreCubit>(
//       create: (context) => SignUpStoreCubit(
//         createAccountUseCase: CreateAccountStoreUseCase(
//           signUpRepo: getIt.get<StoreSignUpRepo>(),
//         ),
//         checkOtpCodeUseCase: CheckOtpCodeUseCase(
//           signUpRepo: getIt.get<SignUpRepo>(),
//         ),
//         verifyNumberInSignUpStoreUseCase: VerifyNumberInSignUpUseCase(
//           signUpRepo: getIt.get<SignUpRepo>(),
//         ),
//         getAllSubscriptionUseCase: GetAllSubscriptionUseCase(
//           signUpRepo: getIt.get<StoreSignUpRepo>(),
//         ),
//       ),
//       child: Scaffold(
//         body: BlocConsumer<SignUpStoreCubit, SignUpStoreState>(
//           listener: (context, state) {
//             if (state is SuccessVerifyPhoneState) {
//               _params = state.params;
//               _pageController.nextPage(
//                 duration: Durations.medium4,
//                 curve: Curves.easeIn,
//               );
//               CustomToast(
//                 context: context,
//                 header: "تم ارسال رمز ال OTP الي الرقم عبر الواتساب ",
//               ).showBottomToast();
//             } else if (state is FailureVerifyPhoneState) {
//               CustomToast(
//                 context: context,
//                 header: state.errMessage,
//                 type: ToastificationType.error,
//               ).showBottomToast();
//             } else if (state is SuccessResendOtpState) {
//               CustomToast(
//                 context: context,
//                 header: "تم ارسال رمز ال OTP الي الرقم عبر الواتساب ",
//               ).showBottomToast();
//             } else if (state is FailureResendOtpState) {
//               CustomToast(
//                 context: context,
//                 header: state.errMessage,
//                 type: ToastificationType.error,
//               ).showBottomToast();
//             } else if (state is SuccessCreateAccountState) {
//               CustomToast(
//                 context: context,
//                 header: "تم انشاء الحساب بنجاح",
//               ).showBottomToast();
//               context.go(AppRouter.storeLayout);
//             } else if (state is FailureCreateAccountState) {
//               CustomToast(
//                 context: context,
//                 header: state.errMessage,
//                 type: ToastificationType.error,
//               ).showBottomToast();
//             }
//           },
//           buildWhen: (prev, curr) => curr is ChangeCurrentPageState,
//           builder: (context, state) {
//             if (state is ChangeCurrentPageState) {
//               currIndex = state.index;
//             }
//             return SafeArea(
//               child: PageView.builder(
//                 controller: _pageController,
//                 onPageChanged: (index) {
//                   context.read<SignUpStoreCubit>().changeCurrentPage(index);
//                 },
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemCount: 2,
//                 itemBuilder: (context, index) {
//                   return [
//                     AccountSetUpStore(param: _params),
//                     BlocBuilder<SignUpStoreCubit, SignUpStoreState>(
//                       builder: (context, state) {
//                         return CustomOtp(
//                           isLoading: state is LoadingCreateAccountState,
//                           reSendOtp: () {
//                             context.read<SignUpStoreCubit>().resendVerification(
//                               params: _params,
//                             );
//                           },
//                           isLoadingOtp: state is LoadingResendOtpState,
//                           onProgress: (value) {
//                             setState(() {
//                               _params;
//                             });

//                             if (_params != null) {
//                               context.read<SignUpStoreCubit>().createAccount(
//                                 params: _params!,
//                               );
//                             }
//                           },
//                           enableRecount: state is SuccessResendOtpState,
//                           onBack: () {
//                             _pageController.previousPage(
//                               duration: Durations.medium4,
//                               curve: Curves.easeOut,
//                             );
//                           },
//                           phoneNumber: _params?.phone ?? "",
//                         );
//                       },
//                     ),
//                   ][currIndex];
//                 },
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
