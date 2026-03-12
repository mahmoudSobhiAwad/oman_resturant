part of 'meal_details_cubit.dart';

class MealDetailsState extends Equatable {
  const MealDetailsState({
    this.mealDetailsRequestState = RequestStatesEnums.initial,
    this.errMessage = '',
    this.mealModel,
    this.id,
  });

  final RequestStatesEnums mealDetailsRequestState;
  final String errMessage;
  final MealModel? mealModel;
  final String? id;

  @override
  List<Object?> get props => [mealDetailsRequestState, errMessage, mealModel];

  MealDetailsState copyWith({
    RequestStatesEnums? mealDetailsRequestState,
    String? errMessage,
    MealModel? mealModel,
    String? id,
  }) {
    return MealDetailsState(
      mealDetailsRequestState:
          mealDetailsRequestState ?? this.mealDetailsRequestState,
      errMessage: errMessage ?? this.errMessage,
      mealModel: mealModel ?? this.mealModel,
      id: id ?? this.id,
    );
  }
}
