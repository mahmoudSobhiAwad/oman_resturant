import '../../../../../core/utils/constants/app_constants.dart';

class SignUpParams {
  final String? name;
  final String? phone;
  final String? password;
  final String? userName;
  String? code;
  final String? promoCode;

  SignUpParams({
    this.name,
    this.phone,
    this.code,
    this.password,
    this.userName,
    this.promoCode,
  });

  Map<String, dynamic> toVerifyNumber() {
    // return {"phone": "+201093080158"};
    return {"phone": "${AppConstants.phoneCode}$phone"};
  }

  Map<String, dynamic> toJson() {
    return {
      "fullName": name,
      "userName": userName,
      "phone": "${AppConstants.phoneCode}$phone",
      "password": password,
    };
  }
}
