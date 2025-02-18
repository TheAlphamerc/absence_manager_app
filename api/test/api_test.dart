import 'package:api/src/api.dart';
import 'package:test/test.dart';

void main() {
  late Api api;
  setUp(() {
    api = Api();
  });

  group('every member has key', () {
    for (var key in ['id', 'name', 'userId', 'image']) {
      test(key, () async {
        List<dynamic> memberData = await api.members();
        for (var member in memberData) {
          expect(member.containsKey(key), isTrue);
        }
      });
    }
  });

  group('every absence has key', () {
    for (var key in [
      'admitterNote',
      'confirmedAt',
      'createdAt',
      'crewId',
      'endDate',
      'id',
      'memberNote',
      'rejectedAt',
      'startDate',
      'type',
      'userId',
    ]) {
      test(key, () async {
        List<dynamic> absenceData = await api.absences();
        for (var absence in absenceData) {
          expect(absence.containsKey(key), isTrue);
        }
      });
    }
  });
}
