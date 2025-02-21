import 'package:absence_manager_app/feature/home/bloc/absence_bloc.dart';
import 'package:absence_manager_app/feature/home/repository/absence_repository.dart';
import 'package:absence_manager_app/feature/home/views/home_page.dart';
import 'package:absence_manager_app/feature/home/widgets/widgets.dart';
import 'package:absence_manager_app/feature/settings/views/setting_page.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'helpers/pump_app.dart';

class MockAbsenceRepository extends Mock implements AbsenceRepository {}

class MockAbsenceBloc extends MockBloc<AbsenceEvent, AbsenceState>
    implements AbsenceBloc {}

void main() {
  late AbsenceBloc absenceBloc;

  setUp(() {
    absenceBloc = MockAbsenceBloc();
  });
  group('Home Page', () {
    testWidgets('Should have AbsenceList widget when app is loaded',
        (tester) async {
      final screen = BlocProvider(
        create: (context) => absenceBloc,
        child: const HomePage(),
      );
      when(() => absenceBloc.state).thenReturn(AbsenceState.initial());
      await tester.pumpApp(screen);
      expect(find.byType(AbsenceList), findsOneWidget);
    });
    testWidgets('Display total absences count when there are absences',
        (tester) async {
      final screen = BlocProvider(
        create: (context) => absenceBloc..add(FetchAbsences()),
        child: const HomePage(),
      );

      when(() => absenceBloc.state)
          .thenReturn(AbsenceState.initial().copyWith(totalAbsences: 1));

      await tester.pumpApp(screen);
      expect(find.text('Total: 1'), findsOneWidget);
    });

    testWidgets('Open settings page when settings icon is clicked',
        (tester) async {
      final screen = BlocProvider(
        create: (context) => absenceBloc..add(FetchAbsences()),
        child: const HomePage(),
      );

      when(() => absenceBloc.state).thenReturn(AbsenceState.initial());
      await tester.pumpApp(screen);
      final widget = find.byKey(const Key('settings_button'));
      expect(widget, findsOneWidget);
      await tester.tap(widget);
      await tester.pumpAndSettle();
      expect(find.byType(SettingPage), findsOneWidget);
    });
  });

  group('Filters Dialog', () {
    testWidgets('Open filters dialog when filter icon is clicked',
        (tester) async {
      final screen = BlocProvider(
        create: (context) => absenceBloc,
        child: const HomePage(),
      );

      when(() => absenceBloc.state).thenReturn(AbsenceState.initial());
      await tester.pumpApp(screen);
      final widget = find.byKey(const Key('filter_button'));
      expect(widget, findsOneWidget);
      await tester.tap(widget);
      await tester.pump();
      expect(find.byType(FiltersWidget), findsOneWidget);
    });
  });
}
