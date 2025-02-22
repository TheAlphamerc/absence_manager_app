import 'package:absence_manager_app/feature/home/entity/absence.dart';
import 'package:absence_manager_app/feature/home/entity/member.dart';
import 'package:absence_manager_app/feature/home/widgets/widgets.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/pump_app.dart';

void main() {
  group('AbsenceListItem', () {
    final date = DateTime.now();
    final absence = Absence(
      crewId: 1,
      id: 1,
      admitterId: 100,
      userId: 1,
      admitterNote: 'Admitter note',
      memberNote: 'Member note',
      createdAt: date,
      endDate: date,
      startDate: date,
      confirmedAt: date,
      rejectedAt: date,
      type: AbsenceType.vacation,
      member: Member(
        crewId: 1,
        userId: 1,
        id: 1,
        name: 'John',
        image: 'Image',
      ),
    );
    testWidgets(
        'should display Member info like name,type, period, member note, status and Admitter note ',
        (tester) async {
      await tester.pumpApp(AbsenceListItem(
        absence: absence,
        index: 0,
      ));
      expect(find.text('John'), findsOneWidget);
      expect(find.text('Status:'), findsOneWidget);
      expect(find.text('Member note'), findsOneWidget);
      expect(find.text('Admitter note'), findsOneWidget);

      // Check for from and to date
      expect(find.text('${date.day}/${date.month}/${date.year}'),
          findsNWidgets(2));
    });
    testWidgets('call _generateICal when Generate iCal list item is tapped ',
        (tester) async {
      await tester.pumpApp(AbsenceListItem(
        absence: absence,
        index: 0,
      ));

      await tester.tap(find.byKey(const Key('absence_popup_menu')));
      expect(find.byKey(Key('absence_popup_menu')), findsOneWidget);
      await tester.pump();
      expect(find.text('Generate iCal'), findsOneWidget);

      // Check if _generateICal is called
      await tester.tap(find.text('Generate iCal'), warnIfMissed: false);
      await tester.pump();
    });
  });
}
