import 'package:absence_manager_app/feature/home/entity/entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Absence model test', () {
    // Given
    final model = Absence(
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
        name: 'Name',
        image: 'Image',
      ),
    );

    // Then
    expect(model.crewId, isA<int>());
    expect(model.id, isA<int>());
    expect(model.endDate, isA<DateTime>());
    expect(model.startDate, isA<DateTime>());
    expect(model.userId, 1);
    expect(model.admitterId, 100);
    expect(model.admitterNote, 'Admitter note');
    expect(model.memberNote, 'Member note');
    expect(model.createdAt, isA<DateTime>());
    expect(model.confirmedAt, isA<DateTime>());
    expect(model.rejectedAt, isA<DateTime>());
    expect(model.type, AbsenceType.vacation);
    expect(model.member, isA<Member>());
  });

  test('Absence model fromJson test', () {
    // Given
    final absence = Absence.fromJson({
      'crewId': 1,
      'id': 1,
      'admitterId': 1,
      'admitterNote': 'Admitter Note',
      'confirmedAt': DateTime.now().toIso8601String(),
      'createdAt': DateTime.now().toIso8601String(),
      'endDate': DateTime.now().toIso8601String(),
      'memberNote': 'Member Note',
      'rejectedAt': DateTime.now().toIso8601String(),
      'startDate': DateTime.now().toIso8601String(),
      'type': 'sickness',
      'userId': 1,
      'member': {
        'crewId': 1,
        'id': 1,
        'name': 'Name',
        'image': 'Image',
        'userId': 1,
      },
    });

    // Then
    expect(absence.crewId, isA<int>());
    expect(absence.id, isA<int>());
    expect(absence.endDate, isA<DateTime>());
    expect(absence.startDate, isA<DateTime>());
    expect(absence.userId, isA<int>());
    expect(absence.admitterId, isA<int>());
    expect(absence.admitterNote, isA<String>());
    expect(absence.memberNote, isA<String>());
    expect(absence.createdAt, isA<DateTime>());
    expect(absence.confirmedAt, isA<DateTime>());
    expect(absence.rejectedAt, isA<DateTime>());
    expect(absence.type, AbsenceType.sickness);
    expect(absence.member, isA<Member>());
  });

  test('Absence model toJson test', () {
    // Given
    final absence = Absence(
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
        name: 'Name',
        image: 'Image',
      ),
    );

    // When
    final absenceJson = absence.toJson();
    final keys = [
      'crewId',
      'id',
      'admitterId',
      'admitterNote',
      'confirmedAt',
      'createdAt',
      'memberNote',
      'rejectedAt',
      'endDate',
      'startDate',
      'type',
      'userId',
    ];

    //Then
    for (var key in keys) {
      expect(absenceJson.containsKey(key), isTrue);
    }
  });
}
