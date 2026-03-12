import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:oman_resturant/core/enums/request_enums.dart';
import 'package:oman_resturant/core/routing/routes.dart';
import 'package:oman_resturant/core/utils/extensions/sliver_to_widget.dart';
import 'package:oman_resturant/core/utils/theme/app_colors.dart';
import 'package:oman_resturant/core/utils/theme/custom_app_font_styles.dart';
import 'package:oman_resturant/features/app_layout/presentation/cubit/app_layout_cubit.dart';
import 'package:oman_resturant/features/meal/data/pass_param/meal_details_pass_param.dart';
import 'package:oman_resturant/features/meal/presentation/widgets/custom_meal_card.dart';
import 'package:oman_resturant/shared/shimmer/app_layout_shimmer/menu_shimmer_grid.dart';
import 'package:oman_resturant/shared/widgets/error_page.dart';

class FoodMenuGrid extends StatelessWidget {
  const FoodMenuGrid({super.key, required this.layoutCubit});

  final AppLayoutCubit layoutCubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppLayoutCubit, AppLayoutState>(
      buildWhen: (previous, current) =>
          previous.foodMenuRequestState != current.foodMenuRequestState,
      builder: (context, state) {
        if (state.foodMenuRequestState == RequestStatesEnums.loading) {
          return MenuShimmerGrid();
        } else if (state.foodMenuRequestState == RequestStatesEnums.error) {
          return ErrorPage(
            errorMessage: state.errMessage,
            onPressed: () {
              layoutCubit.getMenu();
            },
          ).toSliver();
        } else if (state.foodMenuRequestState == RequestStatesEnums.empty) {
          return SizedBox.shrink().toSliver();
        }
        return SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          sliver: SliverMainAxisGroup(
            slivers: [
              Text(
                "Food Menu",
                style: CustomAppFontStyle.bold11(
                  context,
                ).copyWith(color: AppColors.white.withValues(alpha: 0.81)),
              ).toSliver(),
              const SizedBox(height: 8).toSliver(),
              SliverMasonryGrid.count(
                crossAxisCount: 2,
                mainAxisSpacing: 6,
                crossAxisSpacing: 7,

                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      context.push(
                        AppRouter.mealDetails,
                        extra: MealDetailsPassParam(
                          id: state.meals[index].id ?? "",
                          model: state.meals[index],
                        ),
                      );
                    },
                    child: CustomMealCard(
                      mealModel: state.meals[index],
                      height: (index % 4 == 0 || index % 4 == 3) ? 120 : 170,
                      width: double.infinity,
                    ),
                  );
                },
                childCount: state.meals.length,
              ),
            ],
          ),
        );
      },
    );
  }
}
