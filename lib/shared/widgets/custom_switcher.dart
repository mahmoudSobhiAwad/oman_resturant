import '../../core/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

// class CustomSwitcher extends StatelessWidget {
//   const CustomSwitcher({
//     super.key,
//     required this.isActive,
//     required this.onChanged,
//   });

//   final bool isActive;
//   final void Function(bool) onChanged;

//   @override
//   Widget build(BuildContext context) {
//     return Transform(
//       alignment: Alignment.center,
//       transform: Matrix4.rotationY(3.1416),
//       child: Transform.scale(
//         scale: 0.8,
//         child: Switch(
//           padding: const EdgeInsets.all(0),
//           value: isActive,
//           onChanged: onChanged,
//           activeColor: AppColors.primary,

//           inactiveTrackColor: AppColors.grayF5,
//           inactiveThumbColor: AppColors.black,
//           activeTrackColor: AppColors.primary,
//           thumbColor: WidgetStatePropertyAll(
//             isActive ? AppColors.white : AppColors.gray6C,
//           ),
//         ),
//       ),
//     );
//   }
// }

class CustomSwitcher extends StatefulWidget {
  const CustomSwitcher({
    super.key,
    required this.isActive,
    required this.onChanged,
    this.enableBorder = false,
  });
  final bool isActive;
  final void Function(bool) onChanged;
  final bool enableBorder;
  @override
  State<CustomSwitcher> createState() => _CustomSwitcherState();
}

class _CustomSwitcherState extends State<CustomSwitcher> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 44, // <-- Increase width here
      height: 22, // optional for control
      child: FittedBox(
        fit: BoxFit.cover,
        child: Switch(
          value: widget.isActive,
          onChanged: widget.onChanged,
          trackOutlineColor:
              widget.enableBorder
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
