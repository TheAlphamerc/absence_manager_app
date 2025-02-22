import 'package:absence_manager_app/feature/home/bloc/absence_bloc.dart';
import 'package:absence_manager_app/feature/home/entity/entity.dart';
import 'package:absence_manager_app/feature/home/repository/absence_repository.dart';
import 'package:absence_manager_app/feature/home/views/home_page.dart';
import 'package:absence_manager_app/feature/home/widgets/widgets.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/pump_app.dart';

class MockAbsenceRepository extends Mock implements AbsenceRepository {}

class MockAbsenceBloc extends MockBloc<AbsenceEvent, AbsenceState>
    implements AbsenceBloc {}

void main() {
  late AbsenceBloc absenceBloc;

  setUp(() {
    absenceBloc = MockAbsenceBloc();
  });
  group('AbsenceList', () {
    final list = [
      Absence(
        crewId: 1,
        id: 1,
        admitterId: 100,
        userId: 1,
        admitterNote: 'Admitter note',
        memberNote: 'Member note',
        createdAt: DateTime.now(),
        endDate: DateTime.now(),
        startDate: DateTime.now(),
        confirmedAt: DateTime.now(),
        rejectedAt: DateTime.now(),
        type: AbsenceType.vacation,
        member: Member(
          crewId: 1,
          userId: 1,
          id: 1,
          name: 'John',
          image: 'Image',
        ),
      ),
      Absence(
        crewId: 2,
        id: 2,
        admitterId: 101,
        userId: 2,
        admitterNote: 'Admitter note',
        memberNote: 'Member note',
        createdAt: DateTime.now(),
        endDate: DateTime.now(),
        startDate: DateTime.now(),
        confirmedAt: DateTime.now(),
        rejectedAt: DateTime.now(),
        type: AbsenceType.vacation,
        member: Member(
          crewId: 2,
          userId: 2,
          id: 2,
          name: 'Doe',
          image: 'Image',
        ),
      )
    ];

    testWidgets('Should show CircularProgressIndicator when state is loading',
        (tester) async {
      final screen = BlocProvider(
        create: (context) => absenceBloc,
        child: const AbsenceList(),
      );
      when(() => absenceBloc.state).thenReturn(AbsenceState.initial().copyWith(
        status: Status.loading,
      ));
      await tester.pumpWidget(MaterialApp(home: screen));
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('Display Empty state when no list is available',
        (tester) async {
      final screen = BlocProvider(
        create: (context) => absenceBloc,
        child: const AbsenceList(),
      );
      when(() => absenceBloc.state).thenReturn(AbsenceState.initial().copyWith(
        status: Status.loaded,
        absences: [],
      ));
      await tester.pumpWidget(MaterialApp(home: screen));
      expect(find.text('No absences record found'), findsOneWidget);
    });

    testWidgets('Should show ErrorView when state is error', (tester) async {
      final screen = BlocProvider(
        create: (context) => absenceBloc,
        child: const AbsenceList(),
      );
      when(() => absenceBloc.state).thenReturn(AbsenceState.initial().copyWith(
        status: Status.error,
        message: 'Error',
      ));
      await tester.pumpWidget(MaterialApp(home: screen));
      expect(find.byType(ErrorView), findsOneWidget);
      expect(find.text('Error'), findsOneWidget);
    });

    testWidgets('Should show AbsenceListItem when state is loaded',
        (tester) async {
      final screen =
          BlocProvider(create: (context) => absenceBloc, child: HomePage());
      when(() => absenceBloc.state).thenReturn(AbsenceState.initial().copyWith(
        status: Status.loaded,
        absences: list,
      ));
      await tester.pumpApp(screen);
      expect(find.byType(AbsenceListItem), findsNWidgets(list.length));
      expect(find.text('John'), findsOneWidget);
      expect(find.text('Doe'), findsOneWidget);
    });

    testWidgets('Display LoadingIndicator when loading more absence list',
        (tester) async {
      final screen = BlocProvider(
        create: (context) => absenceBloc,
        child: const AbsenceList(),
      );
      when(() => absenceBloc.state).thenReturn(AbsenceState.initial().copyWith(
        status: Status.loadMore,
        absences: list,
        hasReachedMax: false,
        page: 1,
      ));
      await tester.pumpApp(screen);
      expect(find.byType(LoadingIndicator), findsOneWidget);
    });
  });
}
