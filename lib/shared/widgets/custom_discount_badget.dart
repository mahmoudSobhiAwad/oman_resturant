import 'package:flutter/material.dart';

import '../../core/utils/theme/app_colors.dart';
import '../../core/utils/theme/custom_app_font_styles.dart';

class CustomDiscountBadget extends StatelessWidget {
  const CustomDiscountBadget({super.key, this.discountPercentage = 20});
  final num? discountPercentage;
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 0.7,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 40),
        color: AppColors.pinkF312,
        child: Center(
          child: Text(
            "خصم $discountPercentage%",
            style: CustomAppFontStyle.medium12.copyWith(color: AppColors.white),
          ),
        ),
      ),
    );
  }
}
