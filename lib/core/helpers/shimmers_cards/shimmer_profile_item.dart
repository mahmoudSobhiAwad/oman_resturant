import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'package:flutter_svg/svg.dart';

import '../../utils/theme/app_colors.dart';
import '../../utils/theme/app_icons.dart';

class CustomFavouriteItemLoading extends StatelessWidget {
  const CustomFavouriteItemLoading({super.key});

  Widget shimmerBox({
    double width = 60,
    double height = 12,
    double radius = 6,
  }) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[50]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppColors.grayD9,
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: ColoredBox(
        color: AppColors.grayF5,
        child: ListTile(
          contentPadding: const EdgeInsets.all(8),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: shimmerBox(width: 50, height: 50, radius: 25),
          ),
          title: shimmerBox(width: 120, height: 14),
          subtitle: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // star placeholder
              shimmerBox(width: 14, height: 14, radius: 4),
              const SizedBox(width: 6),
              shimmerBox(width: 30, height: 12),
              const SizedBox(width: 8),
              SizedBox(
                height: 16,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(1),
                  child: const VerticalDivider(
                    thickness: 1,
                    color: AppColors.grayD9,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              shimmerBox(width: 50, height: 12),
            ],
          ),
          trailing: SvgPicture.asset(
            AppIcons.arrowBack,
            colorFilter: const ColorFilter.mode(
              AppColors.grayD9,
              BlendMode.srcIn,
            ),
          ), // arrow icon in grey
        ),
      ),
    );
  }
}
