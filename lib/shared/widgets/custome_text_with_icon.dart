import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/utils/theme/app_colors.dart';
import '../../core/utils/theme/custom_app_font_styles.dart';

class CustomTextWithIconInCheckOut extends StatelessWidget {
  const CustomTextWithIconInCheckOut({
    super.key,
    required this.text,
    required this.iconPath,
    this.iconColor,
    this.iconSize,
    this.textStyle,
    this.lastWidget,
  });
  final String text;
  final String iconPath;
  final Color? iconColor;
  final TextStyle? textStyle;
  final double? iconSize;
  final Widget? lastWidget;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 4,
      children: [
        SvgPicture.asset(
          iconPath,
          width: iconSize,
          height: iconSize,
          colorFilter: ColorFilter.mode(
            iconColor ?? AppColors.gray88,
            BlendMode.srcIn,
          ),
        ),
        Text(
          text,
          style:
              textStyle ??
              CustomAppFontStyle.regular12(
                context,
              ).copyWith(color: AppColors.primary),
        ),
        if (lastWidget != null) lastWidget!,
      ],
    );
  }
}
