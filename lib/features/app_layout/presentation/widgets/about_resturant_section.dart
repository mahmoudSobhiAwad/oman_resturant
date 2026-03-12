import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oman_resturant/core/animation/fade_transition_animation.dart';
import 'package:oman_resturant/core/animation/scale_transition_animation.dart';
import 'package:oman_resturant/core/enums/request_enums.dart';
import 'package:oman_resturant/core/utils/extensions/sliver_to_widget.dart';
import 'package:oman_resturant/core/utils/theme/app_colors.dart';
import 'package:oman_resturant/core/utils/theme/app_icons.dart';
import 'package:oman_resturant/core/utils/theme/custom_app_font_styles.dart';
import 'package:oman_resturant/features/app_layout/presentation/cubit/app_layout_cubit.dart';
import 'package:oman_resturant/shared/shimmer/app_layout_shimmer/about_resturant_shimmer.dart';
import 'package:oman_resturant/shared/widgets/custom_asset_image.dart';
import 'package:oman_resturant/shared/widgets/custom_cached_image.dart';
import 'package:oman_resturant/shared/widgets/custom_liquid_button.dart';
import 'package:oman_resturant/shared/widgets/custom_shader_text.dart';
import 'package:oman_resturant/shared/widgets/custom_sliver_app_bar.dart';
import 'package:oman_resturant/shared/widgets/error_page.dart';

class AboutResturantSection extends StatelessWidget {
  const AboutResturantSection({super.key, required this.layoutCubit});

  final AppLayoutCubit layoutCubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppLayoutCubit, AppLayoutState>(
      buildWhen: (previous, current) =>
          previous.resturanDetailsRequestState !=
          current.resturanDetailsRequestState,
      builder: (context, state) {
        if (state.resturanDetailsRequestState == RequestStatesEnums.loading) {
          return AboutResturantShimmer();
        } else if (state.resturanDetailsRequestState ==
            RequestStatesEnums.error) {
          return ErrorPage(
            errorMessage: state.errMessage,
            onPressed: () {
              layoutCubit.getAboutResturant();
            },
          ).toSliver();
        }
        return SliverMainAxisGroup(
          slivers: [
            CustomSliverAppBar(
              image: CustomCachedImage(
                imagePath: state.aboutModel?.imageCover ?? "",
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              leadingWidth: double.infinity,
              leading: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 4,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomLiquidContainer(
                      raduis: 24,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_back),
                      ),
                    ),
                    CustomAssetImage(
                      path: AppIcons.person,
                      width: 38,
                      height: 38,
                      color: AppColors.white,
                    ),
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
                    ScaleTransitionAnimation(
                      duration: const Duration(milliseconds: 400),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Lorem",
                            style: CustomAppFontStyle.bold10(context).copyWith(
                              color: AppColors.white.withValues(alpha: 0.80),
                            ),
                          ),
                          CustomShaderText(
                            title: "CEANO",
                            fontStyle: CustomAppFontStyle.bold22(context),
                          ),
                        ],
                      ),
                    ),
                    FadeTransitionAnimation(
                      duration: const Duration(milliseconds: 500),
                      child: Text(
                        state.aboutModel?.details ?? "",
                        style: CustomAppFontStyle.medium12(context).copyWith(
                          color: AppColors.white.withValues(alpha: 0.7),
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
