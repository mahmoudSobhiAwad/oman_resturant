part of 'sign_up_cubit.dart';

sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class ChangeCurrentPageState extends SignUpState {
  final int index;

  ChangeCurrentPageState({required this.index});
}

final class ChangeVisibilityState extends SignUpState {
  final bool value;

  ChangeVisibilityState({required this.value});
}

final class ChangeLocationAfterPickFromMapState extends SignUpState {}

final class VerifyPhoneState extends SignUpState {}

final class LoadingVerifyPhoneState extends VerifyPhoneState {}

final class SuccessVerifyPhoneState extends VerifyPhoneState {
  final SignUpParams params;

  SuccessVerifyPhoneState({required this.params});
}

final class FailureVerifyPhoneState extends VerifyPhoneState {
  final String errMessage;

  FailureVerifyPhoneState({required this.errMessage});
}

final class ChangeCounterInResendState extends SignUpState {}

final class CreateAccountStates extends SignUpState {}

final class LoadingCreateAccountState extends CreateAccountStates {}

final class SuccessCreateAccountState extends CreateAccountStates {}

final class FailureCreateAccountState extends CreateAccountStates {
  final String errMessage;

  FailureCreateAccountState({required this.errMessage});
}

final class ResendOtpState extends SignUpState {}

final class LoadingResendOtpState extends ResendOtpState {}

final class FailureResendOtpState extends ResendOtpState {
  final String errMessage;

  FailureResendOtpState({required this.errMessage});
}

final class SuccessResendOtpState extends ResendOtpState {}

final class ChangeSelectBoxState extends SignUpState {
  final bool boxState;

  ChangeSelectBoxState({required this.boxState});
}

final class LoadingCheckOtpState extends SignUpState {}

final class SuccessCheckOtpState extends SignUpState {}

final class FailureCheckOtpState extends SignUpState {
  final String errMessage;

  FailureCheckOtpState({required this.errMessage});
}

//final class GetAvailiableMapsStates extends SignUpState {}

// final class LoadingGetAvailiableMaps extends GetAvailiableMapsStates {}

// final class FailedGetAvailiableMaps extends GetAvailiableMapsStates {
//   final String errMessage;

//   FailedGetAvailiableMaps({required this.errMessage});
// }

// final class SuccessGetAvailiableMaps extends GetAvailiableMapsStates {
//   final MapType type;

//   SuccessGetAvailiableMaps({required this.type});
// }
