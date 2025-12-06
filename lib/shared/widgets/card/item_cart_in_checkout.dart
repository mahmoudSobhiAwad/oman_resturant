// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:go_router/go_router.dart';
// import 'package:huda_yousef/core/network/mony_helper.dart';
// import 'package:huda_yousef/core/utils/theme/app_colors.dart';
// import 'package:huda_yousef/core/utils/theme/app_gradient.dart';
// import 'package:huda_yousef/core/utils/theme/app_icons.dart';
// import 'package:huda_yousef/core/utils/theme/custom_app_font_styles.dart';
// import 'package:huda_yousef/features/cart/presentation/widgets/quantity_selector.dart';
// import 'package:huda_yousef/features/product/data/models/product_model.dart';
// import 'package:huda_yousef/shared/widgets/custom_cached_image.dart';
// import 'package:huda_yousef/shared/widgets/custom_container.dart';
// import 'package:huda_yousef/shared/widgets/custom_list_tile.dart';
// import 'package:huda_yousef/shared/widgets/custom_two_option_dialog.dart';

// class CartCheckOutItem extends StatefulWidget {
//   const CartCheckOutItem({
//     super.key,
//     required this.productDetailsEntity,
//     required this.onRemove,
//     required this.onAdd,
//     required this.onMinus,
//   });
//   final ProductDetailsEntity productDetailsEntity;

//   final void Function(ProductDetailsEntity) onRemove;

//   final void Function(ProductDetailsEntity) onAdd;
//   final void Function(ProductDetailsEntity) onMinus;

//   @override
//   State<CartCheckOutItem> createState() => _CartCheckOutItemState();
// }

// class _CartCheckOutItemState extends State<CartCheckOutItem>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _shakeController;
//   late Animation<double> _shakeAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _shakeController = AnimationController(
//       duration: const Duration(milliseconds: 500),
//       vsync: this,
//     );

//     _shakeAnimation = Tween<double>(begin: 0, end: 10).animate(
//       CurvedAnimation(parent: _shakeController, curve: Curves.elasticIn),
//     );

//     // Auto-trigger shake animation on init (you can remove this if you want to trigger it manually)
//     Future.delayed(const Duration(milliseconds: 100), () {
//       if (mounted) {
//         _shake();
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _shakeController.dispose();
//     super.dispose();
//   }

//   void _shake() {
//     _shakeController.forward(from: 0).then((_) {
//       if (mounted) {
//         _shakeController.reverse();
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _shakeAnimation,
//       builder: (context, child) {
//         return Transform.translate(
//           offset: Offset(
//             _shakeAnimation.value *
//                 ((_shakeController.value * 4).floor() % 2 == 0 ? 1 : -1),
//             0,
//           ),
//           child: child,
//         );
//       },
//       child: CustomListTile(
//         spacing: 0,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//         leadingIconInstead: ClipRRect(
//           borderRadius: BorderRadius.circular(8),
//           child: CustomCachedImage(
//             imagePath:
//                 widget.productDetailsEntity.pickedVariant?.image ??
//                 widget.productDetailsEntity.imageCover,
//             width: 70,
//             height: 70,
//           ),
//         ),
//         backgroundColor: AppColors.white,

//         titleTextStyle: CustomAppFontStyle.regular14.copyWith(
//           color: AppColors.gray52,
//         ),
//         expantionWidget: Row(
//           children: [
//             Expanded(
//               child: Row(
//                 spacing: 2,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Text(
//                     "${MonyHelper.formatMoney(widget.productDetailsEntity.pickedVariant?.priceAfterDiscount ?? widget.productDetailsEntity.priceAfterdiscound)} د.ع",
//                     style: CustomAppFontStyle.semiBold16.copyWith(
//                       color: AppColors.black,
//                     ),
//                   ),
//                   if (widget
//                           .productDetailsEntity
//                           .pickedVariant
//                           ?.priceAfterDiscount !=
//                       widget.productDetailsEntity.pickedVariant?.price)
//                     Transform.translate(
//                       offset: const Offset(0, 3),
//                       child: Text(
//                         "${MonyHelper.formatMoney(widget.productDetailsEntity.pickedVariant?.price ?? widget.productDetailsEntity.price)} د.ع",
//                         textAlign: TextAlign.end,
//                         style: CustomAppFontStyle.regular13.copyWith(
//                           color: AppColors.red16,
//                           decoration: TextDecoration.lineThrough,
//                           decorationColor: AppColors.red16,
//                         ),
//                       ),
//                     ),
//                 ],
//               ),
//             ),
//             Transform.translate(
//               offset: const Offset(0, 4),
//               child: QuantitySelector(
//                 onAdd: () {
//                   widget.onAdd(widget.productDetailsEntity);
//                 },
//                 omMinus: () {
//                   widget.onMinus(widget.productDetailsEntity);
//                 },
//                 spacing: 17.5,
//                 initialValue:
//                     widget.productDetailsEntity.pickedVariant?.quantityInCart ??
//                     0,
//               ),
//             ),
//           ],
//         ),

//         titleInstead: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             CustomContainer(
//               padding: const EdgeInsets.all(2),
//               borderRaduis: 4,
//               gradientColors: AppGradient.pointCartGradient,
//               child: Text(
//                 "${widget.productDetailsEntity.point} نقطة",
//                 style: CustomAppFontStyle.regular12.copyWith(
//                   color: AppColors.white,
//                 ),
//               ),
//             ),
//             IconButton(
//               padding: EdgeInsets.zero,
//               // visualDensity: VisualDensity.compact,
//               style: IconButton.styleFrom(
//                 backgroundColor: AppColors.redEC,
//                 shape: // make it rectangle
//                 RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(6),
//                 ),
//                 iconSize: 24,
//                 padding: EdgeInsets.zero,
//                 maximumSize: const Size(24, 24),
//                 minimumSize: const Size(24, 24),
//                 tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//               ),
//               onPressed: () {
//                 showDialog(
//                   context: context,
//                   builder: (context) {
//                     return CustomTwoOptionDialog(
//                       title: "هل انت متأكد من حذف هذا المنتج من السلة ؟",
//                       buttonTitle: "حذف",
//                       onTap: () {
//                         widget.onRemove(widget.productDetailsEntity);
//                         context.pop();
//                       },
//                       // animate circle avatar
//                       contentWidget: const _AnimatedDeleteAvatar(),
//                       cancelTitle: "الغاء",
//                       backGroundColor: AppColors.red16,
//                     );
//                   },
//                 );
//               },

//               icon: Center(
//                 child: SvgPicture.asset(AppIcons.delete, height: 20, width: 20),
//               ),
//               color: AppColors.redEC,
//             ),
//           ],
//         ),
//         subtitle:
//             ("${widget.productDetailsEntity.name} (${widget.productDetailsEntity.pickedVariant?.size ?? ""}  ${widget.productDetailsEntity.pickedVariant?.color ?? ""})"),
//         subTitleStyle: CustomAppFontStyle.medium14.copyWith(
//           color: AppColors.black,
//         ),
//         // subtitle: ,
//       ),
//     );
//   }
// }

// // Continuous animated delete avatar widget
// class _AnimatedDeleteAvatar extends StatefulWidget {
//   const _AnimatedDeleteAvatar();

//   @override
//   State<_AnimatedDeleteAvatar> createState() => _AnimatedDeleteAvatarState();
// }

// class _AnimatedDeleteAvatarState extends State<_AnimatedDeleteAvatar>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _scaleAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 1000),
//       vsync: this,
//     )..repeat(reverse: true); // Continuous loop, reversing back and forth

//     _scaleAnimation = Tween<double>(
//       begin: 0.9,
//       end: 1.1,
//     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _scaleAnimation,
//       builder: (context, child) {
//         return Transform.scale(scale: _scaleAnimation.value, child: child);
//       },
//       child: CircleAvatar(
//         radius: 48,
//         backgroundColor: AppColors.redEC,
//         child: SvgPicture.asset(AppIcons.delete, width: 64, height: 64),
//       ),
//     );
//   }
// }
