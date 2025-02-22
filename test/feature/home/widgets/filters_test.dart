import 'package:absence_manager_app/feature/home/bloc/absence_bloc.dart';
import 'package:absence_manager_app/feature/home/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/pump_app.dart';

void main() {
  group('FiltersWidget', () {
    testWidgets('Should render itself', (tester) async {
      await tester.pumpApp(FiltersWidget(
        onFilterApplied:
            (String? type, DateTime? startDate, DateTime? endDate) {},
      ));

      expect(find.byType(FiltersWidget), findsOneWidget);
    });

    testWidgets(
        'Should display type, from, to filters and apply and clear buttons',
        (tester) async {
      await tester.pumpApp(FiltersWidget(
        onFilterApplied:
            (String? type, DateTime? startDate, DateTime? endDate) {},
      ));

      expect(find.byKey(const Key('filter_by_type_dropdown')), findsOneWidget);
      expect(find.byKey(const Key('start_date_button')), findsOneWidget);
      expect(find.byKey(const Key('end_date_button')), findsOneWidget);
      expect(find.byKey(const Key('end_date_text')), findsOneWidget);
      expect(find.byKey(const Key('start_date_text')), findsOneWidget);
      expect(find.byKey(const Key('apply_filters_button')), findsOneWidget);
      expect(find.byKey(const Key('clear_filters_button')), findsOneWidget);
    });

    testWidgets('Should apply filters', (tester) async {
      String? type;
      DateTime? startDate;
      DateTime? endDate;

      await tester.pumpApp(FiltersWidget(
        onFilterApplied: (String? t, DateTime? s, DateTime? e) {
          type = t;
          startDate = s;
          endDate = e;
        },
      ));

      await tester.tap(find.byKey(Key('apply_filters_button')));
      expect(type, null);
      expect(startDate, null);
      expect(endDate, null);
    });

    testWidgets('Should prefill the filters when passed', (tester) async {
      await tester.pumpApp(FiltersWidget(
        filterBy: FilterBy(
          typeFilter: 'sickness',
          startDate: DateTime(2021, 1, 1),
          endDate: DateTime(2021, 1, 31),
        ),
        onFilterApplied:
            (String? type, DateTime? startDate, DateTime? endDate) {},
      ));
      expect(find.text('sickness'), findsOneWidget);
      expect(find.text(DateTime(2021, 1, 1).toString().split(' ')[0]),
          findsOneWidget);
      expect(find.text(DateTime(2021, 1, 31).toString().split(' ')[0]),
          findsOneWidget);
    });

    testWidgets('Should clear filters', (tester) async {
      await tester.pumpApp(FiltersWidget(
        filterBy: FilterBy(
          typeFilter: 'sickness',
          startDate: DateTime(2021, 1, 1),
          endDate: DateTime(2021, 1, 31),
        ),
        onFilterApplied:
            (String? type, DateTime? startDate, DateTime? endDate) {},
      ));

      await tester.tap(find.byKey(Key('clear_filters_button')));
    });

    testWidgets('Should update start and end date when selected by user',
        (tester) async {
      await tester.pumpApp(FiltersWidget(
        onFilterApplied:
            (String? type, DateTime? startDate, DateTime? endDate) {},
      ));

      await tester.tap(find.byKey(Key('start_date_button')));
      await tester.pumpAndSettle();
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();
      expect(find.text('Select Start Date'), findsNothing);

      await tester.tap(find.byKey(Key('end_date_button')));
      await tester.pumpAndSettle();
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();
      expect(find.text('Select End Date'), findsNothing);
    });

    testWidgets('Should update type when selected from dropdown',
        (tester) async {
      await tester.pumpApp(FiltersWidget(
        onFilterApplied:
            (String? type, DateTime? startDate, DateTime? endDate) {},
      ));

      await tester.tap(find.byKey(Key('filter_by_type_dropdown')));
      await tester.pumpAndSettle();
      await tester.tap(find.text('sickness'));
      await tester.pumpAndSettle();
      expect(find.text('sickness'), findsOneWidget);

      await tester.tap(find.byKey(Key('filter_by_type_dropdown')));
      await tester.pumpAndSettle();
      await tester.tap(find.text('vacation'));
      await tester.pumpAndSettle();
      expect(find.text('vacation'), findsOneWidget);
    });
  });
}
