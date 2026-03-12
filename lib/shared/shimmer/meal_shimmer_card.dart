import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:oman_resturant/core/utils/theme/app_gradient.dart';
import 'package:oman_resturant/shared/shimmer/custom_liquid_shimmer_box.dart';
import 'package:oman_resturant/shared/widgets/custom_container.dart';

class CustomMealCardShimmer extends StatelessWidget {
  const CustomMealCardShimmer({
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
        LiquidShimmerBox(width: width, height: height, borderRadius: 9),

        if (isTrending)
          Positioned.directional(
            textDirection: TextDirection.rtl,
            end: 4,
            top: 5,
            child: LiquidShimmerBox(width: 55, height: 22, borderRadius: 6),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LiquidShimmerBox(
                        width: width * 0.6,
                        height: 8,
                        borderRadius: 4,
                      ),
                      const SizedBox(height: 5),
                      LiquidShimmerBox(
                        width: width * 0.4,
                        height: 8,
                        borderRadius: 4,
                      ),
                    ],
                  ),
                ),

                LiquidShimmerBox(width: 30, height: 30, borderRadius: 15),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
