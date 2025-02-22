import 'package:absence_manager_app/feature/settings/bloc/setting_bloc.dart';
import 'package:absence_manager_app/feature/settings/views/setting_page.dart';
import 'package:absence_manager_app/feature/settings/views/widgets/widgets.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSettingBloc extends MockBloc<SettingEvent, SettingState>
    implements SettingBloc {}

void main() {
  late SettingBloc settingBloc;

  setUp(() {
    settingBloc = MockSettingBloc();
  });
  group('LocaleSettingsTile', () {
    testWidgets('Should render itself', (tester) async {
      (tester) async {
        final screen = SettingPage();
        await tester.pumpApp(screen, settingBloc);
        expect(find.byType(LocaleSettingsTile), findsOneWidget);
      };
    });

    testWidgets('Should display locale settings tile', (tester) async {
      (tester) async {
        final screen = SettingPage();
        await tester.pumpApp(screen, settingBloc);
        expect(find.byKey(const Key('locale_settings_tile')), findsOneWidget);
      };
    });

    testWidgets('Should display locale settings tile title', (tester) async {
      (tester) async {
        final screen = SettingPage();
        await tester.pumpApp(screen, settingBloc);
        expect(find.text('Locale'), findsOneWidget);
      };
    });

    testWidgets('Should display locale settings tile subtitle', (tester) async {
      (tester) async {
        final screen = SettingPage();
        await tester.pumpApp(screen, settingBloc);
        expect(find.text('English'), findsOneWidget);
      };
    });

    testWidgets('Should display English and German language selection',
        (tester) async {
      (tester) async {
        final screen = SettingPage();
        await tester.pumpApp(screen, settingBloc);
        await tester.tap(find.byKey(const Key('language_dropdown_button')));
        await tester.pumpAndSettle();
        expect(find.text('English'), findsOneWidget);
        expect(find.text('German'), findsOneWidget);
      };
    });

    testWidgets('Should change language when language is selected',
        (tester) async {
      (tester) async {
        final screen = SettingPage();
        await tester.pumpApp(screen, settingBloc);
        await tester.tap(find.byKey(const Key('language_dropdown_button')));
        await tester.pumpAndSettle();
        await tester.tap(find.text('German'));
        await tester.pumpAndSettle();
        expect(find.text('German'), findsOneWidget);

        await tester.tap(find.byKey(const Key('language_dropdown_button')));
        await tester.pumpAndSettle();
        await tester.tap(find.text('English'));
        await tester.pumpAndSettle();
        expect(find.text('English'), findsOneWidget);
      };
    });

    testWidgets(
        'Should send selected theme mode to Settings block using ChangeTheme event',
        (tester) async {
      when(() => settingBloc.add(ChangeLocale(Locale('de')))).thenReturn(null);
      (tester) async {
        final screen = SettingPage();
        await tester.pumpApp(screen, settingBloc);
        await tester.tap(find.byKey(const Key('language_dropdown_button')));
        await tester.pumpAndSettle();
        await tester.tap(find.text('German'));
        await tester.pumpAndSettle();
        verify(() => settingBloc.add(ChangeLocale(Locale('de')))).called(1);
      };
    });
  });
}
