import 'package:flutter/material.dart';

import '../../core/utils/theme/app_colors.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    this.backGroundColor,
    this.padding,
    this.borderRaduis,
    this.child,
    this.enableShadow = false,
    this.gradientColors,
  });

  final Color? backGroundColor;
  final EdgeInsetsGeometry? padding;
  final double? borderRaduis;
  final Widget? child;
  final bool enableShadow;
  final Gradient? gradientColors;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(12),
      decoration: BoxDecoration(
        boxShadow: enableShadow
            ? [
                BoxShadow(
                  color: AppColors.black.withValues(alpha: .1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,

        borderRadius: BorderRadius.all(Radius.circular(borderRaduis ?? 12)),
        gradient: gradientColors,
        color: gradientColors == null
            ? (backGroundColor ?? AppColors.white)
            : null,
      ),
      child: child,
    );
  }
}
