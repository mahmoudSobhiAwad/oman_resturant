import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oman_resturant/core/dependency_injection/dependency_injection.dart';
import 'package:oman_resturant/features/app_layout/domain/use_cases/get_atmospheres_use_case.dart';
import 'package:oman_resturant/features/app_layout/domain/use_cases/get_restaurant_about_use_case.dart';
import 'package:oman_resturant/features/app_layout/presentation/cubit/app_layout_cubit.dart';
import 'package:oman_resturant/features/app_layout/presentation/widgets/app_layout_body.dart';
import 'package:oman_resturant/features/meal/domain/use_cases/get_meals_use_case.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppLayoutCubit(
        getAtmospheresUseCase: getIt.get<GetAtmospheresUseCase>(),
        getRestaurantAboutUseCase: getIt.get<GetRestaurantAboutUseCase>(),
        getMealsUseCase: getIt.get<GetMealsUseCase>(),
      )..loadAllData(),
      child: Scaffold(body: AppLayoutBody()),
    );
  }
}
