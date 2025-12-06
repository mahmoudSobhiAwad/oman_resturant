import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/utils/theme/custom_app_font_styles.dart';
import 'dotted_border_painter.dart';

class DottedAddNewItem extends StatelessWidget {
  final void Function()? onTap;
  final String imagePath, title;
  final double height;
  final Color? borderColor, iconColor;

  const DottedAddNewItem({
    super.key,
    required this.onTap,
    required this.imagePath,
    required this.title,
    required this.height,
    this.borderColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomPaint(
        painter: borderColor != null ? null : DottedBorderPainter(),
        child: Container(
          height: height,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: borderColor != null
                  ? Border.all(
                      color: borderColor!,
                    )
                  : null),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                imagePath,
                height: 24,
                width: 24,
                fit: BoxFit.scaleDown,
                colorFilter: iconColor != null
                    ? ColorFilter.mode(iconColor!, BlendMode.srcIn)
                    : null,
              ),
              const SizedBox(
                width: 12,
              ),
              Text(
                title,
                style: CustomAppFontStyle.regular16,
              )
            ],
          ),
        ),
      ),
    );
  }
}
