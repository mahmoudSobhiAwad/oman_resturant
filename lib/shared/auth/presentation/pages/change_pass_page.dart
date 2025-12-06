import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/theme/app_colors.dart';
import '../../../../core/utils/theme/app_icons.dart';
import '../../../../core/utils/theme/custom_app_font_styles.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_push_container_button.dart';
import '../../../widgets/custom_text_field.dart';

class ChangePassPage extends StatefulWidget {
  const ChangePassPage({super.key});

  @override
  State<ChangePassPage> createState() => _ChangePassPageState();
}

class _ChangePassPageState extends State<ChangePassPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyCustomAppBar(title: 'تغيير كلمة المرور'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "تعيين كلمة مرور جديدة",
              style: CustomAppFontStyle.semiBold20,
            ),
            const SizedBox(height: 4.0),
            Text(
              "أدخلي كلمة مرور جديدة لتسجيل الدخول إلى حسابك. ننصح باختيار كلمة مرور قوية مكوّنة من حروف وأرقام.",
              style: CustomAppFontStyle.regular15.copyWith(
                color: AppColors.gray88,
              ),
            ),
            const SizedBox(height: 24.0),
            CustomTextFormField(
              hintText: "كلمة المرور الحالية...",
              prefixWidget: SvgPicture.asset(
                AppIcons.lock,
                fit: BoxFit.scaleDown,
              ),
              suffixWidget: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  AppIcons.visibileOff,
                  fit: BoxFit.scaleDown,
                ),
              ),
              hintStyle: CustomAppFontStyle.regular16.copyWith(
                color: AppColors.gray71,
              ),
            ),
            const SizedBox(height: 12.0),
            CustomTextFormField(
              hintText: "كلمة المرور الجديدة...",
              suffixWidget: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  AppIcons.visibileOff,
                  fit: BoxFit.scaleDown,
                ),
              ),
              prefixWidget: SvgPicture.asset(
                AppIcons.lock,
                fit: BoxFit.scaleDown,
              ),

              hintStyle: CustomAppFontStyle.regular16.copyWith(
                color: AppColors.gray71,
              ),
            ),
            const SizedBox(height: 12.0),

            CustomTextFormField(
              prefixWidget: SvgPicture.asset(
                AppIcons.lock,
                fit: BoxFit.scaleDown,
              ),
              suffixWidget: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  AppIcons.visibileOn,
                  fit: BoxFit.scaleDown,
                ),
              ),
              hintText: "تأكيد كلمة المرور الجديدة...",
              hintStyle: CustomAppFontStyle.regular16.copyWith(
                color: AppColors.gray71,
              ),
            ),
            const SizedBox(height: 12.0),

            CustomPushButton(
              margin: const EdgeInsets.symmetric(vertical: 24.0),
              child: Center(
                child: Text(
                  "تغيير كلمة المرور",
                  style: CustomAppFontStyle.semiBold16.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
