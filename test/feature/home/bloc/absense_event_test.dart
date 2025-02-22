import 'package:absence_manager_app/feature/home/bloc/absence_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AbsenceEvent', () {
    test('FetchAbsences event should have correct properties', () {
      const typeFilter = 'sickness';
      final startDate = DateTime(2023, 10, 1);
      final endDate = DateTime(2023, 10, 5);

      final event = FetchAbsences(
        typeFilter: typeFilter,
        startDate: startDate,
        endDate: endDate,
      );

      expect(event.typeFilter, typeFilter);
      expect(event.startDate, startDate);
      expect(event.endDate, endDate);
    });

    test(
        'FetchAbsences event should have empty properties when no filters are provided',
        () {
      const event = FetchAbsences();

      expect(event.typeFilter, isNull);
      expect(event.startDate, isNull);
      expect(event.endDate, isNull);
    });

    test('FetchAbsences event props should include all properties', () {
      const typeFilter = 'sickness';
      final startDate = DateTime(2023, 10, 1);
      final endDate = DateTime(2023, 10, 5);

      final event = FetchAbsences(
        typeFilter: typeFilter,
        startDate: startDate,
        endDate: endDate,
      );
      expect(event.props, [typeFilter, startDate, endDate]);
    });

    test('LoadMoreAbsences event should have no properties', () {
      final event = LoadMoreAbsences();

      expect(event.props, isEmpty);
    });
  });
}
