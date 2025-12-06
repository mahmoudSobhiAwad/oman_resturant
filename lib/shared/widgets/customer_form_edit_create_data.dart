import 'package:flutter_svg/svg.dart';
import '../../core/utils/theme/app_colors.dart';
import '../../core/utils/theme/app_icons.dart';
import '../../shared/auth/presentation/widgets/login_widgets/custom_phone_field.dart';
import '../../shared/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class CustomUserForm extends StatelessWidget {
  const CustomUserForm({
    super.key,
    required this.nameController,
    required this.nameFocus,
    required this.userNameFocus,
    required this.userNameController,
    required this.areaFocus,
    this.areaController,
    this.phoneController,
    this.phoneFocus,
    this.requestLastFocust,
    this.enablePhoneNumber = true,
    this.initialId,
  });

  final TextEditingController nameController;
  final TextEditingController? phoneController;
  final FocusNode nameFocus;
  final FocusNode? phoneFocus;
  final FocusNode userNameFocus;
  final TextEditingController? userNameController;
  final FocusNode areaFocus;
  final TextEditingController? areaController;

  final void Function(String?)? requestLastFocust;
  final bool enablePhoneNumber;
  final String? initialId;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        CustomTextFormField(
          controller: nameController,
          validator: validateName,
          hintText: 'أدخل اسمك الكامل...',
          prefixWidget: FittedBox(
            fit: BoxFit.scaleDown,
            child: SvgPicture.asset(
              AppIcons.userName,
              colorFilter: const ColorFilter.mode(
                AppColors.primary,
                BlendMode.srcIn,
              ),
            ),
          ),
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (_) {
            FocusScope.of(context).requestFocus(userNameFocus);
          },
        ),

        CustomTextFormField(
          controller: userNameController,
          focusNode: userNameFocus,
          validator: validateUserName,
          hintText: 'اسم المستخدم ...',
          prefixWidget: FittedBox(
            fit: BoxFit.scaleDown,
            child: SvgPicture.asset(
              AppIcons.user,
              colorFilter: const ColorFilter.mode(
                AppColors.primary,
                BlendMode.srcIn,
              ),
            ),
          ),
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (_) {
            FocusScope.of(
              context,
            ).requestFocus(enablePhoneNumber ? phoneFocus : userNameFocus);
          },
        ),

        CustomPhoneField(
          phoneFocus: phoneFocus,
          phoneController: phoneController,
          onFieldSubmitted: (value) {
            if (value != null && value.trim().isNotEmpty) {
              FocusScope.of(context).requestFocus(userNameFocus);
            }
          },
        ),
      ],
    );
  }

  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'برجاء ادخال الاسم';
    }
    return null;
  }

  String? validateUserName(String? value) {
    // make regex to allow only alphanumeric and underscore characters
    final regex = RegExp(r'^[a-zA-Z0-9_]+$');
    if (value == null || value.trim().isEmpty) {
      return 'برجاء ادخال اسم المستخدم';
    } else if (!regex.hasMatch(value)) {
      return 'اسم المستخدم يجب أن يحتوي على أحرف وأرقام وشرطات سفلية فقط';
    }
    return null;
  }

  String? validateAddress(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'برجاء ادخال العنوان';
    }
    return null;
  }

  String? validateArea(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'برجاء ادخال المنطقة';
    }
    return null;
  }
}
