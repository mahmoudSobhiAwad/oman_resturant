// import 'package:huda_yousef/core/routing/routes.dart';
// import 'package:huda_yousef/core/utils/theme/app_animations.dart';
// import 'package:huda_yousef/core/utils/theme/custom_app_font_styles.dart';
// import 'package:huda_yousef/shared/widgets/custom_app_bar.dart';
// import 'package:huda_yousef/shared/widgets/custom_push_container_button.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:lottie/lottie.dart';

// class FailedPaymentView extends StatelessWidget {
//   const FailedPaymentView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return PopScope(
//       onPopInvokedWithResult: (result, _) {
//         if (result) {
//           context.go(AppRouter.customerAppLayout);
//         }
//       },
//       child: Scaffold(
//         appBar: MyCustomAppBar(
//           title: "العودة للصفحة الرئيسية",
//           onBack: () {
//             context.go(AppRouter.customerAppLayout);
//           },
//         ),
//         body: Center(
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Column(
//               spacing: 15,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 LottieBuilder.asset(AppAnimations.failedProcess),
//                 const Text(
//                   "عملية الدفع غير ناجحة",
//                   style: CustomAppFontStyle.regular16,
//                 ),
//                 CustomPushButton(
//                   onTap: () => context.go(AppRouter.customerAppLayout),
//                   child: const Center(
//                     child: Text(
//                       "العوده للصفحة الرئيسية",
//                       style: CustomAppFontStyle.regular14,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
