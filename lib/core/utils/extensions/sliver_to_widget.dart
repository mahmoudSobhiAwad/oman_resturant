import 'package:flutter/material.dart';

extension SliverWidgetExtension on Widget {
  SliverToBoxAdapter toSliver() {
    return SliverToBoxAdapter(child: this);
  }
}
