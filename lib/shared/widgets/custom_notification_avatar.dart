// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:go_router/go_router.dart';
// import 'package:huda_yousef/core/enums/role_enum.dart';
// import 'package:huda_yousef/core/routing/routes.dart';
// import 'package:huda_yousef/core/services/notification_badge_service.dart';
// import 'package:huda_yousef/core/utils/theme/app_colors.dart';
// import 'package:huda_yousef/core/utils/theme/app_icons.dart';

// class CustomNotificationAvatar extends StatefulWidget {
//   const CustomNotificationAvatar({
//     super.key,
//     this.role = RoleEnum.user,
//     this.onTap,
//   });

//   final RoleEnum role;
//   final VoidCallback? onTap;

//   @override
//   State<CustomNotificationAvatar> createState() =>
//       _CustomNotificationAvatarState();
// }

// class _CustomNotificationAvatarState extends State<CustomNotificationAvatar>
//     with WidgetsBindingObserver {
//   final NotificationBadgeService _badgeService = NotificationBadgeService();

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addObserver(this);
//     _badgeService.initialize();
//   }

//   @override
//   void dispose() {
//     WidgetsBinding.instance.removeObserver(this);
//     super.dispose();
//   }

//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     super.didChangeAppLifecycleState(state);
//     if (state == AppLifecycleState.resumed) {
//       // App came to foreground, refresh badge service
//       _badgeService.initialize();
//     }
//   }

//   void _handleNotificationTap() {
//     // Clear the new notification flag
//     _badgeService.clearNewNotificationFlag();

//     // Navigate to notifications screen
//     if (widget.onTap != null) {
//       widget.onTap!();
//     } else {
//       // Default navigation based on role
//       final route = widget.role == RoleEnum.user
//           ? AppRouter.customerNotificationPage
//           : AppRouter.storeNotification;
//       context.push(route);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<NotificationBadgeState>(
//       stream: _badgeService.badgeStream,
//       initialData: NotificationBadgeState(
//         unreadCount: _badgeService.unreadCount,
//         hasNewNotifications: _badgeService.hasNewNotifications,
//       ),
//       builder: (context, snapshot) {
//         final badgeState = snapshot.data!;

//         return Padding(
//           padding: const EdgeInsetsDirectional.only(top: 5.0, end: 20),
//           child: InkWell(
//             onTap: _handleNotificationTap,
//             borderRadius: BorderRadius.circular(20),
//             child: CircleAvatar(
//               backgroundColor: AppColors.lightGreyF5,
//               radius: 20,
//               child: _buildNotificationIcon(badgeState),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildNotificationIcon(NotificationBadgeState badgeState) {
//     if (badgeState.hasNewNotifications || badgeState.unreadCount > 0) {
//       return Badge(
//         offset: const Offset(12, -4),
//         backgroundColor: AppColors.white,
//         label: badgeState.unreadCount > 0
//             ? CircleAvatar(
//                 radius: 8,
//                 backgroundColor: AppColors.yellow24x,
//                 child: Text(
//                   badgeState.unreadCount > 99
//                       ? '99+'
//                       : badgeState.unreadCount.toString(),
//                   style: const TextStyle(
//                     color: AppColors.white,
//                     fontSize: 10,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               )
//             : const CircleAvatar(
//                 radius: 4,
//                 backgroundColor: AppColors.yellow24x,
//               ),
//         child: SvgPicture.asset(AppIcons.notification),
//       );
//     }

//     return SvgPicture.asset(AppIcons.notification);
//   }
// }
