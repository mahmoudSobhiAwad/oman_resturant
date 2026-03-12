import 'package:oman_resturant/shared/widgets/custom_push_container_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/animation/scale_transition_animation.dart';
import '../../core/utils/theme/app_colors.dart';
import '../../core/utils/theme/custom_app_font_styles.dart';

class CustomEmptyWidget extends StatelessWidget {
  const CustomEmptyWidget({
    super.key,
    this.title,
    this.imagePath = "",
    this.isAnimated = false,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.height,
    this.width,
    this.enableButton = false,
    this.onButtonPressed,
    this.buttonTitle,
    this.textStyle,
    this.subtitle,
  });

  final String? title;
  final String? buttonTitle;
  final String imagePath;
  final bool isAnimated;
  final MainAxisAlignment mainAxisAlignment;
  final double? height;
  final double? width;
  final bool enableButton;
  final void Function()? onButtonPressed;
  final TextStyle? textStyle;
  final Widget? subtitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: mainAxisAlignment,
        children: [
          SizedBox(
            height: 200,
            child: ScaleTransitionAnimation(
              duration: const Duration(milliseconds: 750),
              child: SvgPicture.asset(imagePath),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            title ?? "",
            style: textStyle ?? CustomAppFontStyle.regular16(context),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          if (subtitle != null) subtitle!,

          const SizedBox(height: 24),
          if (enableButton)
            CustomPushButton(
              height: 50,
              onTap: () {
                if (onButtonPressed != null) {
                  onButtonPressed!();
                }
              },
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Center(
                child: Text(
                  buttonTitle ?? "",
                  style: CustomAppFontStyle.semiBold16(
                    context,
                  ).copyWith(color: AppColors.white),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
