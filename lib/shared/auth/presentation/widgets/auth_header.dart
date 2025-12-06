import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/utils/theme/app_colors.dart';
import '../../../../core/utils/theme/app_icons.dart';
import '../../../../core/utils/theme/app_images.dart';
import '../../../../core/utils/theme/custom_app_font_styles.dart';
// import 'package:huda_yousef/shared/widgets/app_image.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    super.key,
    this.backTitle,
    this.onBack,
    this.enableBack = true,
    this.enableLogo = true,
    this.logoWidget,
  });

  final String? backTitle;
  final void Function()? onBack;
  final bool enableBack;
  final bool enableLogo;
  final Widget? logoWidget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        enableBack
            ? IconButton(
              onPressed:
                  onBack ??
                  () =>
                      context.canPop()
                          ? context.pop()
                          : context.go(AppRouter.splashScreen),
              icon: Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 4,
                children: [
                  SvgPicture.asset(
                    AppIcons.arrowBack,
                    colorFilter: const ColorFilter.mode(
                      AppColors.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                  if (backTitle != null)
                    Text(backTitle!, style: CustomAppFontStyle.medium16),
                ],
              ),
            )
            : const SizedBox(height: 35),
        const SizedBox(height: 8, width: double.infinity),
        enableLogo
            ? logoWidget ??
                SizedBox(
                  child: Center(
                    child: Image.asset(
                      AppImages.logoBGRemoved,
                      // height: 70,
                      // width: 70,
                      color: AppColors.black,
                    ),
                  ),
                )
            : const SizedBox.shrink(),
        enableLogo ? const SizedBox(height: 25) : const SizedBox.shrink(),
      ],
    );
  }
}
