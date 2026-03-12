import 'package:oman_resturant/core/utils/theme/app_colors.dart';
import 'package:oman_resturant/core/utils/theme/custom_app_font_styles.dart';
import 'package:oman_resturant/shared/widgets/custom_container.dart';
import 'package:flutter/material.dart';

class CustomMealPreparationItem extends StatelessWidget {
  const CustomMealPreparationItem({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      borderRaduis: 6,
      border: Border.all(color: AppColors.white.withValues(alpha: 0.19)),
      backGroundColor: AppColors.white.withValues(alpha: 0.3),
      padding: EdgeInsetsDirectional.symmetric(horizontal: 9, vertical: 12),
      child: Text(
        title,
        style: CustomAppFontStyle.bold10(
          context,
        ).copyWith(color: AppColors.white),
      ),
    );
  }
}
