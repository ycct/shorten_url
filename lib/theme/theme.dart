import 'package:flutter/material.dart';

class CustomThemeData {
  static const Color primaryColor = Colors.cyan;
  static const Color secondaryColor = Colors.white;
  static  Color backgroundColor = Colors.grey.shade50;

  static ThemeData lightTheme = ThemeData(
    progressIndicatorTheme: const ProgressIndicatorThemeData(color: primaryColor),
    appBarTheme: const AppBarTheme(backgroundColor: primaryColor),
    errorColor: Colors.red,
    dividerColor: Colors.black,
    primaryColorDark: Colors.black,
    backgroundColor: Colors.deepPurple,
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(
        color: primaryColor,
      ),
    ),
    primaryColor: primaryColor,
    disabledColor: secondaryColor,
    scaffoldBackgroundColor: backgroundColor,
    textTheme: const TextTheme(
      headline4: TextStyle(fontWeight: FontWeight.bold),
      headline5: TextStyle(fontWeight: FontWeight.bold),
      headline6: TextStyle(fontWeight: FontWeight.bold),
      subtitle1: TextStyle(letterSpacing: 0),
      subtitle2: TextStyle(letterSpacing: 0),
      bodyText1: TextStyle(letterSpacing: 0,fontWeight: FontWeight.bold),
      bodyText2: TextStyle(letterSpacing: 0,fontWeight: FontWeight.bold),
      caption: TextStyle(letterSpacing: 0),
      overline: TextStyle(letterSpacing: 0),
    ).apply(
      bodyColor: primaryColor,
      displayColor: primaryColor,
    ),
    iconTheme: const IconThemeData(color: primaryColor),
  );
}