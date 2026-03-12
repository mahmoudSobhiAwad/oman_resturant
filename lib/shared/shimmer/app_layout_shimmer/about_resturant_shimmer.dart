import 'package:flutter/material.dart';
import 'package:oman_resturant/shared/shimmer/custom_liquid_shimmer_box.dart';
import 'package:oman_resturant/shared/widgets/custom_sliver_app_bar.dart';

class AboutResturantShimmer extends StatelessWidget {
  const AboutResturantShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        CustomSliverAppBar(
          image: LiquidShimmerBox(
            width: double.infinity,
            height: 220,
            borderRadius: 0,
          ),
          leadingWidth: double.infinity,
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LiquidShimmerBox(width: 48, height: 48, borderRadius: 24),
                LiquidShimmerBox(width: 38, height: 38, borderRadius: 19),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverToBoxAdapter(
            child: Column(
              spacing: 4,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LiquidShimmerBox(width: 60, height: 10, borderRadius: 4),
                    const SizedBox(height: 6),
                    LiquidShimmerBox(width: 120, height: 22, borderRadius: 6),
                  ],
                ),
                const SizedBox(height: 4),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LiquidShimmerBox(
                      width: double.infinity,
                      height: 10,
                      borderRadius: 4,
                    ),
                    const SizedBox(height: 5),
                    LiquidShimmerBox(
                      width: double.infinity,
                      height: 10,
                      borderRadius: 4,
                    ),
                    const SizedBox(height: 5),
                    LiquidShimmerBox(
                      width: double.infinity,
                      height: 10,
                      borderRadius: 4,
                    ),
                    const SizedBox(height: 5),
                    LiquidShimmerBox(width: 180, height: 10, borderRadius: 4),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
