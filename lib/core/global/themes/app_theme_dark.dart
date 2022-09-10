import 'package:flutter/material.dart';

ThemeData getAppThemeDark(){
  return ThemeData(
    brightness: Brightness.dark,
    textTheme: const TextTheme(titleMedium: TextStyle(fontSize: 60,color: Colors.white,fontWeight: FontWeight.w700)),
    appBarTheme: const AppBarTheme(
      centerTitle: true
    ),
    cardTheme: CardTheme(
      margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
    )
  );
}