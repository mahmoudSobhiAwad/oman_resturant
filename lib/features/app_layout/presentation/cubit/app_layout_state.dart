part of 'app_layout_cubit.dart';

class AppLayoutState extends Equatable {
  const AppLayoutState({
    this.resturanDetailsRequestState = RequestStatesEnums.initial,
    this.atmosphereRequestState = RequestStatesEnums.initial,
    this.foodMenuRequestState = RequestStatesEnums.initial,
    this.errMessage = '',
    this.meals = const [],
    this.sliders = const [],
    this.aboutModel,
  });
  final RequestStatesEnums resturanDetailsRequestState;
  final RequestStatesEnums atmosphereRequestState;
  final RequestStatesEnums foodMenuRequestState;
  final String errMessage;
  final List<MealModel> meals;
  final List<AtmosphereModel> sliders;
  final ResturantAboutModel? aboutModel;
  @override
  List<Object?> get props => [
    resturanDetailsRequestState,
    atmosphereRequestState,
    foodMenuRequestState,
    errMessage,
    meals,
    sliders,
    aboutModel,
  ];
  AppLayoutState copyWith({
    RequestStatesEnums? resturanDetailsRequestState,
    RequestStatesEnums? atmosphereRequestState,
    RequestStatesEnums? foodMenuRequestState,
    String? errMessage,
    List<MealModel>? meals,
    List<AtmosphereModel>? sliders,
    ResturantAboutModel? aboutModel,
  }) {
    return AppLayoutState(
      resturanDetailsRequestState:
          resturanDetailsRequestState ?? this.resturanDetailsRequestState,
      atmosphereRequestState:
          atmosphereRequestState ?? this.atmosphereRequestState,
      foodMenuRequestState: foodMenuRequestState ?? this.foodMenuRequestState,
      errMessage: errMessage ?? this.errMessage,
      aboutModel: aboutModel ?? this.aboutModel,
      sliders: sliders ?? this.sliders,
      meals: meals ?? this.meals,
    );
  }
}
