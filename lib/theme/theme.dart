import 'package:flutter/material.dart';

const seedColor = Colors.deepPurple;

class AppTheme {
  /// Light theme for the app
  static ThemeData get lightTheme => ThemeData.light(
        useMaterial3: true,
      ).copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: seedColor,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: seedColor[100],
        ),
      );

  /// Dark theme for the app
  static ThemeData get darkTheme => ThemeData.dark(
        useMaterial3: true,
      ).copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: seedColor,
        ),
        dividerTheme: const DividerThemeData(
          space: 20,
          thickness: 1,
          color: Colors.white10,
        ),
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          backgroundColor: seedColor[100],
        ),
        dialogTheme: ThemeData.dark()
            .dialogTheme
            .copyWith(backgroundColor: Color(0xff1b1b1f)),
      );
}

extension ThemeExtention on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
}
