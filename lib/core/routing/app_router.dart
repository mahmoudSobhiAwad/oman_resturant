import 'dart:io';
import 'package:app_core/core/enums/role_enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../shared/app_layout/presentation/pages/customer_layout_page.dart';
import '../../shared/auth/presentation/pages/forget_pass_page.dart';
import '../../shared/auth/presentation/pages/login_page.dart';
import '../../shared/auth/presentation/pages/sign_up_page.dart';
import '../../shared/auth/presentation/pages/terms_and_conditions.dart';
import '../storage/cache_helper.dart';
import '../utils/constants/app_constants.dart';
import 'routes.dart';

final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

// Animation Types Enum
enum AnimationType {
  fade,
  slide,
  scale,
  rotation,
  slideFromBottom,
  slideFromTop,
  slideFromLeft,
  slideFromRight,
  cupertino,
}

// Custom Page Builder with Animation Support
Page<T> buildAnimatedPage<T extends Object?>({
  required Widget child,
  required LocalKey key,
  AnimationType animationType = AnimationType.fade,
  Duration duration = const Duration(milliseconds: 300),
  Curve curve = Curves.easeInOut,
}) {
  // Use Cupertino page for iOS
  if (Platform.isIOS && animationType == AnimationType.cupertino) {
    return CupertinoPage<T>(key: key, child: child);
  }

  return CustomTransitionPage<T>(
    key: key,
    child: child,
    transitionDuration: duration,
    reverseTransitionDuration: duration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return _getAnimationTransition(
        animationType,
        animation,
        secondaryAnimation,
        child,
        curve,
      );
    },
  );
}

// Animation Builder Function
Widget _getAnimationTransition(
  AnimationType type,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
  Curve curve,
) {
  final curvedAnimation = CurvedAnimation(parent: animation, curve: curve);

  switch (type) {
    case AnimationType.fade:
      return FadeTransition(opacity: curvedAnimation, child: child);

    case AnimationType.slide:
    case AnimationType.slideFromRight:
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).animate(curvedAnimation),
        child: child,
      );

    case AnimationType.slideFromLeft:
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(-1.0, 0.0),
          end: Offset.zero,
        ).animate(curvedAnimation),
        child: child,
      );

    case AnimationType.slideFromBottom:
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0.0, 1.0),
          end: Offset.zero,
        ).animate(curvedAnimation),
        child: child,
      );

    case AnimationType.slideFromTop:
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0.0, -1.0),
          end: Offset.zero,
        ).animate(curvedAnimation),
        child: child,
      );

    case AnimationType.scale:
      return ScaleTransition(
        scale: curvedAnimation,
        child: FadeTransition(opacity: curvedAnimation, child: child),
      );

    case AnimationType.rotation:
      return RotationTransition(
        turns: curvedAnimation,
        child: FadeTransition(opacity: curvedAnimation, child: child),
      );

    case AnimationType.cupertino:
      return FadeTransition(opacity: curvedAnimation, child: child);
  }
}

// Enhanced Custom Transition Page
class CustomTransitionPage<T> extends Page<T> {
  const CustomTransitionPage({
    required this.child,
    this.transitionDuration = const Duration(milliseconds: 300),
    this.reverseTransitionDuration = const Duration(milliseconds: 300),
    this.transitionsBuilder,
    super.key,
    super.name,
    super.arguments,
    super.restorationId,
  });

  final Widget child;
  final Duration transitionDuration;
  final Duration reverseTransitionDuration;
  final RouteTransitionsBuilder? transitionsBuilder;

  @override
  Route<T> createRoute(BuildContext context) {
    return _PageBasedPageRoute<T>(
      page: this,
      transitionsBuilder: transitionsBuilder,
    );
  }
}

class _PageBasedPageRoute<T> extends PageRoute<T> {
  _PageBasedPageRoute({
    required CustomTransitionPage<T> page,
    this.transitionsBuilder,
  }) : super(settings: page);

  CustomTransitionPage<T> get _page => settings as CustomTransitionPage<T>;
  final RouteTransitionsBuilder? transitionsBuilder;

  @override
  bool get barrierDismissible => false;

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  Duration get transitionDuration => _page.transitionDuration;

  @override
  Duration get reverseTransitionDuration => _page.reverseTransitionDuration;

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return _page.child;
  }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return transitionsBuilder?.call(
          context,
          animation,
          secondaryAnimation,
          child,
        ) ??
        FadeTransition(opacity: animation, child: child);
  }
}

final GoRouter appRouter = GoRouter(
  observers: [routeObserver],
  initialLocation:
      AppSharedPreferences.getString(key: AppConstants.accessToken) != null
      ? AppRouter.customerAppLayout
      // ? getRoleEnum() == RoleEnum.user
      //       ? AppRouter.customerAppLayout
      //       : AppRouter.storeLayout
      // : getRoleEnum() == null
      // ? AppRouter.splashScreen
      : AppRouter.login,
  routes: [
    // GoRoute(
    //   path: AppRouter.splashScreen,
    //   name: AppRouter.splashScreen,
    //   pageBuilder: (context, state) => buildAnimatedPage(
    //     key: state.pageKey,
    //     child: const VideoSplashScreen(),
    //     animationType: AnimationType.scale,
    //     duration: const Duration(milliseconds: 400),
    //     curve: Curves.elasticOut,
    //   ),
    // ),
    GoRoute(
      path: AppRouter.login,
      name: AppRouter.login,
      // redirect: (context, state) {
      //   if (getRoleEnum() == null) {
      //     return AppRouter.splashScreen;
      //   }
      //   return null;
      // },
      pageBuilder: (context, state) => buildAnimatedPage(
        key: state.pageKey,
        child: LoginPage(roleEnum: getRoleEnum() ?? RoleEnum.user),
        animationType: Platform.isIOS
            ? AnimationType.cupertino
            : AnimationType.slideFromRight,
      ),
    ),

    GoRoute(
      path: AppRouter.forgetPassword,
      name: AppRouter.forgetPassword,
      pageBuilder: (context, state) => buildAnimatedPage(
        key: state.pageKey,
        child: const ForgetPassPage(),
        animationType: Platform.isIOS
            ? AnimationType.cupertino
            : AnimationType.slideFromBottom,
      ),
    ),

    GoRoute(
      path: AppRouter.signUp,
      name: AppRouter.signUp,
      pageBuilder: (context, state) => buildAnimatedPage(
        key: state.pageKey,
        child: const SignUp(),
        animationType: Platform.isIOS
            ? AnimationType.cupertino
            : AnimationType.slideFromRight,
      ),
    ),

    GoRoute(
      path: AppRouter.termsAndConditions,
      name: AppRouter.termsAndConditions,
      pageBuilder: (context, state) => buildAnimatedPage(
        key: state.pageKey,
        child: TermsAndConditions(),
        animationType: AnimationType.slideFromBottom,
      ),
    ),

    GoRoute(
      path: AppRouter.customerAppLayout,
      name: AppRouter.customerAppLayout,
      pageBuilder: (context, state) => buildAnimatedPage(
        key: state.pageKey,
        child: CustomerAppLayout(initialIndex: state.extra as int? ?? 0),
        animationType: AnimationType.fade,
        duration: const Duration(milliseconds: 500),
      ),
    ),
    // GoRoute(
    //   path: AppRouter.failedPaymentView,
    //   name: AppRouter.failedPaymentView,
    //   pageBuilder: (context, state) => buildAnimatedPage(
    //     key: state.pageKey,
    //     child: const FailedPaymentView(),
    //     animationType: AnimationType.fade,
    //     duration: const Duration(milliseconds: 500),
    //   ),
    // ),
  ],
);

RoleEnum? getRoleEnum() {
  final value = AppSharedPreferences.getString(key: AppConstants.roleName);
  if (value == null) return null;
  RoleEnum? role = RoleEnum.values.byName(
    AppSharedPreferences.getString(key: AppConstants.roleName) ?? "user",
  );
  return role;
}
