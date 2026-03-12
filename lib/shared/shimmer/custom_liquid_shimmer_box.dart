import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:oman_resturant/core/utils/theme/app_colors.dart';

class LiquidShimmerBox extends StatelessWidget {
  const LiquidShimmerBox({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = 8,
  });

  final double width;
  final double height;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: AppColors.white.withValues(alpha: 0.08),
            border: Border.all(
              color: AppColors.white.withValues(alpha: 0.12),
              width: 0.5,
            ),
          ),
        ),
      ),
    );
  }
}
