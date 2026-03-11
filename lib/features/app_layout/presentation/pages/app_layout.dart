import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:task_app/core/animation/fade_transition_animation.dart';
import 'package:task_app/core/animation/scale_transition_animation.dart';
import 'package:task_app/core/routing/routes.dart';
import 'package:task_app/core/utils/extensions/sliver_to_widget.dart';
import 'package:task_app/core/utils/theme/app_colors.dart';
import 'package:task_app/core/utils/theme/app_icons.dart';
import 'package:task_app/core/utils/theme/app_images.dart';
import 'package:task_app/core/utils/theme/custom_app_font_styles.dart';
import 'package:task_app/features/app_layout/presentation/widgets/atmosphere_slider.dart';
import 'package:task_app/features/app_layout/presentation/widgets/custom_meal_card.dart';
import 'package:task_app/shared/widgets/custom_asset_image.dart';
import 'package:task_app/shared/widgets/custom_liquid_button.dart';
import 'package:task_app/shared/widgets/custom_shader_text.dart';
import 'package:task_app/shared/widgets/custom_sliver_app_bar.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(
            image: CustomAssetImage(
              path: AppImages.layoutCover,
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
                          style: CustomAppFontStyle.bold10.copyWith(
                            color: AppColors.white.withValues(alpha: 0.80),
                          ),
                        ),
                        const CustomShaderText(
                          title: "CEANO",
                          fontStyle: CustomAppFontStyle.bold22,
                        ),
                      ],
                    ),
                  ),
                  FadeTransitionAnimation(
                    duration: const Duration(milliseconds: 500),
                    child: Text(
                      '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ''',
                      style: CustomAppFontStyle.medium12.copyWith(
                        color: AppColors.white.withValues(alpha: 0.7),
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16).toSliver(),
          const AtompsphereSlider().toSliver(),
          const SizedBox(height: 16).toSliver(),

          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverMainAxisGroup(
              slivers: [
                Text(
                  "Food Menu",
                  style: CustomAppFontStyle.bold11.copyWith(
                    color: AppColors.white.withValues(alpha: 0.81),
                  ),
                ).toSliver(),
                const SizedBox(height: 8).toSliver(),
                SliverMasonryGrid.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 6,
                  crossAxisSpacing: 7,

                  itemBuilder: (context, index) {
                    final isShort = index % 4 == 0 || index % 4 == 3;
                    return GestureDetector(
                      onTap: () {
                        context.push(AppRouter.mealDetails);
                      },
                      child: CustomMealCard(
                        height: isShort ? 120 : 170,
                        width: 200,
                        shadowHeight: isShort ? 50 : 72,
                        isTrending: index % 2 == 0,
                      ),
                    );
                  },
                  childCount: 8,
                ),
              ],
            ),
          ),
          const SizedBox(height: kBottomNavigationBarHeight).toSliver(),
        ],
      ),
    );
  }
}
