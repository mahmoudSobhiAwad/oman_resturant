import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oman_resturant/core/enums/request_enums.dart';
import 'package:oman_resturant/core/uses_cases/params.dart';
import 'package:oman_resturant/features/app_layout/data/models/atmosphere_model.dart';
import 'package:oman_resturant/features/app_layout/data/models/resturant_about_model.dart';
import 'package:oman_resturant/features/app_layout/domain/use_cases/get_atmospheres_use_case.dart';
import 'package:oman_resturant/features/app_layout/domain/use_cases/get_restaurant_about_use_case.dart';
import 'package:oman_resturant/features/meal/data/meal_model.dart';
import 'package:oman_resturant/features/meal/domain/use_cases/get_meals_use_case.dart';

part 'app_layout_state.dart';

class AppLayoutCubit extends Cubit<AppLayoutState> {
  AppLayoutCubit({
    required this.getAtmospheresUseCase,
    required this.getRestaurantAboutUseCase,
    required this.getMealsUseCase,
  }) : super(AppLayoutState());
  final GetMealsUseCase getMealsUseCase;
  final GetAtmospheresUseCase getAtmospheresUseCase;
  final GetRestaurantAboutUseCase getRestaurantAboutUseCase;

  Future<void> loadAllData() async {
    await Future.wait([getAboutResturant(), getMenu(), getAtmosphers()]);
  }

  Future<void> getAboutResturant() async {
    emit(
      state.copyWith(resturanDetailsRequestState: RequestStatesEnums.loading),
    );
    final result = await getRestaurantAboutUseCase.call(NoParams());
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            resturanDetailsRequestState: RequestStatesEnums.error,
            errMessage: failure.errMessage,
          ),
        );
      },
      (data) {
        emit(
          state.copyWith(
            resturanDetailsRequestState: RequestStatesEnums.success,
            aboutModel: data,
          ),
        );
      },
    );
  }

  Future<void> getMenu() async {
    emit(state.copyWith(foodMenuRequestState: RequestStatesEnums.loading));
    final result = await getMealsUseCase.call(NoParams());
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            foodMenuRequestState: RequestStatesEnums.error,
            errMessage: failure.errMessage,
          ),
        );
      },
      (data) {
        if (data.isEmpty) {
          emit(
            state.copyWith(foodMenuRequestState: RequestStatesEnums.success),
          );
        } else {
          emit(
            state.copyWith(
              foodMenuRequestState: RequestStatesEnums.success,
              meals: data,
            ),
          );
        }
      },
    );
  }

  Future<void> getAtmosphers() async {
    emit(state.copyWith(atmosphereRequestState: RequestStatesEnums.loading));
    final result = await getAtmospheresUseCase.call(NoParams());
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            atmosphereRequestState: RequestStatesEnums.error,
            errMessage: failure.errMessage,
          ),
        );
      },
      (data) {
        if (data.isEmpty) {
          emit(
            state.copyWith(atmosphereRequestState: RequestStatesEnums.success),
          );
        } else {
          emit(
            state.copyWith(
              atmosphereRequestState: RequestStatesEnums.success,
              sliders: data,
            ),
          );
        }
      },
    );
  }
}
