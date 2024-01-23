import 'package:flutter/material.dart';

class MainTheme {
  static const int mainColor = 0xFFA31F1F; // Deep Purple color

  static const MaterialColor primaryColor = MaterialColor(
    mainColor,
    <int, Color>{
      50: Color(0xFFFDE0E0),
      100: Color(0xFFF8BFBF),
      200: Color(0xFFF29292),
      300: Color(0xFFEB6666),
      400: Color(0xFFE13E3E),
      500: Color(mainColor),
      600: Color(0xFFCB1919),
      700: Color(0xFFC01414),
      800: Color(0xFFB70F0F),
      900: Color(0xFFA60808),
    },
  );
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

TextTheme get textTheme => textThemeF();

TextTheme textThemeF() {
  return ThemeData.light().textTheme;
}
