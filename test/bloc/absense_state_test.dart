import 'package:absence_manager_app/feature/home/bloc/absence_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AbsenceState', () {
    test('AbsenceState should have correct properties', () {
      final state = AbsenceState(
        absences: [],
        hasReachedMax: false,
        page: 1,
        totalAbsences: 0,
        status: Status.initial,
        filterBy: null,
        message: null,
      );

      expect(state.absences, []);
      expect(state.hasReachedMax, false);
      expect(state.page, 1);
      expect(state.totalAbsences, 0);
      expect(state.status, Status.initial);
      expect(state.filterBy, null);
      expect(state.message, null);
    });

    test('AbsenceState.initial is a factory constructor', () {
      final state = AbsenceState.initial();

      expect(state.absences, []);
      expect(state.hasReachedMax, false);
      expect(state.page, 1);
      expect(state.totalAbsences, 0);
      expect(state.status, Status.initial);
      expect(state.filterBy, null);
      expect(state.message, null);
    });
  });
}
