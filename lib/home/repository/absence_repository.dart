import 'package:api/api.dart';

import '../entity/entity.dart';

class AbsenceRepository {
  late final Api api;
  AbsenceRepository({required this.api});

  Future<List<Absence>> getAbsences({
    int page = 1,
    int perPage = 10,
    String? typeFilter,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    final List<dynamic> absencesData = await api.absences();

    final List<dynamic> membersData = await api.members();

    List<Absence> absences = absencesData.map((json) {
      final member = membersData.firstWhere(
        (m) => m['userId'] == json['userId'],
        orElse: () => {},
      );
      final map = json..addAll({'member': member});
      return Absence.fromJson(map);
    }).toList();

    // Apply filters
    if (typeFilter != null) {
      absences = absences.where((a) => a.type.name == typeFilter).toList();
    }
    if (startDate != null) {
      absences = absences.where((a) => a.startDate.isAfter(startDate)).toList();
    }
    if (endDate != null) {
      absences = absences.where((a) => a.endDate.isBefore(endDate)).toList();
    }

    // Paginate
    final start = (page - 1) * perPage;
    final end = start + perPage;
    if (start >= absences.length) return [];
    return absences.sublist(
        start, end > absences.length ? absences.length : end);
  }
}
