import 'package:flutter_svg/svg.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../core/utils/theme/app_colors.dart';
import '../../../../../core/utils/theme/app_icons.dart';
import '../../../../../core/utils/theme/custom_app_font_styles.dart';
import '../../../../function/phone_num_validation.dart' show validatePhone, validateName;
import '../../../../widgets/custom_text_field.dart';

class CustomPhoneField extends StatelessWidget {
  const CustomPhoneField({
    super.key,
    this.onFieldSubmitted,
    this.phoneController,
    this.fillColor,
    this.enableValidator = true,
    this.isReadOnly = false,
    this.onTap,
    this.phoneFocus,
    this.hintText,
    this.validatorFun,
  });

  final void Function(String? value)? onFieldSubmitted;
  final TextEditingController? phoneController;
  final Color? fillColor;
  final bool isReadOnly;
  final bool enableValidator;
  final void Function()? onTap;
  final String? hintText;
  final String? Function(String?)? validatorFun;
  final FocusNode? phoneFocus;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      focusNode: phoneFocus,
      fillDisableColor: fillColor,
      isReadOnly: isReadOnly,
      focusFillColor: fillColor,
      prefixWidget: FittedBox(
        fit: BoxFit.scaleDown,
        child: SvgPicture.asset(
          AppIcons.phone,
          colorFilter: const ColorFilter.mode(
            AppColors.primary,
            BlendMode.srcIn,
          ),
        ),
      ),
      onTap: onTap,
      onFieldSubmitted: onFieldSubmitted,
      validator: enableValidator ? validatorFun ?? validatePhone : null,
      controller: phoneController,
      textInputType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      maxLength: 11,
      suffixWidget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "+964",
            textDirection: TextDirection.ltr,
            style: CustomAppFontStyle.light16.copyWith(color: AppColors.gray43),
          ),
        ],
      ),
      hintText: hintText ?? 'ادخل رقم الهاتف...',
    );
  }
}

class CustomUserNameField extends StatelessWidget {
  const CustomUserNameField({
    super.key,
    this.onFieldSubmitted,
    this.nameController,
    this.fillColor,
    this.enableValidator = true,
    this.isReadOnly = false,
    this.onTap,
    this.nameFocus,
    this.hintText,
    this.validatorFun,
  });

  final void Function(String? value)? onFieldSubmitted;
  final TextEditingController? nameController;
  final Color? fillColor;
  final bool isReadOnly;
  final bool enableValidator;
  final void Function()? onTap;
  final String? hintText;
  final String? Function(String?)? validatorFun;
  final FocusNode? nameFocus;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      focusNode: nameFocus,
      fillDisableColor: fillColor,
      isReadOnly: isReadOnly,
      focusFillColor: fillColor,
      onTap: onTap,
      onFieldSubmitted: onFieldSubmitted,
      validator: enableValidator ? validatorFun ?? validateName : null,
      controller: nameController,
      //make validation for username to be alphanumeric and underscores only
      textInputType: TextInputType.text,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9_]')),
      ],
      maxLength: 10,
      prefixWidget: FittedBox(
        fit: BoxFit.scaleDown,
        child: SvgPicture.asset(AppIcons.user),
      ),
      hintText: hintText ?? 'اسم المستخدم ...',
    );
  }
}
