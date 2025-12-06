import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
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
    return ScreenUtilInit(
      designSize: const Size(375, 812), // mobile size
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      child: Builder(
        builder: (context) {
          return MaterialApp.router(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            title: "my_app",
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
            themeMode: ThemeMode.light,
            theme: MyAppTheme.lightTheme,
            darkTheme: MyAppTheme.darkTheme,
            scrollBehavior: const MaterialScrollBehavior().copyWith(
              dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch},
              overscroll: true,
              scrollbars: true,
            ),
          );
        },
      ),
    );
  }
}
