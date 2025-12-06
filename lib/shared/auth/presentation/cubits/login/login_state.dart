part of 'login_cubit.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class ChangeVisibilityState extends LoginState {
  final bool value;

  ChangeVisibilityState({required this.value});
}

final class LoginPushState extends LoginState {}

final class LoadingLoginPushState extends LoginPushState {}

final class FailedLoginPushState extends LoginPushState {
  final String errMessage;

  FailedLoginPushState({required this.errMessage});
}

final class SuccessLoginPushState extends LoginPushState {
  final UserModel userModel;
  final RoleEnum roleEnum;

  SuccessLoginPushState({required this.userModel, required this.roleEnum});
}
