import 'package:corridasegura/util/theme/text_theme.dart';
import 'package:flutter/material.dart';

class TAppTheme {

  TAppTheme._();

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: TTextTheme.lightTheme,
  );
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: TTextTheme.darkTheme,
  );
}


// primarySwatch: const MaterialColor(
//       0xFFFFFE200, <int , Color>{
//         50: Color(0x1AFFE200),
//         100: Color(0x33FFE200),
//         200: Color(0x4DFFE200),
//         300: Color(0x66FFE200),
//         400: Color(0x80FFE200),
//         500: Color(0xFFFFE200),
//         600: Color(0x99FFE200),
//         700: Color(0xB3FFE200),
//         800: Color(0xCCFFE200),
//         900: Color(0xE6FFE200),
//       }