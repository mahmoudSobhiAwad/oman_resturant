import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oman_resturant/core/animation/fade_transition_animation.dart';
import 'package:oman_resturant/core/animation/scale_transition_animation.dart';
import 'package:oman_resturant/core/enums/request_enums.dart';
import 'package:oman_resturant/core/utils/theme/app_colors.dart';
import 'package:oman_resturant/core/utils/theme/app_images.dart';
import 'package:oman_resturant/core/utils/theme/custom_app_font_styles.dart';
import 'package:oman_resturant/features/meal/presentation/manager/meal_details_cubit.dart';
import 'package:oman_resturant/features/meal/presentation/widgets/custom_meal_preparation_item.dart';
import 'package:oman_resturant/shared/shimmer/meal_details_shimmer/meal_details_shimmer.dart';
import 'package:oman_resturant/shared/widgets/custom_asset_image.dart';
import 'package:oman_resturant/shared/widgets/custom_cached_image.dart';
import 'package:oman_resturant/shared/widgets/custom_shader_text.dart';
import 'package:oman_resturant/shared/widgets/custom_sliver_app_bar.dart';
import 'package:oman_resturant/shared/widgets/error_page.dart';
import 'package:oman_resturant/shared/widgets/expandable_text.dart';

class MealDetailsBody extends StatelessWidget {
  const MealDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealDetailsCubit, MealDetailsState>(
      builder: (context, state) {
        if (state.mealDetailsRequestState == RequestStatesEnums.loading) {
          return MealDetailsShimmer();
        } else if (state.mealDetailsRequestState == RequestStatesEnums.error) {
          return SingleChildScrollView(
            child: ErrorPage(
              widget: CustomAssetImage(
                path: AppImages.errorImage,
                width: 350,
                height: 350,
              ),
              errorMessage: state.errMessage,
              onPressed: () {
                context.read<MealDetailsCubit>().getMealById();
              },
            ),
          );
        }
        return RefreshIndicator(
          backgroundColor: AppColors.beigeDark,
          color: AppColors.black,
          onRefresh: () async {
            if (state.id != null) {
              await context.read<MealDetailsCubit>().getMealById();
            }
          },
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              CustomSliverAppBar(
                image: CustomCachedImage(
                  imagePath: state.mealModel?.image ?? '',
                  fromApi: false,
                  width: double.infinity,
                  height: 250,
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
                      Text(
                        state.mealModel?.isMainDish == true
                            ? "Main Course"
                            : "Dish",
                        style: CustomAppFontStyle.bold10(context).copyWith(
                          color: AppColors.white.withValues(alpha: 0.6),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Hero(
                        tag: state.mealModel?.name ?? "Unknown",
                        child: Material(
                          type: MaterialType.transparency,
                          child: CustomShaderText(
                            title: state.mealModel?.name ?? "Unknown",
                            fontStyle: CustomAppFontStyle.bold20(
                              context,
                            ).copyWith(color: AppColors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      FadeTransitionAnimation(
                        duration: Duration(milliseconds: 300),
                        child: ExpandableText(
                          text: state.mealModel?.description ?? "",
                          maxLines: 6,
                          style: CustomAppFontStyle.medium14(
                            context,
                          ).copyWith(color: AppColors.white),
                        ),
                      ),
                      const SizedBox(height: 14),
                      Text(
                        "Preparation",
                        style: CustomAppFontStyle.bold10(context).copyWith(
                          color: AppColors.white.withValues(alpha: 0.6),
                        ),
                      ),
                      const SizedBox(height: 9),
                      Wrap(
                        spacing: 4,
                        runSpacing: 4,
                        children:
                            state.mealModel?.preparation
                                .map(
                                  (prep) => ScaleTransitionAnimation(
                                    duration: const Duration(milliseconds: 500),
                                    child: CustomMealPreparationItem(
                                      title: prep.name ?? "Unknown",
                                    ),
                                  ),
                                )
                                .toList() ??
                            [],
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
