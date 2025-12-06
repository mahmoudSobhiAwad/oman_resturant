import '../../core/utils/theme/app_colors.dart';
import '../../core/utils/theme/app_icons.dart';
import '../../core/utils/theme/custom_app_font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomRateIcon extends StatelessWidget {
  const CustomRateIcon({
    super.key,
    this.enableShadow = true,
    this.fontSize,
    this.starSize,
    this.starRating,
  });
  final bool enableShadow;
  final double? fontSize;
  final num? starRating;
  final double? starSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        boxShadow: enableShadow
            ? [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
        borderRadius: enableShadow ? BorderRadius.circular(80) : null,
        color: enableShadow ? AppColors.white : null,
      ),
      child: Row(
        spacing: 3,
        children: [
          SvgPicture.asset(
            AppIcons.filledStar,
            height: starSize,
            width: starSize,
          ),
          Text(
            starRating != 0
                ? "${starRating?.toStringAsFixed(1) ?? 5}"
                : "لم يقيم بعد",
            style: CustomAppFontStyle.medium14.copyWith(
              color: AppColors.orangeB578,
              fontSize: fontSize,
            ),
          ),
        ],
      ),
    );
  }
}
