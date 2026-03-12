import 'package:oman_resturant/core/utils/theme/app_colors.dart';
import 'package:oman_resturant/core/utils/theme/app_gradient.dart';

import '../../shared/widgets/custom_push_container_button.dart';
import 'package:flutter/material.dart';

import '../../core/utils/theme/custom_app_font_styles.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    super.key,
    this.errorMessage = '',
    this.height,
    this.width,
    this.onPressed,
    this.child,
    this.widget,
    this.enableAnimation = true,
    this.isRtl = true,
  });

  final String errorMessage;
  final Widget? child;
  final void Function()? onPressed;
  final bool enableAnimation;
  final bool isRtl;
  final Widget? widget;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 10,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              errorMessage.isNotEmpty ? errorMessage : "UnKnown Error",
              style: CustomAppFontStyle.regular16(context),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            if (widget != null)
              Row(
                spacing: 8,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    errorMessage.isNotEmpty ? errorMessage : "UnKnown Error",
                    style: CustomAppFontStyle.regular16(context),
                    maxLines: 2,
                  ),
                  if (widget != null) widget!,
                ],
              ),

            onPressed != null
                ? const SizedBox(height: 16)
                : const SizedBox.shrink(),
            if (onPressed != null)
              CustomPushButton(
                boxBorder: Border.all(
                  color: AppColors.white.withValues(alpha: 0.2),
                ),
                height: 52,
                backGradient: AppGradient.primaryGradient,
                radius: 26,
                onTap: onPressed ?? () {},
                child: Center(
                  child: Text(
                    "Try Again",
                    style: CustomAppFontStyle.bold12(
                      context,
                    ).copyWith(color: AppColors.black),
                  ),
                ),
              ),
            child ?? const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
