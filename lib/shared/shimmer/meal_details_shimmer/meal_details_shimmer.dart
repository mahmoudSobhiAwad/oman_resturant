import 'package:flutter/material.dart';
import 'package:oman_resturant/shared/shimmer/custom_liquid_shimmer_box.dart';
import 'package:oman_resturant/shared/widgets/custom_sliver_app_bar.dart';

class MealDetailsShimmer extends StatelessWidget {
  const MealDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        const CustomSliverAppBar(
          image: LiquidShimmerBox(
            width: double.infinity,
            height: 250,
            borderRadius: 0,
          ),
        ),
        SliverPadding(
          padding: const EdgeInsetsDirectional.only(
            start: 15.0,
            end: 31.0,
          ),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                const LiquidShimmerBox(width: 80, height: 12),
                const SizedBox(height: 6),
                const LiquidShimmerBox(width: 180, height: 24),
                const SizedBox(height: 6),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    LiquidShimmerBox(
                      width: double.infinity,
                      height: 14,
                    ),
                    SizedBox(height: 4),
                    LiquidShimmerBox(
                      width: double.infinity,
                      height: 14,
                    ),
                    SizedBox(height: 4),
                    LiquidShimmerBox(width: 250, height: 14),
                  ],
                ),
                const SizedBox(height: 14),
                const LiquidShimmerBox(width: 80, height: 12),
                const SizedBox(height: 9),
                Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  children: List.generate(
                    5,
                    (index) => const LiquidShimmerBox(
                      width: 80,
                      height: 35,
                      borderRadius: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
