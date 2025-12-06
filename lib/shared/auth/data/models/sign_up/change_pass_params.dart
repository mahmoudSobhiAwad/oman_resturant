class ChangePassParams {
  final String oldPassword;
  final String newPassword;

  ChangePassParams({required this.oldPassword, required this.newPassword});

  Map<String, dynamic> toJson() {
    return {'oldPassword': oldPassword, 'newPassword': newPassword};
  }
}
