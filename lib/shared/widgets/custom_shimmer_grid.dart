import 'package:flutter/material.dart';

import 'custom_shimmer_container.dart';

class CustomShimmerGrid extends StatelessWidget {
  const CustomShimmerGrid({
    super.key,
    this.maxWidt = 1300,
    this.containerHeight = 200,
    this.containerWidth = 200,
    this.count = 6,
    this.crossAxisCount = 3,
  });

  final double maxWidt;
  final double containerHeight;
  final double containerWidth;
  final int count;
  final int crossAxisCount;

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.sizeOf(context).width < 500;
    bool isTablet = MediaQuery.sizeOf(context).width < 900;
    bool isDesktop = MediaQuery.sizeOf(context).width > 901;
    return Column(
      children: [
        // const SizedBox(height: 24),
        Expanded(
          child: CustomShimerGridOnly(
            isMobile: isMobile,
            crossAxisCount: crossAxisCount,
            isTablet: isTablet,
            isDesktop: isDesktop,
            containerHeight: containerHeight,
            containerWidth: containerWidth,
            count: count,
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}

class CustomShimerGridOnly extends StatelessWidget {
  const CustomShimerGridOnly({
    super.key,
    required this.isMobile,
    required this.crossAxisCount,
    required this.isTablet,
    required this.isDesktop,
    required this.containerHeight,
    required this.containerWidth,
    required this.count,
  });

  final bool isMobile;
  final int crossAxisCount;
  final bool isTablet;
  final bool isDesktop;
  final double containerHeight;
  final double containerWidth;
  final int count;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isMobile
            ? (crossAxisCount == 1 || crossAxisCount == 2
                  ? crossAxisCount
                  : crossAxisCount - 2)
            : isTablet
            ? (crossAxisCount == 1 ? crossAxisCount : crossAxisCount - 1)
            : isDesktop
            ? crossAxisCount
            : crossAxisCount,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        return CustomShimmerContainer(
          height: containerHeight,
          width: containerWidth,
        );
      },
      itemCount: count,
    );
  }
}
