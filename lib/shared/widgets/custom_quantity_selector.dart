// import 'package:huda_yousef/core/utils/theme/app_colors.dart';
// import 'package:huda_yousef/core/utils/theme/app_icons.dart';
// import 'package:huda_yousef/core/utils/theme/custom_app_font_styles.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class QuantitySelector extends StatelessWidget {
//   const QuantitySelector({
//     super.key,
//     this.spacing = 0,
//     this.initialValue = 1,
//     this.onAdd,
//     this.omMinus,
//   });

//   final double spacing;
//   final int initialValue;
//   final void Function()? onAdd;
//   final void Function()? omMinus;
//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(52),
//       child: ColoredBox(
//         color: AppColors.grayF5,
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             spacing: spacing,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               InkWell(
//                 onTap: () {
//                   if (initialValue > 1) {
//                     omMinus?.call();
//                   }
//                 },
//                 child: SvgPicture.asset(
//                   AppIcons.iconsMinus,
//                   width: 24,
//                   height: 24,
//                 ),
//               ),
//               Text("$initialValue", style: CustomAppFontStyle.bold12),
//               InkWell(
//                 onTap: onAdd,
//                 child: SvgPicture.asset(
//                   AppIcons.iconsAdd,
//                   width: 24,
//                   height: 24,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
