import 'package:app_core/core/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../shared/widgets/custom_list_tile.dart';

class ShimmerHistoryItem extends StatelessWidget {
  const ShimmerHistoryItem({super.key});

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
            color: Colors.grey,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      titleInstead: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                height: 14,
                width: double.infinity,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(width: 24, height: 24, color: Colors.grey),
          ),
        ],
      ),
      subTitleInstead: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 6,
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    height: 12,
                    width: double.infinity,
                    color: Colors.grey,
                  ),
                ),
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(height: 12, width: 100, color: Colors.grey),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(height: 20, width: 60, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
