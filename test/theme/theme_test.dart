// Test cases for theme.dart
import 'package:absence_manager_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppTheme', () {
    test('lightTheme should return ThemeData.light with Material 3', () {
      final lightTheme = AppTheme.lightTheme;
      expect(lightTheme.brightness, Brightness.light);
      expect(lightTheme.useMaterial3, isTrue);
    });

    test('darkTheme should return ThemeData.dark with Material 3', () {
      final darkTheme = AppTheme.darkTheme;
      expect(darkTheme.brightness, Brightness.dark);
      expect(darkTheme.useMaterial3, isTrue);
    });

    test('lightTheme should have deepPurple[100] as appBar background color',
        () {
      final lightTheme = AppTheme.lightTheme;
      expect(lightTheme.appBarTheme.backgroundColor, Colors.deepPurple[100]);
    });

    test('darkTheme should have deepPurple[100] as appBar background color',
        () {
      final darkTheme = AppTheme.darkTheme;
      expect(darkTheme.appBarTheme.backgroundColor, Colors.deepPurple[100]);
    });

    test('darkTheme should have white10 as divider color', () {
      final darkTheme = AppTheme.darkTheme;
      expect(darkTheme.dividerTheme.color, Colors.white10);
    });

    test('darkTheme should have 20 as divider space', () {
      final darkTheme = AppTheme.darkTheme;
      expect(darkTheme.dividerTheme.space, 20);
    });
  });
}
