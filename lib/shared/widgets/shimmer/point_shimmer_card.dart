import 'package:flutter/material.dart';


import 'package:shimmer/shimmer.dart';

import '../../../core/utils/theme/app_colors.dart';
import '../custom_list_tile.dart';

class PointsItemShimmer extends StatelessWidget {
  const PointsItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.grayF5,
      highlightColor: AppColors.grayD4,
      child: CustomListTile(
        crossAxisAlignment: CrossAxisAlignment.start,
        backgroundColor: AppColors.white,
        titleInstead: Container(
          width: 80,
          height: 16,
          color: Colors.white,
          margin: const EdgeInsets.symmetric(vertical: 4),
        ),
        trailing: Container(width: 60, height: 14, color: Colors.white),
        subTitleInstead: Row(
          children: [
            Container(
              width: 60,
              height: 14,
              color: Colors.white,
              margin: const EdgeInsets.only(right: 8),
            ),
            Container(width: 60, height: 14, color: Colors.white),
          ],
        ),
        leadingIconInstead: Transform.translate(
          offset: const Offset(0, 5),
          child: CircleAvatar(radius: 22, backgroundColor: Colors.white),
        ),
      ),
    );
  }
}
