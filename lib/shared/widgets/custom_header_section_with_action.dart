import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/utils/theme/app_colors.dart';
import '../../core/utils/theme/custom_app_font_styles.dart';

class SectionHeaderWithAction extends StatelessWidget {
  const SectionHeaderWithAction({
    super.key,
    required this.title,
    this.onPressed,
    this.showButton = true,
  });

  final String title;
  final void Function()? onPressed;
  final bool showButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: CustomAppFontStyle.medium18.copyWith(color: AppColors.primary),
        ),
        if (showButton)
          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.all(4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              backgroundColor: AppColors.grayF2,
            ),
            onPressed: onPressed,
            child: Row(
              spacing: 4,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "عرض الكل",
                  style: CustomAppFontStyle.medium14.copyWith(
                    // height: 1.5,
                    color: AppColors.primary,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class IndividualShimmerRow extends StatelessWidget {
  const IndividualShimmerRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            width: 100,
            height: 20,
          ),
        ),
        const Spacer(),
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            width: 100,
            height: 20,
          ),
        ),
      ],
    );
  }
}
