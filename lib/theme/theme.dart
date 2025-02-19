import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData.light(
        useMaterial3: true,
      ).copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepPurple[100],
        ),
      );

  static ThemeData get darkTheme => ThemeData.dark(
        useMaterial3: true,
      ).copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        dividerTheme: const DividerThemeData(
          space: 20,
          thickness: 1,
          color: Colors.white10,
        ),
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepPurple[100],
        ),
      );
}

extension ThemeExtention on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
}
