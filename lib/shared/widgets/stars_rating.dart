import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/utils/theme/app_icons.dart';

class StarRating extends StatelessWidget {
  final num rating;
  final double iconSize;
  final int starCount;

  final MainAxisAlignment alignment;

  const StarRating({
    super.key,
    required this.rating,
    this.iconSize = 16,
    this.starCount = 5,
    this.alignment = MainAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> stars = [];
    int fullStars = rating.floor();
    bool hasHalfStar =
        (rating - fullStars) >= 0.25 && (rating - fullStars) < 0.75;
    int emptyStars = starCount - fullStars - (hasHalfStar ? 1 : 0);

    for (int i = 0; i < fullStars; i++) {
      stars.add(
        SvgPicture.asset(AppIcons.star, width: iconSize, height: iconSize),
      );
    }
    if (hasHalfStar) {
      stars.add(
        SvgPicture.asset(AppIcons.halfStar, width: iconSize, height: iconSize),
      );
    }
    for (int i = 0; i < emptyStars; i++) {
      stars.add(
        SvgPicture.asset(
          AppIcons.outlineStar,
          width: iconSize,
          height: iconSize,
        ),
      );
    }

    return Row(
      mainAxisAlignment: alignment,
      mainAxisSize: MainAxisSize.min,
      children: stars,
    );
  }
}
