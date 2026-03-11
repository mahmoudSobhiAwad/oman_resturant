// make custom asset to check the last . to make it svg or image.asset , take color , width , height , fit
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAssetImage extends StatelessWidget {
  const CustomAssetImage({
    super.key,
    required this.path,
    this.color,
    this.width,
    this.height,
    this.fit,
  });

  final String path;
  final Color? color;
  final double? width;
  final double? height;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    if (path.endsWith('.svg')) {
      return SvgPicture.asset(
        path,
        colorFilter: color != null
            ? ColorFilter.mode(color!, BlendMode.srcIn)
            : null,
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
      );
    } else {
      return Image.asset(
        path,
        color: color,
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
      );
    }
  }
}
