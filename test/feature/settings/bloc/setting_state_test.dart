import 'package:absence_manager_app/feature/settings/bloc/setting_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SettingState', () {
    test('Should have correct initial state', () {
      // Given
      final state = SettingState.initial();

      // Then
      expect(state.themeMode, ThemeMode.light);
      expect(state.locale, Locale('de', 'DE'));
    });
    test('Should have correct copyWith', () {
      // Given
      final state = SettingState.initial();

      // When
      final copy = state.copyWith(themeMode: ThemeMode.dark);

      // Then
      expect(copy.themeMode, ThemeMode.dark);
    });

    test('Should have correct props', () {
      // Given
      final state1 = SettingState.initial();
      final state2 = SettingState.initial().copyWith(themeMode: ThemeMode.dark);

      // Then
      expect(state1,
          SettingState(themeMode: ThemeMode.light, locale: Locale('de', 'DE')));
      expect(state2,
          SettingState(themeMode: ThemeMode.dark, locale: Locale('de', 'DE')));
    });
  });
}
