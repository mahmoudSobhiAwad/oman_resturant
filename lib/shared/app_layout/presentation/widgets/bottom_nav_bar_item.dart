import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/theme/app_colors.dart';
import '../../../../core/utils/theme/custom_app_font_styles.dart';

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    super.key,
    required this.assetName,
    this.assetFilledName = '',
    required this.label,
    this.isActive = false,
  });

  final String assetName;
  final String assetFilledName;
  final String label;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeIn,
      decoration: BoxDecoration(
        // border:
        //      const Border(
        //         top:? BorderSide(width: 1.5, color: AppColors.primary),
        //       )
        //     n
        gradient:
            isActive
                ? LinearGradient(
                  begin: const Alignment(0.50, -0.00),
                  end: const Alignment(0.50, 1.00),
                  colors: [
                    AppColors.primary.withValues(alpha: 0.12),
                    AppColors.primary.withAlpha(0),
                  ],
                )
                : null,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 8,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.bounceInOut,
            height: 3,
            decoration: BoxDecoration(
              // border:
              //      const Border(
              //         top:? BorderSide(width: 1.5, color: AppColors.primary),
              //       )
              //     n
              gradient:
                  isActive
                      ? const LinearGradient(
                        begin: Alignment.topCenter,

                        end: Alignment.bottomCenter,
                        colors: [Color(0xff1F2433), Color(0xffF2F4F7)],
                      )
                      : null,
            ),
          ),
          SvgPicture.asset(
            isActive && assetFilledName != assetName
                ? assetFilledName
                : assetName,
            fit: BoxFit.scaleDown,
            colorFilter:
                isActive
                    ? null
                    : const ColorFilter.mode(AppColors.gray88, BlendMode.srcIn),
          ),
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                colors:
                    isActive
                        ? [AppColors.black, AppColors.gray5D]
                        : [AppColors.gray71, AppColors.gray71],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ).createShader(bounds);
            },
            blendMode: BlendMode.srcIn,
            child: Text(
              label,
              style: CustomAppFontStyle.regular11.copyWith(color: Colors.white),
            ),
          ),
          const SizedBox(height: 10.5),
        ],
      ),
    );
  }
}
