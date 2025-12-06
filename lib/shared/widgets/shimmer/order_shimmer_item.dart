import 'package:flutter/material.dart';

import '../../../core/utils/theme/app_colors.dart';
import '../custom_container.dart';
import '../custom_shimmer_container.dart';

class OrderShimmerCard extends StatelessWidget {
  const OrderShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      borderRaduis: 14,
      child: Column(
        spacing: 8,
        children: [
          // Date and Status Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Date shimmer
              CustomShimmerContainer(height: 14, width: 120, borderRadius: 4),
              // Status badge shimmer
              CustomShimmerContainer(height: 24, width: 80, borderRadius: 4),
            ],
          ),
          // Inner container with order details
          CustomContainer(
            borderRaduis: 8,
            backGroundColor: AppColors.grayFA,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
                // Order number shimmer
                CustomShimmerContainer(height: 16, width: 100, borderRadius: 4),
                // Price, products count, and points row
                Row(
                  spacing: 8,
                  children: [
                    // Price shimmer
                    CustomShimmerContainer(
                      height: 14,
                      width: 80,
                      borderRadius: 4,
                    ),
                    const CircleAvatar(
                      radius: 4,
                      backgroundColor: AppColors.grayD1,
                    ),
                    // Products count shimmer
                    CustomShimmerContainer(
                      height: 14,
                      width: 60,
                      borderRadius: 4,
                    ),
                    const CircleAvatar(
                      radius: 4,
                      backgroundColor: AppColors.grayD1,
                    ),
                    // Points shimmer
                    CustomShimmerContainer(
                      height: 14,
                      width: 50,
                      borderRadius: 4,
                    ),
                  ],
                ),
                const SizedBox(),
                // Product images row
                Row(
                  spacing: 4,
                  children: [
                    ...List.generate(3, (index) {
                      return CustomShimmerContainer(
                        height: 32,
                        width: 32,
                        borderRadius: 4,
                      );
                    }),
                  ],
                ),
                const SizedBox(height: 8),
                // Action buttons row
                Row(
                  spacing: 8,
                  children: [
                    // Order details button shimmer
                    Expanded(
                      child: CustomShimmerContainer(
                        height: 40,
                        width: double.infinity,
                        borderRadius: 4,
                      ),
                    ),
                    // Cancel order button shimmer
                    Expanded(
                      child: CustomShimmerContainer(
                        height: 40,
                        width: double.infinity,
                        borderRadius: 4,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
