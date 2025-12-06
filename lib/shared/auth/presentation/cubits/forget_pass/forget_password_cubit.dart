
import 'package:bloc/bloc.dart';

import '../../../../../core/utils/constants/app_constants.dart';
import '../../../data/models/forget_pass/forget_pass_params.dart';
import '../../../domain/use_cases/forget_pass/check_otp.dart';
import '../../../domain/use_cases/forget_pass/reset_password.dart';
import '../../../domain/use_cases/forget_pass/verify_phone.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit({
    required this.checkOtpUseCase,
    required this.resetPasswordUseCase,
    required this.verifyPhoneInForgetPassewordUseCase,
  }) : super(ForgetPasswordInitial());
  final CheckOtpUseCase checkOtpUseCase;
  final VerifyPhoneInForgetPassewordUseCase verifyPhoneInForgetPassewordUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;
  @override
  void emit(ForgetPasswordState state) {
    if (isClosed) {
      return;
    }
    super.emit(state);
  }

  Future<void> verifyPhoneNumber({required String phoneNum}) async {
    emit(LoadingVerifyPhoneNumberState());
    final result = await verifyPhoneInForgetPassewordUseCase.call(phoneNum);
    result.fold(
      (failure) {
        emit(FailureVerifyPhoneNumberState(errMessage: failure.errMessage));
      },
      (data) {
        emit(SuccessVerifyPhoneNumberState());
      },
    );
  }

  Future<void> resetPassword({required ForgetPassParams params}) async {
    emit(LoadingResetPasswordState());
    final result = await resetPasswordUseCase.call(params);
    result.fold(
      (failure) {
        emit(FailureResetPasswordState(errMessage: failure.errMessage));
      },
      (data) {
        emit(SuccessResetPasswordState());
      },
    );
  }

  Future<void> checkOtp({
    required String code,
    required String phoneNumber,
  }) async {
    emit(LoadingCheckOtpValidationState());
    final result = await checkOtpUseCase.call({
      'code': code,
      'phone': "${AppConstants.phoneCode}$phoneNumber",
    });
    result.fold(
      (failure) {
        emit(FailureCheckOtpValidationState(errMessage: failure.errMessage));
      },
      (data) {
        emit(SuccessCheckOtpValidationState(token: data, otpCode: code));
      },
    );
  }

  Future<void> reVerifyPhoneNume({required String value}) async {
    emit(LoadingResendOtpState());
    final result = await verifyPhoneInForgetPassewordUseCase.call(value);
    result.fold(
      (failure) {
        emit(FailureResendOtpState(errMessage: failure.errMessage));
      },
      (data) {
        emit(SuccessResendOtpState());
      },
    );
  }

  void changeVisibilityOfPassword(bool value) {
    emit(ChangePasswordVisibilityState(value: !value));
  }

  void changeVisibilityOfConfirmedPassword(bool value) {
    emit(ChangeConfirmPasswordVisibilityState(value: !value));
  }

  void changePageIndex(int index) {
    emit(ChangePageIndexState(index: index));
  }
}
