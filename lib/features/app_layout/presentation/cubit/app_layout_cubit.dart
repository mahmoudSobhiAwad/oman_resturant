import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oman_resturant/core/enums/request_enums.dart';

part 'app_layout_state.dart';

class AppLayoutCubit extends Cubit<AppLayoutState> {
  AppLayoutCubit() : super(AppLayoutState());
}
