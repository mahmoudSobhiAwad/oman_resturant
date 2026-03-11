import 'package:task_app/core/utils/theme/app_gradient.dart';
import 'package:flutter/cupertino.dart';

class CustomShaderText extends StatelessWidget {
  const CustomShaderText({super.key, this.title, this.fontStyle});
  final String? title;
  final TextStyle? fontStyle;
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) =>
          AppGradient.primaryGradient.createShader(bounds),
      child: Text(title ?? "", style: fontStyle),
    );
  }
}
