// import 'package:flutter/material.dart';
// import 'package:huda_yousef/app_versions/user/services/data/models/customer_service_model.dart';
// import 'package:huda_yousef/core/utils/theme/app_colors.dart';
// import 'package:huda_yousef/core/utils/theme/custom_app_font_styles.dart';
// import 'package:huda_yousef/shared/widgets/custom_cached_image.dart';
// import 'package:huda_yousef/shared/widgets/custom_container.dart';

// class LargeServiceCard extends StatelessWidget {
//   const LargeServiceCard({super.key, required this.service});
//   final CustomerServiceModel service;
//   @override
//   Widget build(BuildContext context) {
//     return CustomContainer(
//       enableShadow: true,
//       backGroundColor: AppColors.white,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         spacing: 12,
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(12),
//               topRight: Radius.circular(12),
//             ),
//             child: CustomCachedImage(
//               height: 250,
//               width: double.infinity,
//               imagePath: service.image ?? "",
//             ),
//           ),
//           Text(service.name ?? "", style: CustomAppFontStyle.medium16),
//           service.subServices.isEmpty
//               ? Text(
//                   "لا يوجد خدمات فرعية",
//                   style: CustomAppFontStyle.semiBold14.copyWith(
//                     color: AppColors.gray59,
//                   ),
//                 )
//               : Text.rich(
//                   TextSpan(
//                     text: service.subServices.length.toString(),
//                     style: CustomAppFontStyle.semiBold14.copyWith(
//                       color: AppColors.gray59,
//                     ),
//                     children: [
//                       TextSpan(
//                         text: " خدمة فرعية",
//                         style: CustomAppFontStyle.semiBold14.copyWith(
//                           color: AppColors.gray8C,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//         ],
//       ),
//     );
//   }
// }
