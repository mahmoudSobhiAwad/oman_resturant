import 'package:flutter/material.dart';

import '../../core/utils/theme/app_colors.dart';
import '../../core/utils/theme/custom_app_font_styles.dart';

class MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyCustomAppBar({
    super.key,
    this.titleWidget,
    this.onBack,
    this.height = 50,
    this.trailing,
    this.enableButtomDivider = false,
    this.enableLeading = true,
    this.titleSpacing = 0,
    this.title,
    this.textDirection,
    this.leadingIconPath,
    this.centerTitle = false,
  });

  final bool enableLeading;
  final Widget? titleWidget;
  final List<Widget>? trailing;
  final bool enableButtomDivider;
  final void Function()? onBack;
  final double titleSpacing;
  final double height;
  final String? title;
  final TextDirection? textDirection;
  final String? leadingIconPath;
  final bool centerTitle;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        elevation: 0,
        forceMaterialTransparency: true,

        automaticallyImplyLeading: false,
        centerTitle: centerTitle,
        titleSpacing: titleSpacing,
        bottom: enableButtomDivider
            ? const PreferredSize(
                preferredSize: Size.fromHeight(1),
                child: Divider(thickness: 1, color: AppColors.grayF0),
              )
            : null,
        actions: trailing,
        // leading: (enableLeading && titleWidget != null)
        //     ? IconButton(
        //         onPressed: onBack ?? () => context.pop(),
        //         icon: SvgPicture.asset(leadingIconPath ?? AppIcons.arrowBack),
        //       )
        //     : null,
        title:
            titleWidget ??
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 8,
              children: [
                // if (enableLeading)
                //   IconButton(
                //     onPressed: onBack ?? () => context.pop(),
                //     icon: SvgPicture.asset(
                //       leadingIconPath ?? AppIcons.arrowBack,
                //     ),
                //   ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(end: 16.0),
                    child: Text(
                      title ?? "",
                      textDirection: textDirection,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CustomAppFontStyle.regular16.copyWith(
                        color: AppColors.gray46,
                      ),
                    ),
                  ),
                ),
              ],
            ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
