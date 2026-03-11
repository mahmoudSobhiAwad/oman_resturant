import 'package:oman_resturant/core/utils/theme/app_colors.dart';
import 'package:oman_resturant/core/utils/theme/app_gradient.dart';
import 'package:oman_resturant/core/utils/theme/app_icons.dart';
import 'package:oman_resturant/core/utils/theme/custom_app_font_styles.dart';
import 'package:oman_resturant/shared/widgets/custom_asset_image.dart';
import 'package:oman_resturant/shared/widgets/custom_liquid_button.dart';
import 'package:oman_resturant/shared/widgets/custom_push_container_button.dart';
import 'package:oman_resturant/shared/widgets/custom_shader_text.dart';
import 'package:flutter/material.dart';

class MealDetailsBottomNav extends StatelessWidget {
  const MealDetailsBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomShaderText(
                title: '45.95 JD',
                fontStyle: CustomAppFontStyle.bold18.copyWith(
                  color: AppColors.white,
                ),
              ),
              Text(
                "+ tax & service",
                style: CustomAppFontStyle.bold12.copyWith(
                  color: AppColors.gray74,
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
        CustomPushButton(
          boxBorder: Border.all(color: AppColors.white.withValues(alpha: 0.2)),
          height: 52,
          backGradient: AppGradient.primaryGradient,
          radius: 26,
          padding: EdgeInsetsDirectional.only(
            top: 4,
            bottom: 5,
            start: 14,
            end: 6,
          ),
          child: Row(
            spacing: 8,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Add To Order",
                style: CustomAppFontStyle.bold12.copyWith(
                  color: AppColors.black,
                ),
              ),
              CustomLiquidContainer(
                raduis: 18,
                child: Center(
                  child: CustomAssetImage(path: AppIcons.arrowForward),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
