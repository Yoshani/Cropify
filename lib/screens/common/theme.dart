import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              primary: const Color.fromARGB(255, 2, 70, 2))),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          primary: const Color.fromARGB(255, 2, 70, 2),
        ),
      ),
      textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color.fromARGB(255, 2, 70, 2)),
      inputDecorationTheme: const InputDecorationTheme(
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 2, 70, 2))),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 2, 70, 2)),
        ),
      ));
}
