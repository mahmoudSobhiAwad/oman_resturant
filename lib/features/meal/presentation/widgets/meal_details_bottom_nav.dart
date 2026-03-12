import 'package:flutter/cupertino.dart';
import 'package:oman_resturant/core/enums/request_enums.dart';
import 'package:oman_resturant/core/utils/extensions/money_format.dart';
import 'package:oman_resturant/core/utils/theme/app_colors.dart';
import 'package:oman_resturant/core/utils/theme/app_gradient.dart';
import 'package:oman_resturant/core/utils/theme/app_icons.dart';
import 'package:oman_resturant/core/utils/theme/custom_app_font_styles.dart';
import 'package:oman_resturant/shared/widgets/custom_asset_image.dart';
import 'package:oman_resturant/shared/widgets/custom_liquid_button.dart';
import 'package:oman_resturant/shared/widgets/custom_push_container_button.dart';
import 'package:oman_resturant/shared/widgets/custom_shader_text.dart';
import 'package:oman_resturant/features/meal/presentation/manager/meal_details_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oman_resturant/shared/widgets/custom_toast.dart';

class MealDetailsBottomNav extends StatelessWidget {
  const MealDetailsBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealDetailsCubit, MealDetailsState>(
      builder: (context, state) {
        if (state.mealModel == null ||
            state.mealDetailsRequestState == RequestStatesEnums.error) {
          return SizedBox.shrink();
        } else if (state.mealDetailsRequestState ==
            RequestStatesEnums.loading) {
          return CupertinoActivityIndicator();
        }
        return Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomShaderText(
                    title:
                        '${state.mealModel?.price?.formatMoney() ?? "0.00"} JD',
                    fontStyle: CustomAppFontStyle.bold18(
                      context,
                    ).copyWith(color: AppColors.white),
                  ),
                  if (!(state.mealModel?.isPriceIncludeService ?? true))
                    Text(
                      "+ tax & service",
                      style: CustomAppFontStyle.bold12(
                        context,
                      ).copyWith(color: AppColors.gray74),
                      textAlign: TextAlign.start,
                    ),
                ],
              ),
            ),
            CustomPushButton(
              onTap: () {
                CustomToast(
                  context: context,
                  header: "Meal Added To Cart Successfully !",
                ).showTopToast();
              },
              boxBorder: Border.all(
                color: AppColors.white.withValues(alpha: 0.2),
              ),
              height: 52,
              backGradient: AppGradient.primaryGradient,
              radius: 26,
              padding: EdgeInsetsDirectional.only(
                top: 4,
                bottom: 5,
                start: 14,
                end: 6,
              ),
              child: Row(
                spacing: 8,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Add To Order",
                    style: CustomAppFontStyle.bold12(
                      context,
                    ).copyWith(color: AppColors.black),
                  ),
                  CustomLiquidContainer(
                    raduis: 18,
                    child: Center(
                      child: CustomAssetImage(path: AppIcons.arrowForward),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
