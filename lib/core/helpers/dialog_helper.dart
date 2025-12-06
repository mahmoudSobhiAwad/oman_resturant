import 'dart:ui';

import 'package:app_core/core/utils/extensions/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/utils/theme/app_colors.dart';
import '../../core/utils/theme/app_icons.dart';
import '../utils/theme/custom_app_font_styles.dart';

class DialogHelper {
  static void showCustomDialog({
    required BuildContext context,
    required TapDownDetails details,
    void Function()? firstOptionFunction,
    void Function()? secondOptionFunction,
    String? menuTitle,
    String? firstOptionTitle,
    String? secondOptionTitle,
    String firstOptionIcon = AppIcons.smallX,
    String secondOptionIcon = AppIcons.smallX,
    Color secondOptionIconColor = AppColors.gray2B,
    Color firstOptionIconColor = AppColors.gray43,
    Color? firstOptionColor,
    Color? secondOptionColor,
    String? thirdOptionTitle,
    void Function()? thirdOptionFunction,
    String thirdOptionIcon = AppIcons.cartIcon,
    Color thirdOptionIconColor = AppColors.gray43,
    Color? thirdOptionColor,
    bool withIcons = true,
    bool rightAligned = false,
    bool center = false,
    bool isThirdOtional = false,
    bool isSecondOptional = true,
    double topSpace = 0,
  }) {
    final double topPosition = details.globalPosition.dy + topSpace;

    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (BuildContext context) {
        return Stack(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
                child: Container(color: Colors.transparent),
              ),
            ),
            Positioned(
              left: center
                  ? null
                  : rightAligned
                  ? null
                  : context.width * 0.3,
              right: center
                  ? null
                  : rightAligned
                  ? context.width * 0.3
                  : null,
              top: topPosition,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: 150,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.gray43.withValues(alpha: 0.2),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                        spreadRadius: 1,
                      ),
                    ],
                    // border: Border.all(color: AppColors.grey89, width: 2),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      menuTitle != null
                          ? Padding(
                              padding: const EdgeInsets.all(12),
                              child: Text(
                                menuTitle,
                                style: CustomAppFontStyle.semiBold16.copyWith(
                                  color: firstOptionColor ?? AppColors.black,
                                ),
                              ),
                            )
                          : const SizedBox(height: 24),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          firstOptionFunction?.call();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (withIcons) ...[
                                SvgPicture.asset(
                                  firstOptionIcon,
                                  width: 28,
                                  colorFilter: ColorFilter.mode(
                                    firstOptionIconColor,
                                    BlendMode.srcIn,
                                  ),
                                  // fit: BoxFit.scaleDown,
                                ),
                                const SizedBox(width: 5),
                              ],
                              Text(
                                firstOptionTitle ?? "تغيير",
                                style: CustomAppFontStyle.regular14.copyWith(
                                  color: firstOptionColor ?? AppColors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      isSecondOptional
                          ? Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                    secondOptionFunction?.call();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 24,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        if (withIcons) ...[
                                          SvgPicture.asset(
                                            secondOptionIcon,
                                            width: 28,
                                            colorFilter: ColorFilter.mode(
                                              secondOptionIconColor,
                                              BlendMode.srcIn,
                                            ),
                                            //fit: BoxFit.scaleDown,
                                          ),
                                          const SizedBox(width: 5),
                                        ],
                                        Text(
                                          secondOptionTitle ?? "حذف",
                                          style: CustomAppFontStyle.regular14
                                              .copyWith(
                                                color:
                                                    secondOptionColor ??
                                                    AppColors.black,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                              ],
                            )
                          : const SizedBox.shrink(),
                      isThirdOtional
                          ? Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                    thirdOptionFunction?.call();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 24,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        if (withIcons) ...[
                                          SvgPicture.asset(
                                            thirdOptionIcon,
                                            width: 20,
                                            colorFilter: ColorFilter.mode(
                                              thirdOptionIconColor,
                                              BlendMode.srcIn,
                                            ),
                                            fit: BoxFit.scaleDown,
                                          ),
                                          const SizedBox(width: 5),
                                        ],
                                        Text(
                                          thirdOptionTitle ?? "حذف",
                                          style: CustomAppFontStyle.regular14
                                              .copyWith(
                                                color:
                                                    thirdOptionColor ??
                                                    AppColors.black,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 24),
                              ],
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  static void showTwoWidgetDialog({
    required BuildContext context,
    required TapDownDetails details,
    required String title,
    Widget? leftWidget,
    Widget? rightWidget,
    Widget? insteadWidget,
    double dialogWidth = 320,
    double dialogHeight = 220,
    double borderRadius = 16,
    Color backgroundColor = Colors.white,
    Color barrierColor = Colors.black54,
    TextStyle? titleStyle,
  }) {
    final double topPosition = details.globalPosition.dy;

    showDialog(
      context: context,
      barrierColor: barrierColor,
      builder: (BuildContext context) {
        return Stack(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                child: Container(color: Colors.transparent),
              ),
            ),
            Positioned(
              left: 16,
              top: topPosition - 15,
              child: Material(
                child: Container(
                  width: dialogWidth,
                  height: dialogHeight,
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(borderRadius),
                      topRight: Radius.circular(borderRadius),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 10,
                    children: [
                      // Header Title
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20.0,
                          horizontal: 16.0,
                        ),
                        child: Text(
                          title,
                          style: titleStyle ?? CustomAppFontStyle.regular14,
                        ),
                      ),
                      insteadWidget ??
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                if (leftWidget != null)
                                  Expanded(child: leftWidget),
                                if (rightWidget != null)
                                  Expanded(child: rightWidget),
                              ],
                            ),
                          ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
