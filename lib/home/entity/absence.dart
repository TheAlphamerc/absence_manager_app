import 'package:freezed_annotation/freezed_annotation.dart';
part 'absence.g.dart';
part 'absence.freezed.dart';

@freezed
class Absence with _$Absence {
  const factory Absence({
    required int crewId,
    required int userId,
    required int id,
    int? admitterId,
    @Default('') String admitterNote,
    @Default('') String memberNote,
    DateTime? confirmedAt,
    DateTime? rejectedAt,
    required DateTime endDate,
    required DateTime startDate,
    @Default(AbsenceType.vacation) AbsenceType type,
    required DateTime createdAt,
  }) = _Absence;
  factory Absence.fromJson(Map<String, dynamic> json) =>
      _$AbsenceFromJson(json);
}

enum AbsenceType {
  vacation,
  sickness,
}
