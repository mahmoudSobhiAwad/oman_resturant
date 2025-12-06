import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/utils/theme/app_colors.dart';

class ReviewShimmerItem extends StatelessWidget {
  const ReviewShimmerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.grayF0,
      highlightColor: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(
                    color: AppColors.grayD9,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Container(width: 80, height: 12, color: AppColors.grayF0),
                const Spacer(),
                Container(width: 100, height: 12, color: AppColors.grayF0),
              ],
            ),
            const SizedBox(height: 8),
            Container(width: 60, height: 12, color: AppColors.grayF0),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              height: 12,
              color: AppColors.grayF0,
            ),
            const SizedBox(height: 6),
            Container(
              width: double.infinity,
              height: 12,
              color: AppColors.grayF0,
            ),
          ],
        ),
      ),
    );
  }
}
