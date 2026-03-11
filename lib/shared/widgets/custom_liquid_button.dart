import 'dart:ui';

import 'package:task_app/core/utils/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';

class CustomLiquidContainer extends StatelessWidget {
  const CustomLiquidContainer({
    super.key,
    this.raduis = 18,
    this.padding,
    this.child,
    this.backGround,
    this.borderColor,
  });
  final double raduis;
  final EdgeInsetsDirectional? padding;
  final Widget? child;
  final Color? backGround;
  final Color? borderColor;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(raduis),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: Container(
          padding: padding,
          width: raduis * 2,
          height: raduis * 2,
          decoration: BoxDecoration(
            color: backGround ?? AppColors.black.withValues(alpha: 0.2),

            border: Border.all(
              color: borderColor ?? AppColors.black.withValues(alpha: 0.2),
              width: 1.25,
            ),
            shape: BoxShape.circle,
          ),
          child: child,
        ),
      ),
    );
  }
}
