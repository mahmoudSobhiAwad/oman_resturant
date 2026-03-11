import 'package:oman_resturant/app.dart';
import 'package:oman_resturant/core/bloc_observer.dart';
import 'package:oman_resturant/core/dependency_injection/dependency_injection.dart';
import 'package:oman_resturant/core/storage/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppSharedPreferences.initialSharedPreference();
  await setupGetIt();

  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}
