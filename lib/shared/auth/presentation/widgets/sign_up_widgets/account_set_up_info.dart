import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/utils/theme/app_colors.dart';
import '../../../../../core/utils/theme/app_icons.dart';
import '../../../../../core/utils/theme/custom_app_font_styles.dart';
import '../../../../widgets/custom_push_container_button.dart';
import '../../../../widgets/custom_text_field.dart';
import '../../../../widgets/customer_form_edit_create_data.dart';
import '../../../data/models/sign_up/address_model.dart';
import '../../../data/models/sign_up/sign_up_params.dart';
import '../../cubits/sign_up/sign_up_cubit.dart';
import '../auth_header.dart';
import '../login_widgets/custom_password_field.dart';

class AccountSetUpInfo extends StatefulWidget {
  const AccountSetUpInfo({super.key, this.param});

  final SignUpParams? param;

  @override
  State<AccountSetUpInfo> createState() => _AccountSetUpInfoState();
}

class _AccountSetUpInfoState extends State<AccountSetUpInfo> {
  final formKey = GlobalKey<FormState>();
  bool boxEnabled = false;

  // TextEditingControllers for each field
  final TextEditingController nameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController promoCodeController = TextEditingController();

  // FocusNodes for each field
  final FocusNode nameFocus = FocusNode();
  final FocusNode userNameFocus = FocusNode();
  final FocusNode areaFocus = FocusNode();
  final FocusNode phoneFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  AddressModel? adressModel;

  // Validation logic for each field

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'برجاء ادخال كلمة السر';
    }
    return null;
  }

  @override
  void initState() {
    if (widget.param != null) {
      nameController.text = widget.param!.name ?? "";
      phoneController.text = widget.param!.phone ?? "";
      passwordController.text = widget.param!.password ?? "";
      userNameController.text = widget.param!.userName ?? "";
      promoCodeController.text = widget.param!.promoCode ?? "";
      boxEnabled = true;
    }
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    userNameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    nameFocus.dispose();
    userNameFocus.dispose();
    areaFocus.dispose();
    phoneFocus.dispose();
    passwordFocus.dispose();
    promoCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                AuthHeader(
                  backTitle: 'تسجيل دخول',
                  onBack: () => context.canPop()
                      ? context.pop()
                      : context.go(AppRouter.login),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "أهلاً بكِ في عالم الجمال",
                        style: CustomAppFontStyle.semiBold20,
                      ),
                      const SizedBox(height: 4),

                      const Text(
                        "أنشئي حسابك وابدئي رحلة تسوّق فريدة مع منتجات أصلية وهدايا حصرية.",
                        style: CustomAppFontStyle.light14,
                      ),
                      const SizedBox(height: 24),

                      CustomUserForm(
                        phoneController: phoneController,
                        phoneFocus: phoneFocus,
                        nameController: nameController,
                        nameFocus: nameFocus,
                        userNameFocus: userNameFocus,
                        userNameController: userNameController,
                        areaFocus: areaFocus,
                        requestLastFocust: (_) {
                          FocusScope.of(context).requestFocus(phoneFocus);
                        },
                      ),
                      const SizedBox(height: 16),
                      BlocBuilder<SignUpCubit, SignUpState>(
                        buildWhen: (prev, curr) {
                          return curr is ChangeVisibilityState;
                        },
                        builder: (context, state) {
                          bool isHidden = true;
                          if (state is ChangeVisibilityState) {
                            isHidden = state.value;
                          }
                          return CustomPasswordField(
                            isHidden: isHidden,
                            formKey: formKey,
                            onFiledSumbitted: () {},
                            changeVisibilty: () {
                              context.read<SignUpCubit>().changeVisibility(
                                isHidden,
                              );
                            },
                            passwordController: passwordController,
                            passwordFocus: passwordFocus,
                          );
                        },
                      ),
                      const SizedBox(height: 8),
                      CustomTextFormField(
                        controller: promoCodeController,
                        hintText: "لديك برومو كود؟ (HUDA123)",
                        bottomText:
                            "هل تمت دعوتك من أحد؟ أدخل كود الدعوة واحصل عالنقاط.",
                        headerTextStyle: CustomAppFontStyle.regular14,
                        prefixWidget: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: SvgPicture.asset(
                            AppIcons.promoCodeQr,

                            colorFilter: const ColorFilter.mode(
                              AppColors.primary,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                      // Row(
                      //   spacing: 2,
                      //   children: [
                      //     BlocBuilder<SignUpCubit, SignUpState>(
                      //       buildWhen: (prev, curr) {
                      //         return curr is ChangeSelectBoxState;
                      //       },
                      //       builder: (context, state) {
                      //         if (state is ChangeSelectBoxState) {
                      //           boxEnabled = state.boxState;
                      //         }
                      //         return Checkbox(
                      //           materialTapTargetSize:
                      //               MaterialTapTargetSize.shrinkWrap,
                      //           visualDensity: VisualDensity.compact,
                      //           value: boxEnabled,
                      //           onChanged: (value) {
                      //             if (value != null) {
                      //               context
                      //                   .read<SignUpCubit>()
                      //                   .changeSelectedBoxState(value);
                      //             }
                      //           },
                      //           shape: RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.circular(4),
                      //           ),
                      //         );
                      //       },
                      //     ),
                      //     Text(
                      //       "أوافق علي",
                      //       style: CustomAppFontStyle.light14.copyWith(
                      //         color: AppColors.gray8C,
                      //       ),
                      //     ),
                      //     TextButton(
                      //       onPressed: () {
                      //         context.push(AppRouter.termsAndConditions);
                      //       },
                      //       style: TextButton.styleFrom(
                      //         padding: EdgeInsets.zero,
                      //         minimumSize: const Size(0, 0),
                      //       ),
                      //       child: Text(
                      //         "شروط الاستخدام",
                      //         style: CustomAppFontStyle.regular14.copyWith(
                      //           decoration: TextDecoration.underline,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 36),
            BlocBuilder<SignUpCubit, SignUpState>(
              buildWhen: (prev, curr) => curr is VerifyPhoneState,
              builder: (context, state) {
                return SafeArea(
                  top: false,
                  bottom: true,
                  child: Column(
                    children: [
                      CustomPushButton(
                        height: 50,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        isLoading: state is LoadingVerifyPhoneState,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ).copyWith(bottom: 10),
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            context.read<SignUpCubit>().verifySentPhone(
                              params: SignUpParams(
                                name: nameController.text,
                                phone: phoneController.text,
                                userName: userNameController.text,
                                password: passwordController.text,
                                promoCode: promoCodeController.text,
                              ),
                            );
                          }
                        },
                        child: const Center(
                          child: Text(
                            "متابعة",
                            style: CustomAppFontStyle.regular16,
                          ),
                        ),
                      ),
                      CustomPushButton(
                        height: 50,
                        backgroundColor: AppColors.white,
                        border: const BorderSide(
                          color: AppColors.black,
                          width: 1,
                        ),

                        padding: const EdgeInsets.symmetric(vertical: 12),

                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ).copyWith(bottom: 10),
                        onTap: () {
                          context.go(AppRouter.login);
                        },
                        child: Center(
                          child: Text(
                            "تسجيل دخول",
                            style: CustomAppFontStyle.medium16.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
