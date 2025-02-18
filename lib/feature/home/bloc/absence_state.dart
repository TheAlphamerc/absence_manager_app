part of 'absence_bloc.dart';

@freezed
class AbsenceState with _$AbsenceState {
  const factory AbsenceState({
    @Default([]) List<Absence> absences,
    @Default(1) int page,
    @Default(false) bool hasReachedMax,
    @Default(0) int totalAbsences,
    @Default(AbsenceType.all) AbsenceType typeFilter,
    @Default(Status.initial) Status status,
    String? message,
  }) = _AbsenceState;
  factory AbsenceState.initial() => const AbsenceState();
}

enum Status { initial, loading, loaded, loadMore, error }
