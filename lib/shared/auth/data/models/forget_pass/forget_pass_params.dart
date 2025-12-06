import '../../../../../core/utils/constants/app_constants.dart';

class ForgetPassParams {
  final String password;
  final String confirmPassword;
  final String phoneNumber;

  ForgetPassParams({
    required this.password,
    required this.confirmPassword,
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      "password": password,

      //"confirmPassword": confirmPassword,
      'phone': "${AppConstants.phoneCode}$phoneNumber",

      //'code': otpCode,
    };
  }
}
