import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/theme/app_colors.dart';
import '../../utils/theme/app_icons.dart';

class ShimmerStoreCard extends StatefulWidget {
  const ShimmerStoreCard({super.key, this.imageWidth});

  final double? imageWidth;

  @override
  State<ShimmerStoreCard> createState() => _ShimmerStoreCardState();
}

class _ShimmerStoreCardState extends State<ShimmerStoreCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildShimmerBox({double? height, double? width, double radius = 8}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.grey.shade300,
                  Colors.grey.shade100,
                  Colors.grey.shade300,
                ],
                stops: const [0.1, 0.3, 0.4],
                begin: Alignment(-1 - 2 * _controller.value, -0.3),
                end: const Alignment(1, 0.3),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 4,
        children: [
          Stack(
            children: [
              _buildShimmerBox(
                height: 160,
                width: widget.imageWidth ?? double.infinity,
                radius: 12,
              ),
              PositionedDirectional(
                start: 8,
                bottom: 5,
                child: _buildShimmerBox(height: 20, width: 50, radius: 4),
              ),
              PositionedDirectional(
                end: 6,
                top: 8,
                child: _buildShimmerBox(height: 28, width: 28, radius: 8),
              ),
            ],
          ),
          const SizedBox(height: 8),
          _buildShimmerBox(height: 16, width: 140, radius: 4),
          const SizedBox(height: 6),
          Row(
            children: [
              SvgPicture.asset(AppIcons.location, height: 16, width: 16),
              const SizedBox(width: 6),
              _buildShimmerBox(height: 14, width: 100, radius: 4),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              SvgPicture.asset(AppIcons.time, height: 16, width: 16),
              const SizedBox(width: 6),
              _buildShimmerBox(height: 14, width: 140, radius: 4),
            ],
          ),
        ],
      ),
    );
  }
}
