import 'package:oman_resturant/core/dependency_injection/dependency_injection.dart';
import 'package:oman_resturant/features/meal/data/pass_param/meal_details_pass_param.dart';
import 'package:oman_resturant/features/meal/domain/use_cases/get_meal_by_id_use_case.dart';
import 'package:oman_resturant/features/meal/presentation/manager/meal_details_cubit.dart';
import 'package:oman_resturant/features/meal/presentation/widgets/meal_details_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oman_resturant/features/meal/presentation/widgets/meal_details_bottom_nav.dart';

class MealDetailsView extends StatelessWidget {
  const MealDetailsView({super.key, required this.param});

  final MealDetailsPassParam param;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MealDetailsCubit(
        getMealByIdUseCase: getIt.get<GetMealByIdUseCase>(),
        mealDetailsPassParam: param,
      )..checkInitModel(),

      child: const Scaffold(
        body: MealDetailsBody(),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: MealDetailsBottomNav(),
          ),
        ),
      ),
    );
  }
}
