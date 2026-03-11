import '../../core/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomSwitcher extends StatelessWidget {
  const CustomSwitcher({
    super.key,
    required this.isActive,
    required this.onChanged,
    this.enableBorder = false,
    this.width,
    this.height,
  });
  final bool isActive;
  final void Function(bool) onChanged;
  final bool enableBorder;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 44,
      height: height ?? 22,
      child: FittedBox(
        fit: BoxFit.cover,
        child: Switch(
          value: isActive,
          onChanged: onChanged,
          trackOutlineColor: enableBorder
              ? null
              : const WidgetStatePropertyAll(Colors.transparent),
          inactiveTrackColor: AppColors.grayEF3,
          inactiveThumbColor: AppColors.white,
          thumbColor: WidgetStateProperty.resolveWith((states) {
            return AppColors.white;
          }),
          overlayColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.hovered)) {
              return Colors.grey.withValues(alpha: 0.1);
            }
            return Colors.transparent;
          }),
          splashRadius: 4,
        ),
      ),
    );
  }
}
