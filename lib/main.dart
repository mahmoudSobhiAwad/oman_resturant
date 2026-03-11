import 'package:app_core/app.dart';
import 'package:app_core/core/bloc_observer.dart';
import 'package:app_core/core/dependency_injection/dependency_injection.dart';
import 'package:app_core/core/storage/cache_helper.dart';
import 'package:app_core/core/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppSharedPreferences.initialSharedPreference();
  await setupGetIt();

  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}
