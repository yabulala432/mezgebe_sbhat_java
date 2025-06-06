import 'package:flutter/material.dart';

ThemeData light = ThemeData(
  colorScheme: ColorScheme.light(
    surface: const Color(0xFFB0713F),
    shadow: const Color.fromARGB(255, 63, 23, 3).withValues(alpha: .3),
    primary: const Color.fromARGB(255, 63, 23, 3),
    secondary: const Color.fromARGB(255, 79, 35, 35),
    inversePrimary: const Color.fromARGB(255, 176, 113, 63),
    onPrimary: Colors.white,
    error: const Color.fromARGB(255, 125, 48, 48),
  ),
);
