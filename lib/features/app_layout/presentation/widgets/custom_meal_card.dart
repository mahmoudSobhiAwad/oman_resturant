import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:oman_resturant/core/utils/theme/app_colors.dart';
import 'package:oman_resturant/core/utils/theme/app_gradient.dart';
import 'package:oman_resturant/core/utils/theme/custom_app_font_styles.dart';
import 'package:oman_resturant/shared/widgets/custom_cached_image.dart';
import 'package:oman_resturant/shared/widgets/custom_container.dart';
import 'package:oman_resturant/shared/widgets/custom_liquid_button.dart';

class CustomMealCard extends StatelessWidget {
  const CustomMealCard({
    super.key,
    required this.width,
    required this.height,
    this.isTrending = false,
  });
  final double width;
  final double height;
  final bool isTrending;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(9),
          child: CustomCachedImage(
            fromApi: false,
            imagePath:
                'https://media.istockphoto.com/id/530417618/photo/baked-salmon-garnished-with-asparagus-and-tomatoes-with-herbs.jpg?s=2048x2048&w=is&k=20&c=2Fj8TIkqg89bKxnAVFFsR5NwHSDtayzlvHZCDlHIxbY=',
            width: width,
            height: height,
          ),
        ),
        if (isTrending)
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
              child: const Text("Trending", style: CustomAppFontStyle.medium10),
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
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(
                  child: const Text(
                    "25 Piece Sushi Boat with Three SIdes",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: CustomAppFontStyle.medium10,
                  ),
                ),

                CustomLiquidContainer(
                  raduis: 15,
                  child: Center(
                    child: Text(
                      "49.95\n JOD",
                      textAlign: TextAlign.center,
                      style: CustomAppFontStyle.medium10.copyWith(
                        color: AppColors.white,
                        fontSize: 7,
                      ),
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
