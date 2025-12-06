import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../shared/widgets/custom_list_tile.dart';
import '../../utils/theme/app_colors.dart';

class CustomerUserAddressShimmerCard extends StatelessWidget {
  const CustomerUserAddressShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      backgroundColor: AppColors.white,
      leadingIconInstead: Shimmer.fromColors(
        baseColor: AppColors.grayF5,
        highlightColor: AppColors.gray88.withValues(alpha: 0.3),
        child: Container(
          width: 48,
          height: 48,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
        ),
      ),
      titleInstead: Shimmer.fromColors(
        baseColor: AppColors.grayF5,
        highlightColor: AppColors.gray88.withValues(alpha: 0.3),
        child: Container(
          height: 16,
          width: 100,
          color: Colors.white,
          margin: const EdgeInsets.symmetric(vertical: 4),
        ),
      ),
      subTitleInstead: Shimmer.fromColors(
        baseColor: AppColors.grayF5,
        highlightColor: AppColors.gray88.withValues(alpha: 0.3),
        child: Container(
          height: 12,
          width: 180,
          color: Colors.white,
          margin: const EdgeInsets.symmetric(vertical: 2),
        ),
      ),
      trailing: Shimmer.fromColors(
        baseColor: AppColors.grayF5,
        highlightColor: AppColors.gray88.withValues(alpha: 0.3),
        child: Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
