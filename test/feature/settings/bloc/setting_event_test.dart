import 'package:absence_manager_app/feature/settings/bloc/setting_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SettingEvent', () {
    test('Support value comparisons', () {
      // Given
      final event1 = ChangeTheme(ThemeMode.dark);
      final event2 = ChangeTheme(ThemeMode.dark);
      final event3 = ChangeTheme(ThemeMode.light);
      final event4 = ChangeLocale(Locale('en'));
      final event5 = ChangeLocale(Locale('en'));

      // Then
      expect(event1, event2);
      expect(event1, isNot(event3));
      expect(event4, event5);
      expect(event1, isA<SettingEvent>());
      expect(event4, isA<SettingEvent>());
    });
    test('Should have correct props', () {
      // Given
      final event1 = ChangeTheme(ThemeMode.dark);
      final event2 = ChangeLocale(Locale('en'));

      // Then
      expect(event1.props, [ThemeMode.dark]);
      expect(event2.props, [Locale('en')]);
    });
  });
}
