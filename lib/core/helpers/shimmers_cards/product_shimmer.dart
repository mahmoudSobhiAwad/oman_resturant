import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomProductCardShimmer extends StatelessWidget {
  const CustomProductCardShimmer({
    super.key,
    this.itemWidth,
    this.imageWidth,
    this.isGrid = false,
  });

  final double? itemWidth;
  final double? imageWidth;
  final bool isGrid;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: itemWidth ?? 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image placeholder
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              height: 166,
              width: imageWidth ?? 160,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(height: 8),
          // Product name placeholder
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              height: 14,
              width: double.infinity,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 6),
          // Price placeholders
          Row(
            children: [
              Expanded(
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    height: 14,
                    width: double.infinity,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
