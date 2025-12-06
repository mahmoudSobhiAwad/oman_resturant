import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../shared/widgets/custom_list_tile.dart';
import '../../utils/theme/app_colors.dart';

class MyPetAppointmentShimmerCard extends StatelessWidget {
  const MyPetAppointmentShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.grayE0,
      highlightColor: AppColors.grayF5,
      child: CustomListTile(
        padding: const EdgeInsetsDirectional.symmetric(
          horizontal: 4,
          vertical: 4,
        ).copyWith(end: 16),
        border: Border.all(color: AppColors.grayE0, width: 1),
        backgroundColor: AppColors.white,
        leadingIconInstead: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(height: 72, width: 72, color: AppColors.grayE0),
        ),
        titleInstead: Container(
          height: 14,
          width: 120,
          color: AppColors.grayE0,
        ),
        trailing: Container(
          height: 24,
          width: 24,
          decoration: BoxDecoration(
            color: AppColors.grayE0,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
