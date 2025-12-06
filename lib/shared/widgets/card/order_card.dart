// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:lottie/lottie.dart';
// import 'package:toastification/toastification.dart';

// class OrderCard extends StatelessWidget {
//   const OrderCard({super.key, required this.order});

//   final OrderModel order;

//   @override
//   Widget build(BuildContext context) {
//     final num count = order.cartItems.fold(
//       0,
//       (sum, item) => sum + (item.pickedVariant?.quantityInCart ?? 0),
//     );
//     return CustomContainer(
//       borderRaduis: 14,
//       child: Column(
//         spacing: 8,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 DateFormat(
//                   "dd MMMM yyyy",
//                   "ar",
//                 ).format(order.createdAt ?? DateTime.now()),
//                 style: CustomAppFontStyle.medium14.copyWith(
//                   color: AppColors.gray52,
//                 ),
//               ),
//               CustomOrderStatusWidget(status: order.status!.data),
//             ],
//           ),
//           CustomContainer(
//             borderRaduis: 8,
//             backGroundColor: AppColors.grayFA,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               spacing: 4,
//               children: [
//                 Text("#${order.code}", style: CustomAppFontStyle.medium16),
//                 Row(
//                   spacing: 8,
//                   children: [
//                     Text.rich(
//                       TextSpan(
//                         children: [
//                           TextSpan(
//                             text: MonyHelper.formatMoney(
//                               order.totalOrderPrice ?? 0,
//                             ),
//                             style: CustomAppFontStyle.regular14.copyWith(
//                               color: AppColors.gray52,
//                             ),
//                           ),
//                           TextSpan(
//                             text: " د.ع",
//                             style: CustomAppFontStyle.medium14.copyWith(
//                               color: AppColors.gray52,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const CircleAvatar(
//                       radius: 4,
//                       backgroundColor: AppColors.grayD1,
//                     ),
//                     Text(
//                       ArabicPluralHelper.orderPlural(count.toInt()),
//                       style: CustomAppFontStyle.regular14.copyWith(
//                         color: AppColors.gray52,
//                       ),
//                     ),
//                     const CircleAvatar(
//                       radius: 4,
//                       backgroundColor: AppColors.grayD1,
//                     ),
//                     Text(
//                       "+${order.productPoints} نقطة",
//                       style: CustomAppFontStyle.regular14.copyWith(
//                         color: AppColors.gray52,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(),
//                 SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Row(
//                     spacing: 4,
//                     children: [
//                       ...List.generate(order.cartItems.length, (index) {
//                         return ClipRRect(
//                           borderRadius: BorderRadius.circular(4),
//                           child: CustomCachedImage(
//                             imagePath:
//                                 order.cartItems[index].pickedVariant?.image ??
//                                 order.cartItems[index].imageCover,
//                             fromApi: true,
//                             width: 32,
//                             height: 32,
//                           ),
//                         );
//                       }),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 Row(
//                   spacing: 8,
//                   children: [
//                     Expanded(
//                       child: CustomPushButton(
//                         onTap: () {
//                           context.push(AppRouter.singleOrderPage, extra: order);
//                         },
//                         padding: const EdgeInsets.symmetric(vertical: 4),
//                         height: 40,
//                         radius: 4,
//                         child: Center(
//                           child: Text(
//                             "تفاصيل الطلب",
//                             style: CustomAppFontStyle.medium14.copyWith(
//                               color: AppColors.white,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     if (order.status == OrdersStatusType.waiting)
//                       Expanded(
//                         child: CustomPushButton(
//                           onTap: () {
//                             var cubit = context.read<CustomerOrderCubit>();
//                             showDialog(
//                               context: context,
//                               builder: (_) {
//                                 return BlocConsumer<
//                                   CustomerOrderCubit,
//                                   CustomerOrderState
//                                 >(
//                                   bloc: cubit,
//                                   listener: (context, state) {
//                                     if (state is SuccessCancelOrderState) {
//                                       context.pop();
//                                       CustomToast(
//                                         context: context,
//                                         header: "تم الغاء طلبك بنجاح",
//                                       ).showTopToast();
//                                       cubit.getAllOrders(
//                                         status: order.status?.name,
//                                       );
//                                     } else if (state is ErrorCancelOrderState) {
//                                       CustomToast(
//                                         context: context,
//                                         header: state.message,
//                                         type: ToastificationType.error,
//                                       ).showTopToast();
//                                     }
//                                   },
//                                   builder: (context, state) {
//                                     return CustomTwoOptionDialog(
//                                       isLoading:
//                                           state is LoadingCancelOrderState,
//                                       title: "هل انت متأكد من الغاء طلبك ؟",
//                                       buttonTitle: "الغاء الطلب",
//                                       backGroundColor: AppColors.red16,
//                                       cancelTitle: "رجوع",
//                                       contentWidget: Lottie.asset(
//                                         AppAnimations.cancelOrder,
//                                       ),
//                                       iconColor: AppColors.white,
//                                       iconPathBeside: AppIcons.delete,
//                                       cancelTitleTextStyle: CustomAppFontStyle
//                                           .regular14
//                                           .copyWith(color: AppColors.black),
//                                       onTap: () {
//                                         cubit.cancelOrder(orderId: order.id!);
//                                       },
//                                     );
//                                   },
//                                 );
//                               },
//                             );
//                           },
//                           backgroundColor: AppColors.white,
//                           padding: const EdgeInsets.symmetric(vertical: 4),
//                           height: 40,
//                           radius: 4,
//                           boxBorder: Border.all(
//                             color: AppColors.black,
//                             width: 1,
//                           ),
//                           child: Center(
//                             child: Text(
//                               "إلغاء الطلب",
//                               style: CustomAppFontStyle.medium14.copyWith(
//                                 color: AppColors.black,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// enum CustomerOrderStatus {
//   processing(
//     0,
//     backgroundColor: AppColors.grayF5,
//     textColor: AppColors.gray3D,
//     displayName: "جديد",
//   ),
//   confirmed(
//     1,
//     backgroundColor: AppColors.blueLightFF,
//     textColor: AppColors.blueFF,
//     displayName: "قيد التجهيز",
//   ),
//   inDelivery(
//     2,
//     backgroundColor: AppColors.yellowLightF5,
//     textColor: AppColors.yellowDark0A,
//     displayName: "قيد التوصيل",
//   ),
//   completed(
//     3,
//     backgroundColor: AppColors.greenLight,
//     textColor: AppColors.green,
//     displayName: "تم التوصيل",
//   ),
//   canceled(
//     4,
//     backgroundColor: AppColors.red16,
//     textColor: AppColors.redFF4D,
//     displayName: "ملغي",
//   );

//   final int value;
//   final Color? backgroundColor;
//   final Color? textColor;
//   final String? displayName;
//   const CustomerOrderStatus(
//     this.value, {
//     this.backgroundColor,
//     this.textColor,
//     this.displayName,
//   });
// }

// class CustomOrderStatusWidget extends StatelessWidget {
//   const CustomOrderStatusWidget({super.key, required this.status});
//   final StatusData status;
//   @override
//   Widget build(BuildContext context) {
//     return CustomContainer(
//       borderRaduis: 4,
//       backGroundColor: status.backgroundColor,
//       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
//       child: Text(
//         status.name,
//         style: CustomAppFontStyle.regular12.copyWith(color: status.color),
//       ),
//     );
//   }
// }
