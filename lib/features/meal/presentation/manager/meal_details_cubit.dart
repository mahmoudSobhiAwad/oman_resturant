import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oman_resturant/core/enums/request_enums.dart';
import 'package:oman_resturant/features/meal/data/meal_model.dart';
import 'package:oman_resturant/features/meal/data/pass_param/meal_details_pass_param.dart';
import 'package:oman_resturant/features/meal/domain/use_cases/get_meal_by_id_use_case.dart';

part 'meal_details_state.dart';

class MealDetailsCubit extends Cubit<MealDetailsState> {
  MealDetailsCubit({
    required this.getMealByIdUseCase,
    required this.mealDetailsPassParam,
  }) : super(MealDetailsState());

  final GetMealByIdUseCase getMealByIdUseCase;
  final MealDetailsPassParam mealDetailsPassParam;

  void checkInitModel() {
    if (mealDetailsPassParam.model != null) {
      emit(
        state.copyWith(
          mealModel: mealDetailsPassParam.model,
          id: mealDetailsPassParam.id,
        ),
      );
    } else {
      emit(state.copyWith(id: mealDetailsPassParam.id));
      getMealById();
    }
  }

  Future<void> getMealById() async {
    emit(state.copyWith(mealDetailsRequestState: RequestStatesEnums.loading));

    final result = await getMealByIdUseCase.call(state.id ?? "");

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            mealDetailsRequestState: RequestStatesEnums.error,
            errMessage: failure.errMessage,
          ),
        );
      },
      (data) {
        emit(
          state.copyWith(
            mealDetailsRequestState: RequestStatesEnums.success,
            mealModel: data,
          ),
        );
      },
    );
  }
}
