part of 'forget_password_cubit.dart';

sealed class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}

final class ChangePageIndexState extends ForgetPasswordState {
  final int index;

  ChangePageIndexState({required this.index});
}

final class VerifyPhoneNumberState extends ForgetPasswordState {}

final class LoadingVerifyPhoneNumberState extends VerifyPhoneNumberState {}

final class FailureVerifyPhoneNumberState extends VerifyPhoneNumberState {
  final String errMessage;

  FailureVerifyPhoneNumberState({required this.errMessage});
}

final class SuccessVerifyPhoneNumberState extends VerifyPhoneNumberState {}

final class ResetPasswordState extends ForgetPasswordState {}

final class LoadingResetPasswordState extends ResetPasswordState {}

final class FailureResetPasswordState extends ResetPasswordState {
  final String errMessage;

  FailureResetPasswordState({required this.errMessage});
}

final class SuccessResetPasswordState extends ResetPasswordState {}

final class LoadingResendOtpState extends ForgetPasswordState {}

final class FailureResendOtpState extends ForgetPasswordState {
  final String errMessage;

  FailureResendOtpState({required this.errMessage});
}

final class SuccessResendOtpState extends ForgetPasswordState {}

final class LoadingCheckOtpValidationState extends ForgetPasswordState {}

final class SuccessCheckOtpValidationState extends ForgetPasswordState {
  final String token;
  final String otpCode;
  SuccessCheckOtpValidationState({required this.token, required this.otpCode});
}

final class FailureCheckOtpValidationState extends ForgetPasswordState {
  final String errMessage;

  FailureCheckOtpValidationState({required this.errMessage});
}

final class ChangePasswordVisibilityState extends ForgetPasswordState {
  final bool value;

  ChangePasswordVisibilityState({required this.value});
}

final class ChangeConfirmPasswordVisibilityState extends ForgetPasswordState {
  final bool value;

  ChangeConfirmPasswordVisibilityState({required this.value});
}
