import 'package:app_core/core/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomOrderItemShimmer extends StatelessWidget {
  const CustomOrderItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final base = Colors.grey.shade300;
    final highlight = Colors.grey.shade200;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.gray.withValues(alpha: 0.1), // match bg
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Avatar shimmer
          Shimmer.fromColors(
            baseColor: base,
            highlightColor: highlight,
            child: Container(
              width: 48,
              height: 48,
              decoration: const BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title shimmer
                Shimmer.fromColors(
                  baseColor: base,
                  highlightColor: highlight,
                  child: Container(width: 120, height: 16, color: Colors.grey),
                ),
                const SizedBox(height: 8),

                Row(
                  children: [
                    shimmerBox(40, 14, base, highlight),
                    const SizedBox(width: 8),
                    shimmerBox(20, 14, base, highlight),
                    const SizedBox(width: 8),
                    shimmerBox(60, 14, base, highlight),
                    const Spacer(),
                    shimmerBox(80, 14, base, highlight),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget shimmerBox(double w, double h, Color base, Color highlight) {
    return Shimmer.fromColors(
      baseColor: base,
      highlightColor: highlight,
      child: Container(width: w, height: h, color: Colors.grey),
    );
  }
}
