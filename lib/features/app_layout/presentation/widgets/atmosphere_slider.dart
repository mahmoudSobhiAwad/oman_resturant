import 'package:flutter/material.dart';
import 'package:oman_resturant/core/animation/scale_transition_animation.dart';
import 'package:oman_resturant/core/utils/theme/custom_app_font_styles.dart';
import 'package:oman_resturant/shared/widgets/custom_cached_image.dart';

class AtompsphereSlider extends StatelessWidget {
  const AtompsphereSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 16.0),
      child: Column(
        spacing: 15,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Atmosphere", style: CustomAppFontStyle.bold11),
          SizedBox(
            height: 240,
            child: PageView.builder(
              itemCount: 4,
              padEnds: false,
              controller: PageController(viewportFraction: 0.9),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsetsDirectional.only(end: 8.0),
                  child: ScaleTransitionAnimation(
                    duration: const Duration(milliseconds: 600),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CustomCachedImage(
                        fit: BoxFit.cover,
                        fromApi: false,
                        imagePath:
                            "https://media.istockphoto.com/id/1180418289/photo/blurred-bokeh-of-the-bar-interior.jpg?s=2048x2048&w=is&k=20&c=ZMf00ZZHVhNpv_hJ9_dOUiKgZn2pCibYF7Cm06VEYbA=",
                      ),
                    ),
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
