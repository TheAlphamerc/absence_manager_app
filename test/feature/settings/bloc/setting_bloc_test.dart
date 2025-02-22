import 'package:absence_manager_app/feature/settings/bloc/setting_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late SettingBloc settingsBloc;
  setUp(() {
    settingsBloc = SettingBloc();
  });

  tearDown(() {
    settingsBloc.close();
  });
  test('Verify that the initial state of the AbsenceBloc is AbsenceState.', () {
    expect(settingsBloc.state, SettingState.initial());
    expect(settingsBloc.state, isA<SettingState>());
  });
  group('SettingBloc', () {
    blocTest<SettingBloc, SettingState>(
      'update theme setting when ChangeTheme is called',
      build: () {
        return settingsBloc;
      },
      act: (bloc) => bloc.add(ChangeTheme(ThemeMode.dark)),
      expect: () => [
        SettingState.initial().copyWith(themeMode: ThemeMode.dark),
      ],
    );

    blocTest<SettingBloc, SettingState>(
      'update locale setting when ChangeLocale is called',
      build: () {
        return settingsBloc;
      },
      act: (bloc) => bloc.add(ChangeLocale(Locale('en'))),
      expect: () => [
        SettingState.initial().copyWith(locale: Locale('en')),
      ],
    );
  });
}
