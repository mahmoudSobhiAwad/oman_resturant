import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:oman_resturant/core/utils/extensions/sliver_to_widget.dart';
import 'package:oman_resturant/shared/shimmer/custom_liquid_shimmer_box.dart';
import 'package:oman_resturant/shared/shimmer/meal_shimmer_card.dart';

class MenuShimmerGrid extends StatelessWidget {
  const MenuShimmerGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverMainAxisGroup(
        slivers: [
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: LiquidShimmerBox(width: 40, height: 20),
          ).toSliver(),

          const SizedBox(height: 8).toSliver(),
          SliverMasonryGrid.count(
            crossAxisCount: 2,
            mainAxisSpacing: 6,
            crossAxisSpacing: 7,

            itemBuilder: (context, index) {
              final isShort = index % 4 == 0 || index % 4 == 3;
              return CustomMealCardShimmer(
                height: isShort ? 120 : 170,
                width: double.infinity,
              );
            },
            childCount: 8,
          ),
        ],
      ),
    );
  }
}
