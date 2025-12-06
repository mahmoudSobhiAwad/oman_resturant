// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:huda_yousef/core/utils/theme/app_colors.dart';

// class ImageCropperHelper {
//   static Future<File?> cropImage({
//     required File imageFile,
//     required BuildContext context,
//     int? maxWidth = 400,
//     int? maxHeight = 400,
//   }) async {
//     try {
//       final croppedFile = await ImageCropper().cropImage(
//         sourcePath: imageFile.path,
//         maxWidth: maxWidth,
//         maxHeight: maxHeight,
//         compressFormat: ImageCompressFormat.jpg,
//         compressQuality: 85,
//         uiSettings: [
//           AndroidUiSettings(
//             toolbarTitle: 'قص الصورة',
//             toolbarColor: AppColors.primary,
//             toolbarWidgetColor: AppColors.white,
//             initAspectRatio: CropAspectRatioPreset.square,
//             lockAspectRatio: true,
//             backgroundColor: AppColors.white,
//             activeControlsWidgetColor: AppColors.primary,
//             dimmedLayerColor: AppColors.black.withValues(alpha: 0.8),
//             cropFrameColor: AppColors.primary,
//             cropGridColor: AppColors.primary.withValues(alpha: 0.5),
//             cropFrameStrokeWidth: 2,
//             cropGridStrokeWidth: 1,
//             showCropGrid: true,
//             hideBottomControls: false,
//           ),
//           IOSUiSettings(
//             title: 'قص الصورة',
//             doneButtonTitle: 'تم',
//             cancelButtonTitle: 'إلغاء',
//             aspectRatioLockEnabled: true,
//             resetAspectRatioEnabled: false,
//             aspectRatioPickerButtonHidden: true,
//             rotateButtonsHidden: false,
//             rotateClockwiseButtonHidden: false,
//             hidesNavigationBar: false,
//             minimumAspectRatio: 1.0,
//           ),
//           WebUiSettings(context: context),
//         ],
//       );

//       if (croppedFile != null) {
//         return File(croppedFile.path);
//       }
//       return null;
//     } catch (e) {
//       // Show user-friendly error message
//       if (context.mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('حدث خطأ أثناء قص الصورة. يرجى المحاولة مرة أخرى.'),
//             backgroundColor: AppColors.redFF4D,
//           ),
//         );
//       }
//       return null;
//     }
//   }

//   static Future<File?> cropProfileImage({
//     required File imageFile,
//     required BuildContext context,
//   }) async {
//     return await cropImage(
//       imageFile: imageFile,
//       context: context,
//       maxWidth: 400,
//       maxHeight: 400,
//     );
//   }
// }
