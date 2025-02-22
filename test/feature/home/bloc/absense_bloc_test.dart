import 'package:absence_manager_app/feature/home/bloc/absence_bloc.dart';
import 'package:absence_manager_app/feature/home/entity/absence.dart';
import 'package:absence_manager_app/feature/home/repository/absence_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAbsenceRepository extends Mock implements AbsenceRepository {}

void main() {
  late AbsenceRepository repository;
  late AbsenceBloc absenceBloc;
  setUp(() {
    repository = MockAbsenceRepository();
    absenceBloc = AbsenceBloc(repository: repository);
  });

  tearDown(() {
    absenceBloc.close();
  });
  test('Verify that the initial state of the AbsenceBloc is AbsenceState.', () {
    expect(absenceBloc.state, AbsenceState.initial());
    expect(absenceBloc.state, isA<AbsenceState>());
  });
  group(
    'AbsenceBloc',
    () {
      final absences = [
        Absence(
          id: 1,
          userId: 1,
          startDate: DateTime.now(),
          endDate: DateTime.now().add(Duration(days: 1)),
          type: AbsenceType.vacation,
          crewId: 1,
          admitterId: 1,
          admitterNote: 'Admitter note',
          memberNote: 'Member note',
          createdAt: DateTime.now(),
        ),
      ];
      blocTest<AbsenceBloc, AbsenceState>(
        'emits [AbsenceLoading, AbsenceLoaded] when FetchAbsences is successful',
        build: () {
          when<Future<int>>(() => repository.getTotalAbsences(
                typeFilter: any(named: 'typeFilter'),
                startDate: any(named: 'startDate'),
                endDate: any(named: 'endDate'),
              )).thenAnswer((_) async => 1);
          when<Future<List<Absence>>>(() => repository.getAbsences(
                page: 1,
                filterBy: any(named: 'filterBy'),
              )).thenAnswer((_) async => absences);
          return absenceBloc;
        },
        act: (bloc) => bloc.add(FetchAbsences()),
        expect: () => [
          AbsenceState.initial().copyWith(status: Status.loading),
          AbsenceState.initial().copyWith(
            absences: absences,
            page: 1,
            hasReachedMax: true,
            totalAbsences: absences.length,
            status: Status.loaded,
            filterBy: FilterBy(),
          ),
        ],
      );

      blocTest<AbsenceBloc, AbsenceState>(
        'emits [AbsenceLoading, AbsenceError] when FetchAbsences is unsuccessful',
        build: () {
          when<Future<int>>(() => repository.getTotalAbsences(
                typeFilter: any(named: 'typeFilter'),
                startDate: any(named: 'startDate'),
                endDate: any(named: 'endDate'),
              )).thenThrow(Exception());
          when<Future<List<Absence>>>(() => repository.getAbsences(
                page: 1,
                filterBy: any(named: 'filterBy'),
              )).thenAnswer((_) async => absences);
          return absenceBloc;
        },
        act: (bloc) => bloc.add(FetchAbsences()),
        expect: () => [
          AbsenceState.initial().copyWith(status: Status.loading),
          AbsenceState.initial().copyWith(
            status: Status.error,
            message: 'Failed to fetch absences',
          ),
        ],
      );

      blocTest<AbsenceBloc, AbsenceState>(
        'emits [AbsenceLoading, AbsenceLoaded] when LoadMoreAbsences is successful',
        build: () {
          when<Future<List<Absence>>>(() => repository.getAbsences(
                page: 1,
                filterBy: any(named: 'filterBy'),
              )).thenAnswer((_) async => absences);
          when<Future<int>>(() => repository.getTotalAbsences())
              .thenAnswer((_) async => 1);
          return absenceBloc;
        },
        seed: () => AbsenceState.initial().copyWith(
          absences: absences,
          page: 1,
          hasReachedMax: false,
          totalAbsences: absences.length + 1,
          status: Status.loaded,
          filterBy: FilterBy(),
        ),
        act: (bloc) => bloc.add(LoadMoreAbsences()),
        expect: () => [
          AbsenceState.initial().copyWith(
            absences: absences,
            page: 1,
            hasReachedMax: false,
            totalAbsences: absences.length + 1,
            status: Status.loadMore,
            filterBy: FilterBy(),
          ),
          AbsenceState.initial().copyWith(
            absences: [...absences, ...absences],
            page: 2,
            hasReachedMax: true,
            totalAbsences: absences.length + 1,
            status: Status.loaded,
            filterBy: FilterBy(),
          ),
        ],
      );

      blocTest<AbsenceBloc, AbsenceState>(
        'emits [AbsenceLoading, AbsenceLoaded] when LoadMoreAbsences is unsuccessful',
        build: () {
          when<Future<List<Absence>>>(() => repository.getAbsences(
                page: 1,
                filterBy: any(named: 'filterBy'),
              )).thenThrow(Exception());
          when<Future<int>>(() => repository.getTotalAbsences())
              .thenAnswer((_) async => 1);
          return absenceBloc;
        },
        seed: () => AbsenceState.initial().copyWith(
          absences: absences,
          page: 1,
          hasReachedMax: false,
          totalAbsences: absences.length + 1,
          status: Status.loaded,
          filterBy: FilterBy(),
        ),
        act: (bloc) => bloc.add(LoadMoreAbsences()),
        expect: () => [
          AbsenceState.initial().copyWith(
            absences: absences,
            page: 1,
            hasReachedMax: false,
            totalAbsences: absences.length + 1,
            status: Status.loadMore,
            filterBy: FilterBy(),
          ),
          AbsenceState.initial().copyWith(
            absences: absences,
            page: 1,
            hasReachedMax: false,
            totalAbsences: absences.length + 1,
            status: Status.error,
            message: 'Failed to load more absences',
            filterBy: FilterBy(),
          ),
        ],
      );
    },
  );
}
