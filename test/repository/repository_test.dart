import 'package:absence_manager_app/feature/home/bloc/absence_bloc.dart';
import 'package:absence_manager_app/feature/home/repository/absence_repository.dart';
import 'package:api/api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Api>()])
void main() {
  late AbsenceRepository repository;
  late Api mockApi;
  setUpAll(() {
    mockApi = MockApi();
    repository = AbsenceRepository(api: mockApi);
  });

  group('getAbsences', () {
    test('Fetch absences without filters', () async {
      // Arrange
      when(mockApi.absences()).thenAnswer((_) async => [
            {
              "admitterId": null,
              "admitterNote": "",
              "confirmedAt": "2020-12-12T18:03:55.000+01:00",
              "createdAt": "2020-12-12T14:17:01.000+01:00",
              "crewId": 352,
              "endDate": "2021-01-13",
              "id": 2351,
              "memberNote": "",
              "rejectedAt": null,
              "startDate": "2021-01-13",
              "type": "sickness",
              "userId": 2664
            },
          ]);
      when(mockApi.members()).thenAnswer((_) async => [
            {
              "crewId": 352,
              "id": 2650,
              "image": "https://loremflickr.com/300/400",
              "name": "Mike",
              "userId": 2664
            },
          ]);

      // Act
      final result = await repository.getAbsences();

      // Assert
      expect(result.length, 1);
      expect(result[0].userId, 2664);
      expect(result[0].member!.name, 'Mike');
    });
    test('Fetch absences with type filter', () async {
      // Arrange
      when(mockApi.absences()).thenAnswer((_) async => [
            {
              "admitterId": null,
              "admitterNote": "",
              "confirmedAt": "2020-12-12T18:03:55.000+01:00",
              "createdAt": "2020-12-12T14:17:01.000+01:00",
              "crewId": 352,
              "endDate": "2021-01-13",
              "id": 2351,
              "memberNote": "",
              "rejectedAt": null,
              "startDate": "2021-01-13",
              "type": "sickness",
              "userId": 2664
            }
          ]);
      when(mockApi.members()).thenAnswer((_) async => [
            {
              "crewId": 352,
              "id": 2650,
              "image": "https://loremflickr.com/300/400",
              "name": "Mike",
              "userId": 2664
            },
          ]);
      // Act
      final result = await repository.getAbsences(
        page: 1,
        filterBy: FilterBy(
          typeFilter: 'sickness',
          startDate: DateTime(2021, 1, 10),
          endDate: DateTime.now(),
        ),
      );

      // Assert
      expect(result.length, 1);
      expect(result[0].userId, 2664);
      expect(result[0].member!.name, 'Mike');
    });
    test('Fetch absences with no results', () async {
      // Arrange
      when(mockApi.absences()).thenAnswer((_) async => [
            {
              "admitterId": null,
              "admitterNote": "",
              "confirmedAt": "2020-12-12T18:03:55.000+01:00",
              "createdAt": "2020-12-12T14:17:01.000+01:00",
              "crewId": 352,
              "endDate": "2021-01-13",
              "id": 2351,
              "memberNote": "",
              "rejectedAt": null,
              "startDate": "2021-01-13",
              "type": "sickness",
              "userId": 2664
            },
          ]);
      when(mockApi.members()).thenAnswer((_) async => [
            {
              "crewId": 352,
              "id": 2650,
              "image": "https://loremflickr.com/300/400",
              "name": "Mike",
              "userId": 2664
            },
          ]);

      // Act
      final result = await repository.getAbsences(
        filterBy: FilterBy(typeFilter: 'vacation'),
      );

      // Assert
      expect(result.length, 0);
    });
  });

  group('getTotalAbsences', () {
    test('Get total absences without filters', () async {
      // Arrange
      when(mockApi.absences()).thenAnswer((_) async => [
            {
              "admitterId": null,
              "admitterNote": "",
              "confirmedAt": "2020-12-12T18:03:55.000+01:00",
              "createdAt": "2020-12-12T14:17:01.000+01:00",
              "crewId": 352,
              "endDate": "2021-01-13",
              "id": 2351,
              "memberNote": "",
              "rejectedAt": null,
              "startDate": "2021-01-13",
              "type": "sickness",
              "userId": 2664
            },
          ]);

      // Act
      final result = await repository.getTotalAbsences();

      // Assert
      expect(result, 1);
    });

    test('Get total absences with filters', () async {
      // Arrange
      when(mockApi.absences()).thenAnswer((_) async => [
            {
              "admitterId": null,
              "admitterNote": "",
              "confirmedAt": "2020-12-12T18:03:55.000+01:00",
              "createdAt": "2020-12-12T14:17:01.000+01:00",
              "crewId": 352,
              "endDate": "2021-01-13",
              "id": 2351,
              "memberNote": "",
              "rejectedAt": null,
              "startDate": "2021-01-13",
              "type": "sickness",
              "userId": 2664
            },
            {
              "admitterId": null,
              "admitterNote": "",
              "confirmedAt": "2021-01-09T18:43:29.000+01:00",
              "createdAt": "2021-01-09T17:45:47.000+01:00",
              "crewId": 352,
              "endDate": "2021-01-11",
              "id": 2634,
              "memberNote": "Nachmittag 0,5 Tage. Danke.",
              "rejectedAt": null,
              "startDate": "2021-01-11",
              "type": "vacation",
              "userId": 649
            },
          ]);

      // Act
      final result = await repository.getTotalAbsences(
        typeFilter: 'sickness',
        startDate: DateTime(2021, 1, 10),
        endDate: DateTime.now(),
      );

      // Assert
      expect(result, 1);
    });
  });
}
