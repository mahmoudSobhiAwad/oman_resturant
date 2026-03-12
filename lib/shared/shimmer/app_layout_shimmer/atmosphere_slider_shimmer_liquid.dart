import 'package:flutter/material.dart';
import 'package:oman_resturant/shared/shimmer/custom_liquid_shimmer_box.dart';

class AtmosphereSliderShimmerLiquid extends StatelessWidget {
  const AtmosphereSliderShimmerLiquid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        spacing: 15,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LiquidShimmerBox(width: 90, height: 11, borderRadius: 4),
          SizedBox(
            height: 240,
            child: PageView.builder(
              itemCount: 4,
              padEnds: false,
              controller: PageController(viewportFraction: 0.9),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsetsDirectional.only(end: 8.0),
                  child: LiquidShimmerBox(
                    width: double.infinity,
                    height: 240,
                    borderRadius: 8,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
