import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/theme/app_icons.dart';
import '../../../../widgets/custom_text_field.dart';

class CustomPasswordField extends StatelessWidget {
  const CustomPasswordField({
    super.key,
    required this.isHidden,
    this.passwordController,
    this.passwordFocus,
    this.formKey,
    this.onFiledSumbitted,
    this.changeVisibilty,
    this.validationError,
    this.headerText,
  });

  final bool isHidden;
  final String? validationError;
  final String? headerText;
  final TextEditingController? passwordController;
  final FocusNode? passwordFocus;
  final GlobalKey<FormState>? formKey;
  final void Function()? onFiledSumbitted;
  final void Function()? changeVisibilty;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      headerText: headerText,
      isObeseureText: isHidden,
      controller: passwordController,
      focusNode: passwordFocus,
      // onFieldSubmitted: (value) {
      //   if (value != null && value.trim().isNotEmpty) {
      //     if (formKey?.currentState?.validate() ?? false) {
      //       onFiledSumbitted != null ? onFiledSumbitted!() : ();
      //     }
      //   }
      // },
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return validationError ?? 'برجاءادخال كلمة السر';
        }
        return null;
      },
      prefixWidget: FittedBox(
        fit: BoxFit.scaleDown,
        child: SvgPicture.asset(AppIcons.lock),
      ),

      suffixWidget: IconButton(
        onPressed: () {
          changeVisibilty?.call();
        },
        icon: SvgPicture.asset(
          isHidden ? AppIcons.visibileOn : AppIcons.visibileOff,
        ),
      ),

      hintText: "••••••••",
    );
  }
}
