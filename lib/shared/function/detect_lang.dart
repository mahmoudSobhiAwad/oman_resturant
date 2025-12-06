import '../../core/utils/constants/app_constants.dart';

String chooseFont(String text) {
  final arabicRegex = RegExp(r'[\u0600-\u06FF]');
  return arabicRegex.hasMatch(text)
      ? AppConstants.arabicFontFamily
      : 'WorkSans';
}
