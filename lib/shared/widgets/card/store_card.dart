// import 'package:easy_localization/easy_localization.dart' hide TextDirection;
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:huda_yousef/app_versions/user/home/data/models/customer_store_model.dart';
// import 'package:huda_yousef/app_versions/user/stores/presentation/widgets/free_shipping_icon.dart';
// import 'package:huda_yousef/core/routing/routes.dart';
// import 'package:huda_yousef/core/utils/theme/app_colors.dart';
// import 'package:huda_yousef/core/utils/theme/app_icons.dart';
// import 'package:huda_yousef/core/utils/theme/custom_app_font_styles.dart';
// import 'package:huda_yousef/shared/cubit/basic_cubit.dart';
// import 'package:huda_yousef/shared/widgets/custom_cached_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:huda_yousef/shared/widgets/custom_rate_icon.dart';

// class StoreCard extends StatelessWidget {
//   const StoreCard({
//     super.key,
//     this.enableShipping = true,
//     this.subtitleWidget,
//     this.isGrid = false,
//     this.badgeWidget,
//     this.maxLine = 1,
//     this.itemWidth,
//     this.onTap,
//     this.storeModel,
//     this.imageWidth,
//     this.bookButton,
//   });

//   final bool enableShipping;
//   final Widget? badgeWidget;
//   final bool isGrid;
//   final double? imageWidth;
//   final int maxLine;
//   final double? itemWidth;
//   final Widget? subtitleWidget;
//   final CustomerStoreModel? storeModel;
//   final void Function()? onTap;
//   final Widget? bookButton;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap:
//           onTap ??
//           () => context.push(
//             AppRouter.customerStorePageDetails,
//             extra: {
//               'enableBooking': storeModel?.hasClinic,
//               'model': storeModel,
//             },
//           ),
//       child: Container(
//         decoration: BoxDecoration(
//           color: AppColors.white,
//           borderRadius: BorderRadius.circular(12),
//         ),
//         padding: const EdgeInsets.all(10),
//         child: Column(
//           spacing: 4,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Stack(
//               children: [
//                 ClipRRect(
//                   borderRadius: const BorderRadiusDirectional.only(
//                     topStart: Radius.circular(12),
//                     topEnd: Radius.circular(12),
//                   ),
//                   child: CustomCachedImage(
//                     fit: BoxFit.cover,
//                     height: 160,
//                     width: imageWidth ?? double.infinity,
//                     imagePath: storeModel?.image ?? "",
//                   ),
//                 ),
//                 if (enableShipping && storeModel?.enableDelivery == true)
//                   PositionedDirectional(
//                     start: 0,
//                     child: SupportShippingWidget(),
//                   ),
//                 Positioned.directional(
//                   textDirection: context.locale.languageCode == 'ar'
//                       ? TextDirection.rtl
//                       : TextDirection.ltr,
//                   start: 8,
//                   bottom: 5,
//                   child: CustomRateIcon(
//                     starRating: storeModel?.avgRate?.toDouble() ?? 0,
//                   ),
//                 ),

//                 Positioned.directional(
//                   textDirection: context.locale.languageCode == 'ar'
//                       ? TextDirection.rtl
//                       : TextDirection.ltr,

//                   end: 6,
//                   top: 8,

//                   child: BlocBuilder<BasicCubit, BasicStates>(
//                     buildWhen: (previous, current) =>
//                         current is ToggleLocalFavState &&
//                         (current).id == storeModel?.id,
//                     builder: (context, state) {
//                       return IconButton(
//                         iconSize: 28,
//                         style: IconButton.styleFrom(
//                           padding: EdgeInsets.zero,
//                           backgroundColor: AppColors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                         ),
//                         onPressed: () {
//                           context.read<BasicCubit>().toggleStoreFav(
//                             storeModel!,
//                           );
//                         },
//                         icon: SvgPicture.asset(
//                           context.read<BasicCubit>().isStoreInLocal(
//                                 storeModel!.id!,
//                               )
//                               ? AppIcons.favouriteFilled
//                               : AppIcons.favouriteOutlined,
//                           height: 24,
//                           width: 24,
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//             Text(
//               storeModel?.storeName ?? "",
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//               style: CustomAppFontStyle.medium16,
//             ),
//             Wrap(
//               crossAxisAlignment: WrapCrossAlignment.center,
//               spacing: 8,
//               runSpacing: 4,
//               children: [
//                 Row(
//                   spacing: 4,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     SvgPicture.asset(AppIcons.location),
//                     Text(
//                       (storeModel?.storeLocation != null &&
//                               storeModel!.storeLocation!.isNotEmpty)
//                           ? storeModel?.storeLocation ?? ""
//                           : "غير محدد",
//                       style: CustomAppFontStyle.regular14.copyWith(
//                         color: AppColors.gray59,
//                       ),
//                     ),
//                   ],
//                 ),

//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(4),
//                   child: ColoredBox(
//                     color: AppColors.gray59,
//                     child: SizedBox(height: 3, width: 12),
//                   ),
//                 ),
//                 Row(
//                   spacing: 4,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     SvgPicture.asset(AppIcons.time),
//                     Text(
//                       (storeModel?.isWorkingToday ?? false)
//                           ? (storeModel?.isOpenNow ?? false)
//                                 ? "مفتوح الآن – حتى ${storeModel?.openTime?.close?.replaceAll('AM', 'صباحا').replaceAll('PM', 'مساءً')}"
//                                 : "مفتوح من ${storeModel?.openTime?.open?.replaceAll('AM', 'صباحا').replaceAll('PM', 'مساءً')} – حتى ${storeModel?.openTime?.close?.replaceAll('AM', 'صباحا').replaceAll('PM', 'مساءً')}"
//                           : "مغلق",
//                       style: CustomAppFontStyle.regular14.copyWith(
//                         color: AppColors.gray59,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),

//             if (bookButton != null) bookButton!,
//           ],
//         ),
//       ),
//     );
//   }
// }
