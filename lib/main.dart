import 'package:task_app/app.dart';
import 'package:task_app/core/bloc_observer.dart';
import 'package:task_app/core/dependency_injection/dependency_injection.dart';
import 'package:task_app/core/storage/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppSharedPreferences.initialSharedPreference();
  await setupGetIt();

  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}
