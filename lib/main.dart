import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/constants/app_strings.dart';
import 'package:movies_app/core/global/themes/app_theme_dark.dart';
import 'package:movies_app/core/services/services_locator.dart';
import 'package:movies_app/movies/domain/usecases/get_searched_movies_usecase.dart';
import 'package:movies_app/movies/presentation/controllers/movies_bloc.dart';
import 'package:movies_app/movies/presentation/controllers/movies_event.dart';
import 'package:movies_app/movies/presentation/screens/movies_screen.dart';

void main() {
  ServiceLocator().init();
  // final result = await  GetSearchedMoviesUsecase(baseMoviesRepository: sl()).call( SearchedMoviesParameters(searchingString: "a"));
  // log(result.toString());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      theme: getAppThemeDark(),
      debugShowCheckedModeBanner: false,
      home: const MainMoviesScreen(),
    );
  }
}
