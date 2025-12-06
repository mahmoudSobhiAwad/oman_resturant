import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../shared/widgets/custom_container.dart';
import '../../utils/theme/app_colors.dart';

class FaqShimmerItem extends StatelessWidget {
  const FaqShimmerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      backGroundColor: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
        child: Shimmer.fromColors(
          baseColor: AppColors.gray8C.withValues(alpha: 0.2),
          highlightColor: AppColors.gray8C.withValues(alpha: 0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 18,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 14,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              const SizedBox(height: 6),
              Container(
                height: 14,
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
