import 'package:flutter_svg/svg.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/theme/app_colors.dart';
import '../../../../../core/utils/theme/app_images.dart';
import '../../../../../core/utils/theme/custom_app_font_styles.dart';
import '../../../../widgets/custom_push_container_button.dart';
import '../../cubits/forget_pass/forget_password_cubit.dart';
import '../auth_header.dart';
import '../login_widgets/custom_phone_field.dart';

class PhoneVerificationPage extends StatefulWidget {
  const PhoneVerificationPage({
    super.key,
    required this.controller,
    // required this.formKey,
  });

  final TextEditingController controller;

  @override
  State<PhoneVerificationPage> createState() => _PhoneVerificationPageState();
}

class _PhoneVerificationPageState extends State<PhoneVerificationPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            AuthHeader(
              backTitle: 'تسجيل الدخول',
              onBack: () => context.pop(),
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
                    "نسيتِ كلمة المرور؟",
                    style: CustomAppFontStyle.semiBold20,
                  ),

                  Text(
                    "لا تقلقي، فقط أدخلي رقم هاتفك المسجّل وسنرسل لك رابطًا لإعادة تعيين كلمة المرور.",
                    style: CustomAppFontStyle.light14.copyWith(
                      color: AppColors.gray59,
                    ),
                  ),
                  const SizedBox(height: 32),
                  CustomPhoneField(
                    phoneController: widget.controller,
                    hintText: "اكتب رقمك...",
                  ),

                  const SizedBox(height: 24),
                  BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
                    buildWhen: (prev, curr) => curr is VerifyPhoneNumberState,
                    builder: (context, state) {
                      return CustomPushButton(
                        isLoading: state is LoadingVerifyPhoneNumberState,
                        height: 52,
                        onTap: () {
                          if (formKey.currentState?.validate() ?? false) {
                            context
                                .read<ForgetPasswordCubit>()
                                .verifyPhoneNumber(
                                  phoneNum: widget.controller.text,
                                );
                          }
                        },
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: const Center(
                          child: Text(
                            "ارسل رمز التحقق",
                            style: CustomAppFontStyle.regular16,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 3,
                    children: [
                      Text(
                        'تذكّرتِ كلمة المرور؟',
                        style: CustomAppFontStyle.regular14.copyWith(
                          color: AppColors.gray8C,
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(0),
                        ),
                        onPressed: () => context.pop(),
                        child: Text(
                          'تسجيل الدخول',
                          style: CustomAppFontStyle.regular14.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
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
