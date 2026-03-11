import 'package:app_core/core/utils/theme/app_colors.dart';
import 'package:app_core/core/utils/theme/app_gradient.dart';
import 'package:app_core/shared/widgets/custom_cached_image.dart';
import 'package:app_core/shared/widgets/custom_liquid_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
    this.leading,
    this.leadingWidth,
    this.image,
  });
  final Widget? leading;
  final double? leadingWidth;
  final Widget? image;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,

      expandedHeight: 250,
      leadingWidth: leadingWidth ?? 56,
      surfaceTintColor: Colors.transparent,
      backgroundColor: AppColors.black.withValues(alpha: 0.9),

      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            image ??
                CustomCachedImage(
                  imagePath:
                      'https://images.pexels.com/photos/958546/pexels-photo-958546.jpeg?cs=srgb&dl=pexels-chanwalrus-958546.jpg&fm=jpg',
                  fromApi: false,
                  width: double.infinity,
                  height: 250,
                ),
            Container(
              height: 47,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: AppGradient.blackLinearGradient,
              ),
            ),
          ],
        ),
      ),
      leading:
          leading ??
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: CustomLiquidContainer(
              raduis: 24,
              backGround: AppColors.black.withValues(alpha: 0.4),
              borderColor: AppColors.black.withValues(alpha: 0.3),
              child: IconButton(
                onPressed: () {
                  context.canPop() ? context.pop() : null;
                },
                icon: const Icon(Icons.arrow_back, color: AppColors.white),
              ),
            ),
          ),
    );
  }
}
