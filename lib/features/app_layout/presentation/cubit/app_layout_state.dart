part of 'app_layout_cubit.dart';

class AppLayoutState extends Equatable {
  const AppLayoutState({
    this.resturanDetailsRequestState = RequestStatesEnums.initial,
    this.atmosphereRequestState = RequestStatesEnums.initial,
    this.foodMenuRequestState = RequestStatesEnums.initial,
    this.errMessage = '',
  });
  final RequestStatesEnums resturanDetailsRequestState;
  final RequestStatesEnums atmosphereRequestState;
  final RequestStatesEnums foodMenuRequestState;
  final String errMessage;
  @override
  List<Object> get props => [
    resturanDetailsRequestState,
    atmosphereRequestState,
    foodMenuRequestState,
    errMessage,
  ];
  AppLayoutState copyWith({
    RequestStatesEnums? resturanDetailsRequestState,
    RequestStatesEnums? atmosphereRequestState,
    RequestStatesEnums? foodMenuRequestState,
    String? errMessage,
  }) {
    return AppLayoutState(
      resturanDetailsRequestState:
          resturanDetailsRequestState ?? this.resturanDetailsRequestState,
      atmosphereRequestState:
          atmosphereRequestState ?? this.atmosphereRequestState,
      foodMenuRequestState: foodMenuRequestState ?? this.foodMenuRequestState,
      errMessage: errMessage ?? this.errMessage,
    );
  }
}
