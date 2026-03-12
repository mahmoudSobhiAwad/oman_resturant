import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:oman_resturant/core/utils/extensions/money_format.dart';
import 'package:oman_resturant/core/utils/theme/app_colors.dart';
import 'package:oman_resturant/core/utils/theme/app_gradient.dart';
import 'package:oman_resturant/core/utils/theme/custom_app_font_styles.dart';
import 'package:oman_resturant/features/meal/data/meal_model.dart';
import 'package:oman_resturant/shared/widgets/custom_cached_image.dart';
import 'package:oman_resturant/shared/widgets/custom_container.dart';
import 'package:oman_resturant/shared/widgets/custom_liquid_button.dart';

class CustomMealCard extends StatelessWidget {
  const CustomMealCard({
    super.key,
    required this.width,
    required this.height,
    this.mealModel,
  });
  final double width;
  final double height;
  final MealModel? mealModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(9),
          child: CustomCachedImage(
            imagePath: mealModel?.image ?? "",
            width: width,
            height: height,
          ),
        ),
        if (mealModel?.isTrending ?? true)
          Positioned.directional(
            textDirection: TextDirection.rtl,
            end: 4,
            top: 5,
            child: CustomContainer(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
              backGroundColor: AppColors.black.withValues(alpha: 0.4),
              border: Border.all(
                color: AppColors.white.withValues(alpha: 0.4),
                width: 0.5,
              ),
              child: Text(
                "Trending",
                style: CustomAppFontStyle.medium10(context),
              ),
            ),
          ),
        Align(
          alignment: AlignmentDirectional.bottomCenter,
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(9),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              blendMode: BlendMode.srcOver,
              child: CustomContainer(
                height: 45,
                borderRaduis: 0,
                gradientColors: AppGradient.productGradient,
              ),
            ),
          ),
        ),
        Positioned.directional(
          bottom: 10,
          textDirection: TextDirection.ltr,
          end: 0,
          start: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              spacing: 8,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Hero(
                    tag: mealModel?.name ?? "",
                    child: Material(
                      type: MaterialType.transparency,
                      child: Text(
                        mealModel?.name ?? "",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: CustomAppFontStyle.medium10(context),
                      ),
                    ),
                  ),
                ),

                CustomLiquidContainer(
                  raduis: 15,
                  child: Center(
                    child: Text(
                      "${mealModel?.price?.formatMoney() ?? 0.0}\n JOD",
                      textAlign: TextAlign.center,
                      style: CustomAppFontStyle.medium10(
                        context,
                      ).copyWith(color: AppColors.white, fontSize: 7),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
