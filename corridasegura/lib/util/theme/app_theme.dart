import 'package:corridasegura/constants/colors.dart';
import 'package:corridasegura/util/theme/text_theme.dart';
import 'package:flutter/material.dart';

class TAppTheme {
  TAppTheme._();

  static final ThemeData lightTheme = ThemeData(
    primaryColor: tPrimaryColor,
    brightness: Brightness.light,
    textTheme: TTextTheme.lightTheme,
  );
  static final ThemeData darkTheme = ThemeData(
      primaryColor: tPrimaryColor,
      scaffoldBackgroundColor: tScaffoldColor,
      brightness: Brightness.dark,
      textTheme: TTextTheme.darkTheme,
      inputDecorationTheme:
          const InputDecorationTheme(hintStyle: TextStyle(fontSize: 14)));
}
