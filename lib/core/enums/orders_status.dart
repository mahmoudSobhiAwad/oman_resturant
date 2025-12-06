import 'package:flutter/animation.dart';

import '../utils/theme/app_colors.dart';

enum OrdersStatusType {
  all("الكل"),
  waiting("قيد التجهيز"),
  shipped("قيد التوصيل"),
  completed("تم التسليم"),
  canceled("ملغي");

  const OrdersStatusType(this.arName);
  final String arName;

  static OrdersStatusType fromValue(String value) {
    return OrdersStatusType.values
            .where((type) => type.arName == value)
            .firstOrNull ??
        OrdersStatusType.waiting;
  }

  StatusData get data {
    switch (this) {
      case OrdersStatusType.waiting:
        return StatusData.pending();
      case OrdersStatusType.shipped:
        return StatusData.shipped();

      case OrdersStatusType.completed:
        return StatusData.completed();
      case OrdersStatusType.canceled:
        return StatusData.canceled();
      case OrdersStatusType.all:
        return StatusData.pending();
    }
  }
}

class StatusData {
  late final String name;
  late final Color color;
  late final Color backgroundColor;

  StatusData({
    required this.name,
    required this.color,
    required this.backgroundColor,
  });
  StatusData.pending({String? name, Color? color, Color? backgroundColor}) {
    this.name = "قيد التجهيز";
    this.color = color ?? AppColors.blueFF;
    this.backgroundColor = backgroundColor ?? AppColors.blueLightFF;
  }

  StatusData.shipped({String? name, Color? color, Color? backgroundColor}) {
    this.name = "قيد التوصيل";
    this.color = color ?? AppColors.yellowDark0A;
    this.backgroundColor = backgroundColor ?? AppColors.yellowLightF5;
  }

  StatusData.canceled({String? name, Color? color, Color? backgroundColor}) {
    this.name = "تم الغاء طلبك";
    this.color = color ?? AppColors.red16;
    this.backgroundColor = backgroundColor ?? AppColors.redFF4D;
  }

  StatusData.completed({String? name, Color? color, Color? backgroundColor}) {
    this.name = "تم التوصيل";
    this.color = color ?? AppColors.green46;
    this.backgroundColor = backgroundColor ?? AppColors.greenLight;
  }
}
