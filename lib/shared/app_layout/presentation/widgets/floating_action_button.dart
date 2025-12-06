import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/theme/app_colors.dart';
import '../../../../core/utils/theme/app_icons.dart';

class LayoutFloatingActionButton extends StatelessWidget {
  const LayoutFloatingActionButton({
    super.key,
    required this.onTap,
    this.isActive = false,
  });

  final void Function() onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 30.0),
        height: 64,
        width: 64,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.1),
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
          borderRadius: BorderRadius.circular(55),
          color: AppColors.white,
        ),
        child: Center(child: SvgPicture.asset(AppIcons.floatingActionIcon)),
      ),
    );
  }
}
