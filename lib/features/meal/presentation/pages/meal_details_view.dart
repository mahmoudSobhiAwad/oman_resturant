import 'package:task_app/core/animation/scale_transition_animation.dart';
import 'package:task_app/core/utils/theme/app_colors.dart';
import 'package:task_app/core/utils/theme/custom_app_font_styles.dart';
import 'package:task_app/features/meal/presentation/widgets/custom_meal_preparation_item.dart';
import 'package:task_app/features/meal/presentation/widgets/meal_details_bottom_nav.dart';
import 'package:task_app/shared/widgets/custom_sliver_app_bar.dart';
import 'package:task_app/shared/widgets/custom_shader_text.dart';
import 'package:task_app/shared/widgets/expandable_text.dart';
import 'package:flutter/material.dart';

class MealDetailsView extends StatefulWidget {
  const MealDetailsView({super.key});

  @override
  State<MealDetailsView> createState() => _MealDetailsViewState();
}

class _MealDetailsViewState extends State<MealDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ).copyWith(top: 16),
          child: MealDetailsBottomNav(),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(),
          SliverPadding(
            padding: const EdgeInsetsDirectional.only(start: 15.0, end: 31.0),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Main Course",
                    style: CustomAppFontStyle.bold10.copyWith(
                      color: AppColors.white.withValues(alpha: 0.6),
                    ),
                  ),
                  CustomShaderText(
                    title: "Tenderloin Beef",
                    fontStyle: CustomAppFontStyle.bold20.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(height: 6),
                  ExpandableText(
                    text: "text " * 100,
                    maxLines: 6,
                    style: CustomAppFontStyle.medium14.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(height: 14),
                  Text(
                    "Preparation",
                    style: CustomAppFontStyle.bold10.copyWith(
                      color: AppColors.white.withValues(alpha: 0.6),
                    ),
                  ),
                  SizedBox(height: 9),

                  Wrap(
                    spacing: 4,
                    runSpacing: 4,
                    children: [
                      ...List.generate(
                        10,
                        (index) => ScaleTransitionAnimation(
                          duration: const Duration(milliseconds: 500),
                          child: const CustomMealPreparationItem(
                            title: "20 Minutes",
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
