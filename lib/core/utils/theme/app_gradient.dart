import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppGradient {
  static const Gradient primaryGradient = LinearGradient(
    colors: [AppColors.beigeDark, AppColors.beigeLight],
    end: Alignment.topRight,
    begin: Alignment.bottomLeft,
  );
  static LinearGradient blackLinearGradient = LinearGradient(
    colors: [AppColors.black.withValues(alpha: 0), AppColors.black],
    stops: [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static LinearGradient productGradient = LinearGradient(
    colors: [
      AppColors.black22.withValues(alpha: 0),
      AppColors.black.withValues(alpha: 0.54),
      AppColors.black22,
    ],
    stops: [0.0, 0.54, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  ).withOpacity(0.3);
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
