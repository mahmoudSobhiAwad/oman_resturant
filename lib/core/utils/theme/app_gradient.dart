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
  );
}
