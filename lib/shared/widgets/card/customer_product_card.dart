// import 'package:easy_localization/easy_localization.dart' hide TextDirection;
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:huda_yousef/app_versions/user/home/data/models/customer_product_model.dart';
// import 'package:huda_yousef/core/routing/routes.dart';
// import 'package:huda_yousef/core/utils/theme/app_colors.dart';
// import 'package:huda_yousef/core/utils/theme/app_icons.dart';
// import 'package:huda_yousef/core/utils/theme/custom_app_font_styles.dart';
// import 'package:huda_yousef/shared/cubit/basic_cubit.dart';
// import 'package:huda_yousef/shared/widgets/custom_cached_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:huda_yousef/shared/widgets/custom_discount_badget.dart';
// import 'package:huda_yousef/shared/widgets/custom_rate_icon.dart';
// import 'package:huda_yousef/shared/widgets/price_before_after_widget.dart';

// class CustomProductCard extends StatelessWidget {
//   const CustomProductCard({
//     super.key,
//     this.showDiscount = true,
//     this.brandWidget,
//     this.subtitleWidget,
//     this.isGrid = false,
//     this.badgeWidget,
//     this.maxLine = 1,
//     this.itemWidth,
//     this.onTap,
//     this.imageWidth,
//     this.productModel,
//   });

//   final bool showDiscount;
//   final Widget? brandWidget;
//   final Widget? badgeWidget;
//   final bool isGrid;
//   final double? imageWidth;
//   final int maxLine;
//   final double? itemWidth;
//   final Widget? subtitleWidget;
//   final CustomerProductModel? productModel;
//   final void Function()? onTap;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap:
//           onTap ??
//           () => context.push(
//             AppRouter.customerProductDetails,
//             extra: productModel,
//           ),
//       child: SizedBox(
//         width: itemWidth ?? 160,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Stack(
//               children: [
//                 ClipRRect(
//                   borderRadius: const BorderRadiusDirectional.all(
//                     Radius.circular(12),
//                   ),
//                   child: CustomCachedImage(
//                     fromApi: false,
//                     fit: BoxFit.cover,
//                     height: 166,
//                     width: imageWidth ?? 160,
//                     imagePath: productModel?.images.firstOrNull?.path ?? "",
//                   ),
//                 ),
//                 if (showDiscount &&
//                     productModel?.discountPercentage != null &&
//                     productModel?.discountPercentage != 0)
//                   PositionedDirectional(
//                     top: context.locale.languageCode == 'en' ? 15 : 10,
//                     end: -40,
//                     child: CustomDiscountBadget(
//                       discountPercentage:
//                           productModel?.discountPercentage ?? 20,
//                     ),
//                   ),
//                 if (productModel?.reviewAverage != null &&
//                     productModel?.reviewAverage != 0)
//                   Positioned.directional(
//                     textDirection: context.locale.languageCode == 'ar'
//                         ? TextDirection.rtl
//                         : TextDirection.ltr,
//                     start: 6,
//                     bottom: 5,
//                     child: CustomRateIcon(
//                       starRating: productModel?.reviewAverage,
//                     ),
//                   ),
//                 Positioned.directional(
//                   textDirection: context.locale.languageCode == 'ar'
//                       ? TextDirection.rtl
//                       : TextDirection.ltr,

//                   start: 2,
//                   child: BlocBuilder<BasicCubit, BasicStates>(
//                     buildWhen: (previous, current) =>
//                         current is ToggleLocalFavState &&
//                         (current).id == productModel?.id,
//                     builder: (context, state) {
//                       return IconButton(
//                         style: IconButton.styleFrom(
//                           backgroundColor: AppColors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadiusDirectional.circular(12),
//                           ),
//                           padding: const EdgeInsets.all(4),
//                         ),
//                         onPressed: () {
//                           // context.read<BasicCubit>().toggleProductFav(
//                           //   productModel!,
//                           // );
//                         },
//                         icon: SvgPicture.asset(
//                           context.read<BasicCubit>().isProductFav(
//                                 productModel?.id ?? "",
//                               )
//                               ? AppIcons.favouriteFilled
//                               : AppIcons.favouriteOutlined,
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),

//             Flexible(
//               child: Text(
//                 productModel?.productName ?? "",
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//                 style: CustomAppFontStyle.regular12,
//               ),
//             ),
//             const SizedBox(height: 4),
//             Row(
//               spacing: 4,
//               children: [
//                 Expanded(
//                   child: CustomPriceAfterAndBefore(
//                     priceAfter: productModel?.priceAfterDiscount,
//                     priceBefore: productModel?.price,
//                     enableDiscount:
//                         productModel?.discountPercentage != null &&
//                         productModel?.discountPercentage != 0,
//                   ),
//                 ),
//                 // Spacer(),
//                 CircleAvatar(
//                   backgroundColor: AppColors.primary,

//                   radius: 15,
//                   child: SvgPicture.asset(AppIcons.addToCart),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 4),
//           ],
//         ),
//       ),
//     );
//   }
// }
