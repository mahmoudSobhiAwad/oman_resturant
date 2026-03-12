import '../../core/utils/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/utils/theme/custom_app_font_styles.dart';

class CustomPushButton extends StatelessWidget {
  const CustomPushButton({
    super.key,
    this.margin,
    this.padding,
    this.child,
    this.onTap,
    this.width,
    this.height,
    this.backgroundColor,
    this.border,
    this.isLoading = false,
    this.overlayColor,
    this.shadowColor,
    this.surfaceTintColor,
    this.progressColor,
    this.onLongPressed,
    this.radius,
    this.label,
    this.minSize,
    this.boxBorder,
    this.backGradient,
  });

  final EdgeInsetsGeometry? margin;
  final EdgeInsetsDirectional? padding;
  final Widget? child;
  final Color? backgroundColor;
  final void Function()? onTap;
  final BorderSide? border;
  final BoxBorder? boxBorder;
  final double? height;
  final bool isLoading;
  final Color? overlayColor;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final Color? progressColor;
  final double? radius;
  final double? width;
  final String? label;
  final void Function()? onLongPressed;
  final Size? minSize;
  final Gradient? backGradient;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: SizedBox(
        width: width,
        height: height,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius ?? 12),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: backgroundColor,
              gradient: backgroundColor == null ? backGradient : null,
              borderRadius: BorderRadius.circular(radius ?? 12),
              border: boxBorder,
            ),
            child: ElevatedButton(
              onLongPress: isLoading ? null : onLongPressed,
              onPressed: isLoading ? null : onTap,
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: backgroundColor ?? Colors.transparent,
                disabledBackgroundColor: Colors.transparent,
                surfaceTintColor: surfaceTintColor ?? Colors.transparent,
                overlayColor: overlayColor ?? Colors.transparent,
                minimumSize: minSize,
                padding:
                    padding ??
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius ?? 12),
                  side: border ?? BorderSide.none,
                ),
                shadowColor: shadowColor ?? Colors.transparent,
              ),
              child: isLoading
                  ? Center(
                      child: CupertinoActivityIndicator(
                        radius: 12,
                        color: progressColor ?? AppColors.white,
                      ),
                    )
                  : label != null
                  ? Text(label!, style: CustomAppFontStyle.regular14(context))
                  : child,
            ),
          ),
        ),
      ),
    );
  }
}
