import 'package:go_router/go_router.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/dependency_injection/dependency_injection.dart';
import '../../../../core/enums/role_enum.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/utils/theme/app_colors.dart' show AppColors;
import '../../domain/repositories/login_repo.dart';
import '../../domain/use_cases/login/login_use_case.dart';
import '../cubits/login/login_cubit.dart';
import '../widgets/auth_header.dart';
import '../widgets/login_widgets/login_body.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key, required this.roleEnum});

  final RoleEnum roleEnum;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        systemNavigationBarContrastEnforced: true,
        statusBarColor: AppColors.primary,
        statusBarIconBrightness: Brightness.light,
      ),
      child: BlocProvider(
        create: (context) => LoginCubit(
          loginUseCase: LoginUseCase(loginRepo: getIt.get<LoginRepo>()),
        ),
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AuthHeader(
                    backTitle: 'الرئيسية',

                    onBack: () {
                      context.go(AppRouter.customerAppLayout);
                    },
                  ),
                  const SizedBox(height: 12),
                  LoginBody(roleEnum: roleEnum),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
