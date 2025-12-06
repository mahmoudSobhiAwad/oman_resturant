import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import '../../core/utils/theme/app_colors.dart';
import '../../core/utils/theme/app_icons.dart';
import '../../core/utils/theme/custom_app_font_styles.dart';
import '../widgets/custom_push_container_button.dart';

class GuestModePage extends StatelessWidget {
  const GuestModePage({super.key, this.title, this.subTitle, this.imgPath});
  final String? title;
  final String? subTitle;
  final String? imgPath;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          SvgPicture.asset(imgPath ?? AppIcons.notLoginedBox),
          // Lottie.asset(AppAnimations.emptyOrders, width: 300, height: 300),
          const SizedBox(height: 16),
          Text(title ?? "my_orders".tr(), style: CustomAppFontStyle.semiBold22),
          const SizedBox(height: 4),
          Text(
            subTitle ?? "not_logined_for_orders".tr(),
            style: CustomAppFontStyle.regular16.copyWith(
              color: AppColors.gray88,
            ),
          ),
          const SizedBox(height: 18),
          Row(
            spacing: 8,
            children: [
              Expanded(
                child: CustomPushButton(
                  radius: 4,

                  child: Text(
                    "login".tr(),
                    style: CustomAppFontStyle.semiBold16.copyWith(
                      color: AppColors.lightGreyF5,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: CustomPushButton(
                  radius: 4,
                  backgroundColor: AppColors.white,
                  border: BorderSide.none,
                  boxBorder: const GradientBoxBorder(
                    gradient: LinearGradient(
                      colors: [AppColors.primary, AppColors.gray5D],
                    ),
                  ),
                  child: Text(
                    "create_acc".tr(),
                    style: CustomAppFontStyle.semiBold16.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
