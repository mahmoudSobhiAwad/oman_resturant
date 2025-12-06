import 'dart:developer';


import 'package:bloc/bloc.dart';

import '../../../../../core/enums/role_enum.dart';
import '../../../../../core/helpers/notification_helper/firebase_notifications.dart';
import '../../../../../core/storage/cache_helper.dart';
import '../../../../../core/utils/constants/app_constants.dart';
import '../../../data/models/login/login_param_model.dart';
import '../../../data/models/user_model.dart';
import '../../../domain/use_cases/login/login_use_case.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginUseCase}) : super(LoginInitial());
  final LoginUseCase loginUseCase;
  @override
  void emit(LoginState state) {
    if (isClosed) {
      return;
    }
    super.emit(state);
  }

  void changeVisibility(final bool value) {
    emit(ChangeVisibilityState(value: !value));
  }

  Future<void> loginInto({required LoginParamModel model}) async {
    emit(LoadingLoginPushState());
    final result = await loginUseCase.call(model);
    result.fold(
      (failure) {
        if (failure.errMessage == 'Invalid username or password') {
          emit(
            FailedLoginPushState(
              errMessage: model.roleEnum == RoleEnum.user
                  ? 'رقم الهاتف أو كلمة المرور غير صحيحة'
                  : 'اسم المستخدم أو كلمة المرور غير صحيحة',
            ),
          );
          return;
        }
        emit(
          FailedLoginPushState(
            errMessage: failure.errMessage == "Your account is disabled"
                ? 'تم تعطيل حسابك من قبل الادمن او الادارة'
                : failure.errMessage,
          ),
        );
      },
      (model) async {
        RoleEnum role = RoleEnum.values.firstWhere(
          (test) => test.name == model.role,
          orElse: () {
            return RoleEnum.user;
          },
        );

        try {
          await FirebaseNotifications.initializeFirebase(
            role: RoleEnum.values.firstWhere((item) => item.name == model.role),
          );
          // final fcmToken = await FirebaseMessaging.instance.getToken();
          // log('fcmToken: $fcmToken');
        } catch (e, s) {
          log("Firebase Initialization Error: $e $s");
        }

        RoleEnum.influencers == role
            ? await AppSharedPreferences.setString(
                value: model.id,
                key: AppConstants.merchantId,
              )
            : null;
        emit(SuccessLoginPushState(userModel: model, roleEnum: role));
      },
    );
  }
}
