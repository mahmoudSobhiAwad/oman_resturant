import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/utils/theme/app_colors.dart';
import '../custom_container.dart';

class LargeServiceCardShimmer extends StatelessWidget {
  const LargeServiceCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      enableShadow: true,
      backGroundColor: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          // Image shimmer
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
            ),
          ),
          // Title shimmer
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              height: 16,
              width: 180,
              color: Colors.grey.shade300,
            ),
          ),
          // Subtitle shimmer
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              height: 14,
              width: 120,
              color: Colors.grey.shade300,
            ),
          ),
        ],
      ),
    );
  }
}
