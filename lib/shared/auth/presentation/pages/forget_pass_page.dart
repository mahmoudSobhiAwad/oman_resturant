import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';

import '../../../../core/dependency_injection/dependency_injection.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/utils/theme/app_colors.dart';
import '../../../widgets/custom_toast.dart';
import '../../domain/repositories/forget_pass_repo.dart';
import '../../domain/use_cases/forget_pass/check_otp.dart';
import '../../domain/use_cases/forget_pass/reset_password.dart';
import '../../domain/use_cases/forget_pass/verify_phone.dart';
import '../cubits/forget_pass/forget_password_cubit.dart';
import '../widgets/forget_pass_widget/phone_verification_page.dart';
import '../widgets/forget_pass_widget/reset_pass_widget.dart';
import 'otp_page.dart';

class ForgetPassPage extends StatefulWidget {
  const ForgetPassPage({super.key});

  @override
  State<ForgetPassPage> createState() => _ForgetPassPageState();
}

class _ForgetPassPageState extends State<ForgetPassPage> {
  final PageController _pageController = PageController();
  int _currIndex = 0;
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  String _code = '';
  String token = '';
  // final GlobalKey<FormState> fromKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _confirmPasswordController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _pageController.dispose();
    // fromKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(
        checkOtpUseCase: CheckOtpUseCase(
          forgetPassRepo: getIt.get<ForgetPassRepo>(),
        ),
        resetPasswordUseCase: ResetPasswordUseCase(
          forgetPassRepo: getIt.get<ForgetPassRepo>(),
        ),
        verifyPhoneInForgetPassewordUseCase:
            VerifyPhoneInForgetPassewordUseCase(
              forgetPassRepo: getIt.get<ForgetPassRepo>(),
            ),
      ),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: AppColors.primary,
          statusBarIconBrightness: Brightness.light,
        ),
        child: Scaffold(
          body: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
            buildWhen: (previous, current) => current is ChangePageIndexState,
            listener: (context, state) {
              if (state is SuccessVerifyPhoneNumberState) {
                _pageController.nextPage(
                  duration: Durations.medium2,
                  curve: Curves.easeIn,
                );
                CustomToast(
                  context: context,
                  header: "تم ارسال رمز ال OTP الي الرقم عبر الواتساب ",
                ).showBottomToast();
              } else if (state is SuccessCheckOtpValidationState) {
                setState(() {
                  _code = state.otpCode;
                  token = state.token;
                });
                _pageController.nextPage(
                  duration: Durations.medium2,
                  curve: Curves.easeIn,
                );
              } else if (state is SuccessResendOtpState) {
                CustomToast(
                  context: context,
                  duration: 7,
                  header: "تم ارسال رمز ال OTP الي الرقم عبر الواتساب ",
                ).showBottomToast();
              } else if (state is FailureCheckOtpValidationState) {
                CustomToast(
                  context: context,
                  header: state.errMessage,
                  type: ToastificationType.error,
                ).showBottomToast();
              } else if (state is FailureResendOtpState) {
                CustomToast(
                  context: context,
                  header: state.errMessage,
                  type: ToastificationType.error,
                ).showBottomToast();
              } else if (state is FailureVerifyPhoneNumberState) {
                CustomToast(
                  context: context,
                  header: state.errMessage,
                  type: ToastificationType.error,
                ).showBottomToast();
              } else if (state is FailureResetPasswordState) {
                CustomToast(
                  context: context,
                  header: state.errMessage,
                  type: ToastificationType.error,
                ).showBottomToast();
              } else if (state is SuccessResetPasswordState) {
                CustomToast(
                  context: context,
                  header: "تم تغيير كلمة السر  بنجاح",
                ).showBottomToast();
                context.go(AppRouter.login);
              }
            },
            builder: (context, state) {
              if (state is ChangePageIndexState) {
                _currIndex = state.index;
              }
              return SafeArea(
                child: PageView.builder(
                  onPageChanged: (index) {
                    context.read<ForgetPasswordCubit>().changePageIndex(index);
                  },
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (contex, index) {
                    return [
                      PhoneVerificationPage(controller: _phoneController),
                      BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
                        builder: (context, state) {
                          return CustomOtp(
                            backTitle: 'السابقة',
                            isLoading: state is LoadingCheckOtpValidationState,
                            enableRecount: state is SuccessResendOtpState,
                            isLoadingOtp: state is LoadingResendOtpState,
                            reSendOtp: () {
                              context
                                  .read<ForgetPasswordCubit>()
                                  .reVerifyPhoneNume(
                                    value: _phoneController.text,
                                  );
                            },
                            onProgress: (value) {
                              context.read<ForgetPasswordCubit>().checkOtp(
                                code: value,
                                phoneNumber: _phoneController.text,
                              );
                            },
                            onBack: () {
                              _pageController.previousPage(
                                duration: Durations.medium2,
                                curve: Curves.easeIn,
                              );
                            },
                            phoneNumber: _phoneController.text,
                          );
                        },
                      ),
                      ResetPasswordPage(
                        token: token,
                        code: _code,
                        onBack: () {
                          _passwordController.clear();
                          _confirmPasswordController.clear();
                          _pageController.jumpToPage(0);
                        },
                        passwordController: _passwordController,
                        confirmPasswordController: _confirmPasswordController,
                        phoneController: _phoneController,
                      ),
                    ][_currIndex];
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
