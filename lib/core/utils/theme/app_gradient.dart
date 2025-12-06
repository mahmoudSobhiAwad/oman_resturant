import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppGradient {
  static const Gradient pointCartGradient = LinearGradient(
    colors: [Color(0xffFFC370), Color(0xffFF990A)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const LinearGradient blackLinearGradient = LinearGradient(
    colors: [AppColors.gray5D, AppColors.black],
    stops: [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const Gradient productBadge = LinearGradient(
    colors: [AppColors.red16, AppColors.red77],
    stops: [0.0, 1.0],
    begin: AlignmentDirectional.centerStart,
    end: AlignmentDirectional.centerEnd,
  );
  static const Gradient cover = LinearGradient(
    colors: [
      Color(0xFFC6C3C3),
      Color(0xFFB6B5B5),
      Color(0xFFE0E0E0),

      Color(0xFFE0E0E0),
      Color(0xFFB6B5B5),
      Color(0xFFC6C3C3),
    ],

    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
