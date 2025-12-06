import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/utils/theme/app_colors.dart';
import '../custom_list_tile.dart';

class HistoryCardItemShimmer extends StatelessWidget {
  const HistoryCardItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      backgroundColor: AppColors.white,
      enableShadow: true,
      padding: const EdgeInsets.all(8.0),
      leadingIconInstead: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      titleInstead: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Title shimmer
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              height: 14,
              width: 140,
              color: Colors.grey.shade300,
            ),
          ),
          // Menu icon shimmer
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              width: 24,
              height: 24,
              color: Colors.grey.shade300,
            ),
          ),
        ],
      ),
      subTitleInstead: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Subtitle shimmer
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    height: 12,
                    width: 160,
                    color: Colors.grey.shade300,
                  ),
                ),
                const SizedBox(height: 6),
                // Date shimmer
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    height: 12,
                    width: 100,
                    color: Colors.grey.shade300,
                  ),
                ),
              ],
            ),
          ),
          // Status button shimmer
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              height: 28,
              width: 80,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
