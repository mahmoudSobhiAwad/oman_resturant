
import '../../../../core/enums/role_enum.dart';

class UserModel {
  final String name;
  final String id;
  final String accessToken;
  final String refreshToken;
  final String role;
  final String? phoneNumber;
  final String? userName;
  final String? imagePath;

  UserModel({
    required this.name,
    required this.accessToken,
    required this.id,
    required this.role,
    this.phoneNumber,
    required this.refreshToken,
    this.userName,
    this.imagePath,
  });

  factory UserModel.fromJson(
    Map<String, dynamic> json, {
    RoleEnum roleEnum = RoleEnum.user,
  }) {
    return UserModel(
      name: json['data']['fullName'],
      id: json['data']['_id'],
      accessToken: json['accessToken'],
      role: roleEnum.name,
      refreshToken: json['refreshToken'],
      phoneNumber: json['data']['phone'],
    );
  }
  factory UserModel.fromOrder(Map<String, dynamic> json) {
    return UserModel(
      name: json['fullName'],
      id: json['_id'],
      phoneNumber: json['phone'],
      accessToken: '',
      role: '',
      refreshToken: '',
    );
  }
  factory UserModel.fromReview(Map<String, dynamic> json) {
    return UserModel(
      name: json['fullName'],
      id: json['_id'],
      accessToken: '',
      role: '',
      refreshToken: '',
      imagePath: json['imagePath'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'displayName': name,
      '_id': id,
      'accessToken': accessToken,
      'role': role,
      'refreshToken': refreshToken,
      if (phoneNumber != null) 'phone': phoneNumber,
    };
  }
}
