import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oman_resturant/core/animation/scale_transition_animation.dart';
import 'package:oman_resturant/core/enums/request_enums.dart';
import 'package:oman_resturant/core/utils/theme/custom_app_font_styles.dart';
import 'package:oman_resturant/features/app_layout/presentation/cubit/app_layout_cubit.dart';
import 'package:oman_resturant/shared/shimmer/app_layout_shimmer/atmosphere_slider_shimmer_liquid.dart';
import 'package:oman_resturant/shared/widgets/custom_cached_image.dart';
import 'package:oman_resturant/shared/widgets/error_page.dart';

class AtompsphereSlider extends StatelessWidget {
  const AtompsphereSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppLayoutCubit, AppLayoutState>(
      buildWhen: (prev, curr) =>
          curr.atmosphereRequestState != prev.atmosphereRequestState,
      builder: (context, state) {
        if (state.atmosphereRequestState == RequestStatesEnums.loading) {
          return AtmosphereSliderShimmerLiquid();
        } else if (state.atmosphereRequestState == RequestStatesEnums.error) {
          return ErrorPage(
            errorMessage: state.errMessage,
            onPressed: () {
              context.read<AppLayoutCubit>().getAtmosphers();
            },
          );
        } else if (state.atmosphereRequestState == RequestStatesEnums.empty) {
          return SizedBox.shrink();
        }
        return Padding(
          padding: const EdgeInsetsDirectional.only(start: 16.0),
          child: Column(
            spacing: 15,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Atmosphere", style: CustomAppFontStyle.bold11(context)),
              SizedBox(
                height: 240,
                child: PageView.builder(
                  itemCount: state.sliders.length,
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
                            imagePath: state.sliders[index].imageUrl ?? "",
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
      },
    );
  }
}
