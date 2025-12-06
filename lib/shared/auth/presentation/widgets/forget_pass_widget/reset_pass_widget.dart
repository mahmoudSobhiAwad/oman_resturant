
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/theme/app_colors.dart';
import '../../../../../core/utils/theme/app_images.dart';
import '../../../../../core/utils/theme/custom_app_font_styles.dart';
import '../../../../widgets/custom_push_container_button.dart';
import '../../../data/models/forget_pass/forget_pass_params.dart' ;
import '../../cubits/forget_pass/forget_password_cubit.dart';
import '../auth_header.dart';
import '../login_widgets/custom_password_field.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({
    super.key,
    required this.onBack,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.code,
    required this.token,
    required this.phoneController,
  });

  final void Function() onBack;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController phoneController;
  final String code;
  final String token;

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            AuthHeader(
              backTitle: 'السابقة',
              onBack: widget.onBack,
              logoWidget: Center(
                child: SvgPicture.asset(
                  AppImages.passLogo,
                  width: 120,
                  height: 120,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 16,
                left: 16,
                top: 32,
                bottom: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "تعيين كلمة مرور جديدة",
                    style: CustomAppFontStyle.semiBold20,
                  ),
                  Text(
                    "أدخلي كلمة مرور جديدة لتسجيل الدخول إلى حسابك. ننصح باختيار كلمة مرور قوية مكوّنة من حروف وأرقام.",
                    style: CustomAppFontStyle.light14.copyWith(
                      color: AppColors.gray59,
                    ),
                  ),
                  const SizedBox(height: 24),
                  BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
                    buildWhen:
                        (prev, curr) => curr is ChangePasswordVisibilityState,
                    builder: (context, state) {
                      bool isHidden = true;
                      if (state is ChangePasswordVisibilityState) {
                        isHidden = state.value;
                      }
                      return CustomPasswordField(
                        isHidden: isHidden,
                        passwordController: widget.passwordController,
                        formKey: formKey,
                        changeVisibilty: () {
                          context
                              .read<ForgetPasswordCubit>()
                              .changeVisibilityOfPassword(isHidden);
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                  BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
                    buildWhen:
                        (prev, curr) =>
                            curr is ChangeConfirmPasswordVisibilityState,
                    builder: (context, state) {
                      bool isHidden = true;
                      if (state is ChangeConfirmPasswordVisibilityState) {
                        isHidden = state.value;
                      }
                      return CustomPasswordField(
                        validationError: "كلمة السر غير متطابقة",
                        isHidden: isHidden,
                        passwordController: widget.confirmPasswordController,
                        formKey: formKey,
                        changeVisibilty: () {
                          context
                              .read<ForgetPasswordCubit>()
                              .changeVisibilityOfConfirmedPassword(isHidden);
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                  BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
                    buildWhen: (prev, curr) => curr is ResetPasswordState,
                    builder: (context, state) {
                      return CustomPushButton(
                        height: 52,
                        isLoading: state is LoadingResetPasswordState,
                        radius: 52,
                        onTap: () {
                          if (formKey.currentState?.validate() ?? false) {
                            context.read<ForgetPasswordCubit>().resetPassword(
                              params: ForgetPassParams(
                                password: widget.passwordController.text,
                                confirmPassword:
                                    widget.confirmPasswordController.text,
                                phoneNumber: widget.phoneController.text
                                    .substring(2),
                              ),
                            );
                          }
                        },
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: const Center(
                          child: Text(
                            "تعيين كلمة المرور",
                            style: CustomAppFontStyle.regular16,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
