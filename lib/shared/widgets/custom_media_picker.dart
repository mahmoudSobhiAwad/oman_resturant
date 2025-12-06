import '../../core/utils/theme/app_colors.dart';
import '../../core/utils/theme/app_icons.dart';
import '../../core/utils/theme/custom_app_font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class CustomMediaPicker extends StatefulWidget {
  const CustomMediaPicker({super.key, required this.pickImage});

  final void Function(String? path) pickImage;

  @override
  State<CustomMediaPicker> createState() => _CustomMediaPickerState();
}

class _CustomMediaPickerState extends State<CustomMediaPicker> {
  final ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      insetPadding: EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ).copyWith(bottom: 24),
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 16,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CloseButton(color: AppColors.white, onPressed: () {}),

                Text("اختر صورة", style: CustomAppFontStyle.regular14),

                CloseButton(),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    imagePicker.pickImage(source: ImageSource.camera).then((
                      value,
                    ) {
                      if (value != null) {
                        widget.pickImage(value.path);
                      }
                    });
                  },
                  child: Column(
                    spacing: 5,
                    children: [
                      SvgPicture.asset(
                        AppIcons.camera,
                        width: 50,
                        colorFilter: const ColorFilter.mode(
                          AppColors.primary,
                          BlendMode.srcIn,
                        ),
                      ),
                      const Text(
                        "الكاميرا ",
                        style: CustomAppFontStyle.regular14,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 3,
                  height: 60,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: AppColors.gray92,
                  ),
                ),
                InkWell(
                  onTap: () {
                    imagePicker.pickImage(source: ImageSource.gallery).then((
                      value,
                    ) {
                      if (value != null) {
                        widget.pickImage(value.path);
                      }
                    });
                  },
                  child: Column(
                    spacing: 5,
                    children: [
                      SvgPicture.asset(
                        AppIcons.gallery,
                        width: 50,
                        colorFilter: const ColorFilter.mode(
                          AppColors.primary,
                          BlendMode.srcIn,
                        ),
                      ),
                      const Text(
                        "المعرض ",
                        style: CustomAppFontStyle.regular14,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
