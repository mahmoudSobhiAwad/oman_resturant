
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';

import '../../../../core/dependency_injection/dependency_injection.dart';
import '../../../../core/routing/routes.dart';
import '../../../widgets/custom_toast.dart';
import '../../domain/repositories/sign_up_repo.dart' show SignUpRepo;
import '../../domain/use_cases/sign_up/check_otp_code.dart';
import '../../domain/use_cases/sign_up/create_account_use_case.dart';
import '../../domain/use_cases/sign_up/verify_number.dart';
import '../cubits/sign_up/sign_up_cubit.dart';
import '../widgets/sign_up_widgets/account_set_up_info.dart' show AccountSetUpInfo;
import 'otp_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final PageController _pageController = PageController();
  int currIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(
        checkOtpCodeUseCase: CheckOtpCodeUseCase(
          signUpRepo: getIt.get<SignUpRepo>(),
        ),
        createAccountUseCase: CreateAccountUseCase(
          signUpRepo: getIt.get<SignUpRepo>(),
        ),
        verifyNumberInSignUpUseCase: VerifyNumberInSignUpUseCase(
          signUpRepo: getIt.get<SignUpRepo>(),
        ),
      ),
      child: Scaffold(
        body: BlocConsumer<SignUpCubit, SignUpState>(
          listener: (context, state) {
            if (state is SuccessVerifyPhoneState) {
              _pageController.nextPage(
                duration: Durations.medium4,
                curve: Curves.easeIn,
              );
              CustomToast(
                context: context,
                header: "تم ارسال رمز ال OTP الي الرقم عبر الواتساب ",
              ).showBottomToast();
            } else if (state is FailureVerifyPhoneState) {
              CustomToast(
                context: context,
                header: state.errMessage,
                type: ToastificationType.error,
              ).showBottomToast();
            } else if (state is SuccessResendOtpState) {
              CustomToast(
                context: context,
                header: "تم ارسال رمز ال OTP الي الرقم عبر الواتساب ",
              ).showBottomToast();
            } else if (state is FailureResendOtpState) {
              CustomToast(
                context: context,
                header: state.errMessage,
                type: ToastificationType.error,
              ).showBottomToast();
            } else if (state is SuccessCreateAccountState) {
              CustomToast(
                context: context,
                header: "تم انشاء الحساب بنجاح",
              ).showBottomToast();
              context.go(AppRouter.customerAppLayout);
            } else if (state is FailureCreateAccountState) {
              CustomToast(
                context: context,
                header: state.errMessage,
                type: ToastificationType.error,
              ).showBottomToast();
            }
          },
          buildWhen: (prev, curr) => curr is ChangeCurrentPageState,
          builder: (context, state) {
            if (state is ChangeCurrentPageState) {
              currIndex = state.index;
            }
            return SafeArea(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  context.read<SignUpCubit>().changeCurrentPage(index);
                },
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return [
                    AccountSetUpInfo(
                      param: context.read<SignUpCubit>().signUpParams,
                    ),
                    BlocBuilder<SignUpCubit, SignUpState>(
                      builder: (context, state) {
                        return CustomOtp(
                          isLoading: state is LoadingCreateAccountState,
                          reSendOtp: () {
                            context.read<SignUpCubit>().resendVerification();
                          },
                          isLoadingOtp: state is LoadingResendOtpState,
                          onProgress: (value) {
                            context.read<SignUpCubit>().checkOtp(value);
                          },
                          enableRecount: state is SuccessResendOtpState,
                          onBack: () {
                            _pageController.previousPage(
                              duration: Durations.medium4,
                              curve: Curves.easeOut,
                            );
                          },
                          phoneNumber:
                              context.read<SignUpCubit>().signUpParams?.phone ??
                              "",
                        );
                      },
                    ),
                  ][currIndex];
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
