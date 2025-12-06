import 'dart:io';
import 'package:app_core/shared/widgets/custom_box_validator.dart' show CustomBoxValidator;
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../core/enums/image_types.dart';
import '../../core/utils/theme/app_colors.dart';
import '../../core/utils/theme/app_icons.dart';
import '../../core/utils/theme/custom_app_font_styles.dart';
import 'custom_cached_image.dart';
import 'custom_media_picker.dart';

class AddProfilePicImage extends StatefulWidget {
  const AddProfilePicImage({super.key, this.initialImage, this.onChanged});

  final ImageTypeModel? initialImage;

  final ValueChanged<ImageTypeModel?>? onChanged;

  @override
  State<AddProfilePicImage> createState() => _AddProfilePicImageState();
}

class _AddProfilePicImageState extends State<AddProfilePicImage> {
  ImageTypeModel? imageTypeModel;

  @override
  void initState() {
    super.initState();
    imageTypeModel = widget.initialImage;
  }

  void _pickImage(void Function(ImageTypeModel?) didChange) {
    showDialog(
      context: context,
      builder: (context) {
        return CustomMediaPicker(
          pickImage: (value) {
            if (value != null) {
              context.pop();
              final newImage = ImageTypeModel(
                type: ImageType.file,
                path: value,
              );
              setState(() => imageTypeModel = newImage);
              didChange(newImage);
              widget.onChanged?.call(newImage);
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (imageTypeModel?.path != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ClipOval(
                child: imageTypeModel!.type == ImageType.file
                    ? Image.file(
                        File(imageTypeModel!.path),
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      )
                    : CustomCachedImage(
                        imagePath: imageTypeModel!.path,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    onPressed: () {
                      _pickImage((_) {});
                    },
                    child: Row(
                      children: [
                        Text(
                          "تغيير الصورة",
                          style: CustomAppFontStyle.regular14.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                        const SizedBox(width: 4),
                        SvgPicture.asset(AppIcons.gallery),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() => imageTypeModel = null);
                      widget.onChanged?.call(null);
                    },
                    child: Row(
                      children: [
                        Text(
                          "حذف الصورة",
                          style: CustomAppFontStyle.regular14.copyWith(
                            color: AppColors.red,
                          ),
                        ),
                        const SizedBox(width: 4),
                        SvgPicture.asset(AppIcons.delete),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )
        else
          CustomBoxValidator<ImageTypeModel>(
            validator: (value) {
              if (value == null || value.path.isEmpty) {
                return "الرجاء إضافة صورة للحيوان";
              }
              return null;
            },
            builder: (state) {
              return InkWell(
                onTap: () => _pickImage(state.didChange),
                child: DottedBorder(
                  options: RoundedRectDottedBorderOptions(
                    dashPattern: [6, 3],
                    radius: Radius.circular(12),
                    strokeWidth: 1,
                    color: AppColors.grayD9,
                    padding: EdgeInsets.all(16),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Column(
                        spacing: 4,
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: AppColors.grayF5,
                            child: SvgPicture.asset(AppIcons.addImage),
                          ),
                          Text(
                            "قم برفع صورة واضحة لحيوانك",
                            style: CustomAppFontStyle.regular14.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
      ],
    );
  }
}

class ImageTypeModel {
  final ImageType type;
  final String path;

  ImageTypeModel({required this.type, required this.path});

  factory ImageTypeModel.fromJson(String image) {
    return ImageTypeModel(type: ImageType.network, path: image);
  }

  Map<String, dynamic> toJson() {
    return {'type': type.name, 'path': path};
  }
}
