import 'dart:ui';

import 'package:app_core/core/animation/fade_transition_animation.dart';
import 'package:app_core/core/animation/scale_transition_animation.dart';
import 'package:app_core/core/animation/slide_transition_animation.dart';
import 'package:app_core/core/routing/routes.dart';
import 'package:app_core/core/utils/extensions/sliver_to_widget.dart';
import 'package:app_core/core/utils/theme/app_colors.dart';
import 'package:app_core/core/utils/theme/app_gradient.dart';
import 'package:app_core/core/utils/theme/app_icons.dart';
import 'package:app_core/core/utils/theme/app_images.dart';
import 'package:app_core/core/utils/theme/custom_app_font_styles.dart';
import 'package:app_core/shared/widgets/custom_asset_image.dart';
import 'package:app_core/shared/widgets/custom_cached_image.dart';
import 'package:app_core/shared/widgets/custom_container.dart';
import 'package:app_core/shared/widgets/custom_liquid_button.dart';
import 'package:app_core/shared/widgets/custom_shader_text.dart';
import 'package:app_core/shared/widgets/custom_sliver_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';

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
                      icon: Icon(Icons.arrow_back),
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
            padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
            sliver: SliverToBoxAdapter(
              child: Column(
                spacing: 4,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ScaleTransitionAnimation(
                    duration: Duration(milliseconds: 400),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Lorem",
                          style: CustomAppFontStyle.bold10.copyWith(
                            color: AppColors.white.withValues(alpha: 0.80),
                          ),
                        ),
                        CustomShaderText(
                          title: "CEANO",
                          fontStyle: CustomAppFontStyle.bold22,
                        ),
                      ],
                    ),
                  ),
                  FadeTransitionAnimation(
                    duration: Duration(milliseconds: 500),
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
          SizedBox(height: 16).toSliver(),
          AtompsphereSlider().toSliver(),
          SizedBox(height: 16).toSliver(),

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
                SizedBox(height: 8).toSliver(),
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
          SizedBox(height: kBottomNavigationBarHeight).toSliver(),
        ],
      ),
    );
  }
}

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

class CustomMealCard extends StatelessWidget {
  const CustomMealCard({
    super.key,
    required this.width,
    required this.height,
    this.isTrending = false,
    this.shadowHeight = 16,
  });
  final double width;
  final double height;
  final bool isTrending;
  final double shadowHeight;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(9),
          child: CustomCachedImage(
            fromApi: false,
            imagePath:
                'https://media.istockphoto.com/id/530417618/photo/baked-salmon-garnished-with-asparagus-and-tomatoes-with-herbs.jpg?s=2048x2048&w=is&k=20&c=2Fj8TIkqg89bKxnAVFFsR5NwHSDtayzlvHZCDlHIxbY=',
            width: width,
            height: height,
          ),
        ),
        if (isTrending)
          Positioned.directional(
            textDirection: TextDirection.rtl,
            end: 4,
            top: 5,
            child: CustomContainer(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 5),
              backGroundColor: AppColors.black.withValues(alpha: 0.4),
              border: Border.all(
                color: AppColors.white.withValues(alpha: 0.4),
                width: 0.5,
              ),
              child: Text("Trending", style: CustomAppFontStyle.medium10),
            ),
          ),
        Align(
          alignment: AlignmentDirectional.bottomCenter,
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(9),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: CustomContainer(
                height: 50,
                borderRaduis: 0,
                gradientColors: AppGradient.productGradient.withOpacity(0.1),
              ),
            ),
          ),
        ),
        Positioned.directional(
          bottom: 10,
          textDirection: TextDirection.ltr,
          end: 0,
          start: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              spacing: 8,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(
                  child: Text(
                    "25 Piece Sushi Boat with Three SIdes",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: CustomAppFontStyle.medium10,
                  ),
                ),

                CustomLiquidContainer(
                  raduis: 15,
                  child: Center(
                    child: Text(
                      "49.95\n JOD",
                      textAlign: TextAlign.center,
                      style: CustomAppFontStyle.medium10.copyWith(
                        color: AppColors.white,
                        fontSize: 7,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
