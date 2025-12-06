import 'package:flutter/material.dart';
import 'screen_width_breakpoints.dart';

class ResponsiveFontSize {
  static double getResponsiveFontSize(BuildContext context, double fontSize) {
    double scaleFactor = getScaleFactor(context);
    double responsiveFontSize = fontSize * scaleFactor;

    double lowerLimit = fontSize * 0.8;
    double upperLimit = fontSize * 1.08;

    return responsiveFontSize.clamp(lowerLimit, upperLimit);
  }

  static double getScaleFactor(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    if (width < ScreenWidthBreakpoints.tablet) {
      return width / 400;
    } else if (width < ScreenWidthBreakpoints.desktop) {
      return width / 650;
    } else {
      return width / 1200;
    }
  }
}
