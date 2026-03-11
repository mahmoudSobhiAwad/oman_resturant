import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

import 'core/routing/app_router.dart';
import 'core/utils/theme/app_theme.dart';

// import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(context) {
    return Builder(
      builder: (context) {
        return MaterialApp.router(
          title: "Resturant-Task",
          routerConfig: appRouter,
          builder: (context, child) {
            final mediaQuery = MediaQuery.of(context);
            return MediaQuery(
              data: mediaQuery.copyWith(
                boldText: false,
                textScaler: const TextScaler.linear(1),
              ),
              child: child!,
            );
          },
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.dark,
          theme: MyAppTheme.lightTheme,
          darkTheme: MyAppTheme.darkTheme,
          scrollBehavior: const MaterialScrollBehavior().copyWith(
            dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch},
            overscroll: true,
            scrollbars: true,
          ),
        );
      },
    );
  }
}
