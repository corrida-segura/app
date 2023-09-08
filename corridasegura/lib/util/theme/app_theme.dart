import 'package:corridasegura/util/theme/text_theme.dart';
import 'package:flutter/material.dart';

class TAppTheme {

  TAppTheme._();

  static final ThemeData lightTheme = ThemeData(
    primaryColor: const Color(0xFF1363DF),
    brightness: Brightness.light,
    textTheme: TTextTheme.lightTheme,
  );
  static final ThemeData darkTheme = ThemeData(
    primaryColor: const Color(0xFF1363DF),
    brightness: Brightness.dark,
    textTheme: TTextTheme.darkTheme,
  );
}

