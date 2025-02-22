import 'package:absence_manager_app/feature/settings/bloc/setting_bloc.dart';
import 'package:absence_manager_app/feature/settings/views/setting_page.dart';
import 'package:absence_manager_app/feature/settings/views/widgets/widgets.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSettingBloc extends MockBloc<SettingEvent, SettingState>
    implements SettingBloc {}

void main() {
  late SettingBloc settingBloc;

  setUp(() {
    settingBloc = MockSettingBloc();
  });
  group('ThemeModeSettingsTile', () {
    testWidgets('Should render itself', (tester) async {
      (tester) async {
        final screen = SettingPage();
        await tester.pumpApp(screen, settingBloc);
        expect(find.byType(ThemeModeSettingsTile), findsOneWidget);
      };
    });

    testWidgets('Should display theme mode settings', (tester) async {
      (tester) async {
        final screen = SettingPage();
        await tester.pumpApp(screen, settingBloc);
        expect(
            find.byKey(const Key('theme_mode_settings_tile')), findsOneWidget);
        expect(
            find.byKey(const Key('theme_mode_settings_title')), findsOneWidget);
        expect(find.byKey(const Key('theme_mode_settings_subtitle')),
            findsOneWidget);
      };
    });

    testWidgets('Should call changeThemeMode when tile is tapped',
        (tester) async {
      (tester) async {
        final screen = SettingPage();
        await tester.pumpApp(screen, settingBloc);
        await tester.tap(find.byKey(const Key('theme_mode_settings_tile')));
        await tester.pump();
        verify(() => settingBloc.add(ChangeTheme(ThemeMode.dark))).called(1);
      };
    });

    testWidgets(
        'Should send selected locale to Settings block using ChangeTheme event',
        (tester) async {
      when(() => settingBloc.add(ChangeTheme(ThemeMode.dark))).thenReturn(null);
      (tester) async {
        final screen = SettingPage();
        await tester.pumpApp(screen, settingBloc);
        await tester.tap(find.byKey(const Key('dark_mode_switch')));
        await tester.pumpAndSettle();
        verify(() => settingBloc.add(ChangeTheme(ThemeMode.dark))).called(1);
      };
    });
  });
}
