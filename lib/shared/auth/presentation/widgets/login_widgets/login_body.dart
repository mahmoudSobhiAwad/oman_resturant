import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';

import '../../../../../core/enums/role_enum.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/utils/theme/app_animations.dart' show AppAnimations;
import '../../../../../core/utils/theme/app_colors.dart';
import '../../../../../core/utils/theme/custom_app_font_styles.dart';
import '../../../../widgets/custom_push_container_button.dart';
import '../../../../widgets/custom_toast.dart' show CustomToast;
import '../../../../widgets/custom_two_option_dialog.dart';
import '../../../data/models/login/login_param_model.dart';
import '../../cubits/login/login_cubit.dart';
import 'custom_password_field.dart';
import 'custom_phone_field.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key, required this.roleEnum});

  final RoleEnum roleEnum;

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode password = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is SuccessLoginPushState) {
          CustomToast(
            context: context,
            header: 'مرحبا بك في تطبيق هدي يوسف نتمنى لك تجربة ممتعة ',
          ).showBottomToast();
          context.go(AppRouter.customerAppLayout);
        } else if (state is FailedLoginPushState) {
          CustomToast(
            context: context,
            header: state.errMessage,
            type: ToastificationType.error,
          ).showBottomToast();
          if (state.errMessage == "يرجى التواصل مع الدعم لتفعيل حسابك") {
            showDialog(
              context: context,
              builder: (context) {
                return CustomTwoOptionDialog(
                  contentWidget: Lottie.asset(
                    AppAnimations.lockAcc,
                    height: 120,
                    width: 120,
                  ),
                  titleTextStyle: CustomAppFontStyle.medium18,
                  titleTextAlign: TextAlign.center,
                  title:
                      "لقد قمت بتعطيل حسابك او تم تعطيل حسابك من قبل الادراة",

                  buttonTitle: 'التواصل مع الدعم',
                  onTap: () {
                    context.pop();
                   // context.push(AppRouter.contactUsPage);
                  },
                );
              },
            );
          }
        }
      },
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "مرحبًا بعودتكِ",
                style: CustomAppFontStyle.semiBold20,
              ),

              const SizedBox(height: 4),

              Text(
                "سجّلي دخولك لمتابعة التسوق، متابعة الطلبات، والاستفادة من عروضنا الخاصة.",
                style: CustomAppFontStyle.light14.copyWith(
                  color: AppColors.gray88,
                ),
              ),
              const SizedBox(height: 24),
              CustomUserNameField(
                onFieldSubmitted: (value) {
                  if (value != null && value.trim().isNotEmpty) {
                    FocusScope.of(context).requestFocus(password);
                  }
                },
                nameController: phoneController,
              ),

              const SizedBox(height: 16),
              BlocBuilder<LoginCubit, LoginState>(
                buildWhen: (prev, curr) => curr is ChangeVisibilityState,
                builder: (context, state) {
                  bool isHidden = true;
                  if (state is ChangeVisibilityState) {
                    isHidden = state.value;
                  }
                  return CustomPasswordField(
                    isHidden: isHidden,
                    passwordController: passwordController,
                    passwordFocus: password,
                    formKey: formKey,
                    onFiledSumbitted: () {
                      context.read<LoginCubit>().loginInto(
                        model: LoginParamModel(
                          roleEnum: RoleEnum.user,
                          password: passwordController.text,
                          phoneNumber: widget.roleEnum == RoleEnum.user
                              ? phoneController.text.length > 2
                                    ? phoneController.text
                                    : ''
                              : phoneController.text,
                        ),
                      );
                    },
                    changeVisibilty: () {
                      context.read<LoginCubit>().changeVisibility(isHidden);
                    },
                  );
                },
              ),
              const SizedBox(height: 8),
              // if (widget.roleEnum == RoleEnum.user)
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: TextButton(
                  onPressed: () => context.push(AppRouter.forgetPassword),
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  child: Text(
                    "هل نسيتِ كلمة المرور؟",
                    style: CustomAppFontStyle.regular14.copyWith(
                      color: AppColors.primary,
                      decorationColor: AppColors.primary,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              BlocBuilder<LoginCubit, LoginState>(
                buildWhen: (prev, curr) => curr is LoginPushState,
                builder: (context, state) {
                  return CustomPushButton(
                    height: 52,
                    isLoading: state is LoadingLoginPushState,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        context.read<LoginCubit>().loginInto(
                          model: LoginParamModel(
                            roleEnum: widget.roleEnum,
                            password: passwordController.text,
                            phoneNumber: widget.roleEnum == RoleEnum.user
                                ? phoneController.text.length > 2
                                      ? phoneController.text
                                      : ''
                                : phoneController.text,
                          ),
                        );
                      }
                    },
                    child: const Center(
                      child: Text(
                        "تسجيل الدخول",
                        style: CustomAppFontStyle.regular16,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 6,
                children: [
                  Text(
                    "ليس لديك حساب؟",
                    style: CustomAppFontStyle.regular14.copyWith(
                      color: AppColors.gray8C,
                    ),
                  ),
                  TextButton(
                    onPressed: () => context.push(AppRouter.signUp),
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    child: Text(
                      "إنشاء حساب ",
                      style: CustomAppFontStyle.regular16.copyWith(
                        color: AppColors.primary,
                        decorationColor: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
