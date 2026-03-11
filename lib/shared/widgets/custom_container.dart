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
    this.border,
    this.borderRadiusGeometry,
    this.height,
  });

  final Color? backGroundColor;
  final EdgeInsetsGeometry? padding;
  final double? borderRaduis;
  final Widget? child;
  final bool enableShadow;
  final Gradient? gradientColors;
  final BoxBorder? border;
  final double? height;
  final BorderRadiusGeometry? borderRadiusGeometry;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: padding ?? const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: border,

        boxShadow: enableShadow
            ? [
                BoxShadow(
                  color: AppColors.black.withValues(alpha: .1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,

        borderRadius:
            borderRadiusGeometry ??
            BorderRadius.all(Radius.circular(borderRaduis ?? 12)),
        gradient: gradientColors,
        color: gradientColors == null
            ? (backGroundColor ?? AppColors.white)
            : null,
      ),
      child: child,
    );
  }
}
