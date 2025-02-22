import 'package:absence_manager_app/feature/home/bloc/absence_bloc.dart';
import 'package:api/api.dart';

import '../entity/entity.dart';

class AbsenceRepository {
  late final Api api;
  AbsenceRepository({required this.api});

  /// Fetch the absences from the API.
  /// The absences are paginated and filtered based on the filter values.
  /// The absences are filtered by type and date.
  Future<List<Absence>> getAbsences({
    int page = 1,
    int perPage = 10,
    FilterBy? filterBy,
  }) async {
    final List<dynamic> absencesData = await api.absences();

    final List<dynamic> membersData = await api.members();

    List<Absence> absences = absencesData.map((json) {
      final member = membersData.firstWhere(
        (m) => m['userId'] == json['userId'],
      );
      final map = json..addAll({'member': member});
      return Absence.fromJson(map);
    }).toList();

    // Apply filters to the absences list based on the filter values
    if (filterBy?.typeFilter != null) {
      absences =
          absences.where((a) => a.type.name == filterBy?.typeFilter).toList();
    }
    // Filter by start and end date if provided
    if (filterBy?.startDate != null) {
      absences = absences
          .where((a) => a.startDate.isAfter(filterBy!.startDate!))
          .toList();
    }
    // Filter by end date if provided
    if (filterBy?.endDate != null) {
      absences = absences
          .where((a) => a.endDate.isBefore(filterBy!.endDate!))
          .toList();
    }

    // Paginate the absences list
    final start = (page - 1) * perPage;
    final end = start + perPage;
    // If the start index is greater than the length of the absences list, return an empty list
    if (start >= absences.length) return [];

    // Return the sublist of absences
    return absences.sublist(
        start, end > absences.length ? absences.length : end);
  }

  // Get the total number of absences based on the filter values.
  Future<int> getTotalAbsences({
    String? typeFilter,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    List<dynamic> absencesData = await api.absences();

    List<Absence> absences = absencesData.map((json) {
      final map = json;
      return Absence.fromJson(map);
    }).toList();
    // Apply filters
    if (typeFilter != null) {
      absences = absences.where((a) => a.type.name == typeFilter).toList();
    }
    // Filter by start date if provided
    if (startDate != null) {
      absences = absences.where((a) => a.startDate.isAfter(startDate)).toList();
    }

    // Filter by end date if provided
    if (endDate != null) {
      absences = absences.where((a) => a.endDate.isBefore(endDate)).toList();
    }
    return absences.length;
  }
}
