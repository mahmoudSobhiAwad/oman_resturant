import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

import '../../core/utils/theme/app_colors.dart';
import '../../core/utils/theme/custom_app_font_styles.dart';

class CustomToast {
  final BuildContext context;
  final String header;
  final String? description;
  ToastificationType? type;
  final int duration;
  final AlignmentGeometry? alignment;
  CustomToast({
    required this.context,
    required this.header,
    this.description,
    this.alignment,
    this.duration = 3,
    this.type = ToastificationType.success,
  });

  void showTopToast() {
    toastification.show(
      closeOnClick: true,
      showIcon: type == ToastificationType.warning ? true : false,
      style: ToastificationStyle.minimal,
      foregroundColor: AppColors.beigeLight,
      alignment: Alignment.topCenter,
      primaryColor: AppColors.beigeDark,

      type: type,
      backgroundColor: AppColors.black22,
      borderSide: BorderSide(color: AppColors.beigeLight),
      context: context,
      title: Text(
        header,
        style: CustomAppFontStyle.regular15(context).copyWith(
          color: type == ToastificationType.success
              ? AppColors.white
              : AppColors.red,
        ),
        textAlign: TextAlign.start,
        maxLines: 3,
      ),

      description: description != null
          ? Text(description!, style: CustomAppFontStyle.regular14(context))
          : null,
      autoCloseDuration: Duration(seconds: duration),
    );
  }
}
