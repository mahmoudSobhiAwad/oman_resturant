
import 'package:bloc/bloc.dart';

import '../../../data/models/sign_up/sign_up_params.dart';
import '../../../domain/use_cases/sign_up/check_otp_code.dart';
import '../../../domain/use_cases/sign_up/create_account_use_case.dart';
import '../../../domain/use_cases/sign_up/verify_number.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({
    required this.createAccountUseCase,
    required this.verifyNumberInSignUpUseCase,
    required this.checkOtpCodeUseCase,
  }) : super(SignUpInitial());
  final VerifyNumberInSignUpUseCase verifyNumberInSignUpUseCase;
  final CreateAccountUseCase createAccountUseCase;
  final CheckOtpCodeUseCase checkOtpCodeUseCase;
  SignUpParams? signUpParams;
  @override
  void emit(SignUpState state) {
    if (isClosed) {
      return;
    }
    super.emit(state);
  }

  void changeVisibility(bool value) {
    emit(ChangeVisibilityState(value: !value));
  }

  Future<void> verifySentPhone({required SignUpParams params}) async {
    signUpParams = params;

    emit(LoadingVerifyPhoneState());
    final result = await verifyNumberInSignUpUseCase.call(params);
    result.fold(
      (failure) {
        emit(FailureVerifyPhoneState(errMessage: failure.errMessage));
      },
      (code) {
        emit(SuccessVerifyPhoneState(params: params));
      },
    );
  }

  Future<void> checkOtp(String value) async {
    if (signUpParams == null) return;
    signUpParams?.code = value;
    emit(LoadingCheckOtpState());
    final result = await checkOtpCodeUseCase.call(signUpParams!);
    result.fold(
      (failure) {
        emit(FailureCheckOtpState(errMessage: failure.errMessage));
      },
      (code) async {
        await createAccount(params: signUpParams!);
      },
    );
  }

  Future<void> resendVerification() async {
    emit(LoadingResendOtpState());
    final result = await verifyNumberInSignUpUseCase.call(signUpParams!);
    result.fold(
      (failure) {
        emit(FailureResendOtpState(errMessage: failure.errMessage));
      },
      (message) {
        emit(SuccessResendOtpState());
      },
    );
  }

  Future<void> changeSelectedBoxState(bool boxState) async {
    emit(ChangeSelectBoxState(boxState: boxState));
  }

  Future<void> createAccount({required SignUpParams params}) async {
    final result = await createAccountUseCase.call(params);
    result.fold(
      (failure) {
        emit(FailureCreateAccountState(errMessage: failure.errMessage));
      },
      (model) async {
        // try {
        //   await FirebaseNotifications.initializeFirebase(role: RoleEnum.user);
        //   // final fcmToken = await FirebaseMessaging.instance.getToken();
        //   //  log('fcmToken: $fcmToken');
        // } catch (e) {
        //   log("Firebase Initialization Error: $e");
        // }
        emit(SuccessCreateAccountState());
      },
    );
  }

  void changeCurrentPage(int pageNum) {
    emit(ChangeCurrentPageState(index: pageNum));
  }
}
