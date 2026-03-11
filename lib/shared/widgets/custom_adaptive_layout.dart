import 'package:flutter/material.dart';

class CustomAdaptiveLayout extends StatelessWidget {
  const CustomAdaptiveLayout({
    super.key,
    required this.desktopLayout,
    required this.mobileLayout,
    required this.tabletLayout,
    this.phoneMaxWidth = 750,
    this.tabletMaxWidth = 1140,
  });

  final WidgetBuilder mobileLayout, desktopLayout, tabletLayout;
  final double phoneMaxWidth;
  final double tabletMaxWidth;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        if (constraint.maxWidth < phoneMaxWidth) {
          return mobileLayout(context);
        } else if (constraint.maxWidth < tabletMaxWidth) {
          return tabletLayout(context);
        } else {
          return desktopLayout(context);
        }
      },
    );
  }
}
