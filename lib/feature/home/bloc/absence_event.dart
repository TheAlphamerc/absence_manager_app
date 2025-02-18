part of 'absence_bloc.dart';

abstract class AbsenceEvent extends Equatable {
  const AbsenceEvent();

  @override
  List<Object> get props => [];
}

class FetchAbsences extends AbsenceEvent {
  final String? typeFilter;
  final DateTime? startDate;
  final DateTime? endDate;

  const FetchAbsences({this.typeFilter, this.startDate, this.endDate});
}

class LoadMoreAbsences extends AbsenceEvent {}
