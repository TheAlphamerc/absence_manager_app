// Test cases for settings_page.dart
import 'package:absence_manager_app/feature/settings/bloc/setting_bloc.dart';
import 'package:absence_manager_app/feature/settings/views/setting_page.dart';
import 'package:absence_manager_app/feature/settings/views/widgets/widgets.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/pump_app.dart';

class MockSettingBloc extends MockBloc<SettingEvent, SettingState>
    implements SettingBloc {}

void main() {
  late SettingBloc settingBloc;

  setUp(() {
    settingBloc = MockSettingBloc();
  });
  group('Setting Page', () {
    testWidgets('Should have ThemeModeSettingsTile widget when app is loaded',
        (tester) async {
      final screen = SettingPage();
      when(() => settingBloc.state).thenReturn(SettingState.initial());
      await tester.pumpApp(screen, settingBloc);
      expect(find.byType(ThemeModeSettingsTile), findsOneWidget);
    });
    testWidgets('Should have LocaleSettingsTile widget when app is loaded',
        (tester) async {
      final screen = SettingPage();
      when(() => settingBloc.state).thenReturn(SettingState.initial());
      await tester.pumpApp(screen, settingBloc);
      expect(find.byType(LocaleSettingsTile), findsOneWidget);
    });
  });
}
