import '../../../core/utils/theme/app_colors.dart';
import '../../../core/utils/theme/app_icons.dart';
import '../../../core/utils/theme/custom_app_font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    this.backgroundColor,
    this.padding,
    this.title,
    this.titleTextDirection,
    this.subtitle,
    this.onTap,
    this.onLongPress,
    this.subTitleStyle,
    this.titleTextStyle,
    this.subTitleInstead,
    this.leadingIconPath,
    this.titleColor,
    this.iconColor,
    this.enableColor = true,
    this.enableArrow = false,
    this.topPaddingInLeadingIcon = 0,
    this.leadingSize,
    this.titleMaxLines = 1,
    this.trailing,
    this.expantionWidget,
    this.borderRaduis = 8,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.titleInstead,
    this.leadingIconInstead,
    this.enableShadow = false,
    this.border,
    this.spacing,
    this.subtitleTextDirection,
  });

  final Color? backgroundColor;
  final String? title;
  final String? subtitle;
  final void Function()? onTap;
  final void Function()? onLongPress;
  final String? leadingIconPath;
  final Color? titleColor;
  final Size? leadingSize;
  final Color? iconColor;
  final TextStyle? subTitleStyle;
  final bool enableArrow;
  final EdgeInsetsGeometry? padding;
  final Widget? titleInstead;
  final Widget? subTitleInstead;
  final bool enableColor;
  final Widget? trailing;
  final CrossAxisAlignment crossAxisAlignment;
  final double borderRaduis;
  final double topPaddingInLeadingIcon;
  final TextStyle? titleTextStyle;
  final int titleMaxLines;
  final TextDirection? titleTextDirection;
  final Widget? leadingIconInstead;
  final Widget? expantionWidget;
  final bool enableShadow;
  final Border? border;
  final double? spacing;
  final TextDirection? subtitleTextDirection;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          border: border,
          boxShadow: enableShadow
              ? [
                  BoxShadow(
                    color: AppColors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
          color: backgroundColor ?? AppColors.grayF0,
          borderRadius: BorderRadius.circular(borderRaduis),
        ),
        child: Column(
          spacing: expantionWidget != null ? spacing ?? 10 : spacing ?? 0,
          children: [
            Row(
              crossAxisAlignment: crossAxisAlignment,
              children: [
                if (leadingIconPath != null)
                  Padding(
                    padding: EdgeInsets.only(top: topPaddingInLeadingIcon),
                    child: SvgPicture.asset(
                      leadingIconPath!,
                      width: leadingSize?.width ?? 24,
                      height: leadingSize?.height ?? 24,
                      colorFilter: enableColor
                          ? ColorFilter.mode(
                              iconColor ?? AppColors.gray49,
                              BlendMode.srcIn,
                            )
                          : null,
                    ),
                  ),
                if (leadingIconInstead != null) leadingIconInstead!,
                if (leadingIconPath != null || leadingIconInstead != null)
                  const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: spacing ?? 4,
                    children: [
                      titleInstead ??
                          Text(
                            title ?? "",
                            maxLines: titleMaxLines,
                            textDirection: titleTextDirection,
                            overflow: TextOverflow.ellipsis,
                            style:
                                titleTextStyle ??
                                CustomAppFontStyle.regular16.copyWith(
                                  color: titleColor ?? AppColors.gray6C,
                                ),
                          ),
                      if (subTitleInstead != null)
                        subTitleInstead!
                      else if (subtitle != null)
                        Text(
                          subtitle!,
                          maxLines: 2,
                          textDirection: subtitleTextDirection,
                          style: subTitleStyle ?? CustomAppFontStyle.light14,
                        ),
                      if (expantionWidget != null) expantionWidget!,
                    ],
                  ),
                ),
                if (enableArrow) const SizedBox(width: 12),
                if (enableArrow)
                  RotatedBox(
                    quarterTurns: 2,
                    child: SvgPicture.asset(AppIcons.arrowBack),
                  ),
                if (trailing != null) trailing!,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
