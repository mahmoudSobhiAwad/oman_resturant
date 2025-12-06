import '../../../../../core/enums/role_enum.dart';

class LoginParamModel {
  final String phoneNumber;
  final String password;
  final RoleEnum roleEnum;

  LoginParamModel({
    required this.phoneNumber,
    required this.password,
    required this.roleEnum,
  });

  Map<String, dynamic> toJson() => {
    'userName': phoneNumber,
    'password': password,
  };
}
