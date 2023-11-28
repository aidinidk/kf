import 'package:flutter/material.dart';

ThemeData lighTheme = ThemeData().copyWith(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.lightBlue,
    primary: const Color.fromARGB(255, 87, 162, 93),
    secondary: const Color.fromRGBO(124, 147, 195, 1),
    background: const Color.fromRGBO(238, 245, 255, 1),
    brightness: Brightness.light,
    surface: const Color.fromRGBO(158, 184, 217, 1),
  ),
  brightness: Brightness.light,
);
ThemeData darkTheme = ThemeData().copyWith(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.lightBlue,
    primary: const Color.fromRGBO(240, 89, 65, 1),
    secondary: const Color.fromRGBO(190, 49, 68, 1),
    background: const Color.fromRGBO(34, 9, 44, 1),
    brightness: Brightness.dark,
    surface: const Color.fromRGBO(135, 35, 65, 1),
  ),
  brightness: Brightness.dark,
);
