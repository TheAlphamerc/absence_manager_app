import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../entity/absence.dart';
import '../repository/absence_repository.dart';
part 'absence_bloc.freezed.dart';
part 'absence_event.dart';
part 'absence_state.dart';

class AbsenceBloc extends Bloc<AbsenceEvent, AbsenceState> {
  final AbsenceRepository repository;

  AbsenceBloc({required this.repository}) : super(AbsenceState.initial()) {
    on<FetchAbsences>(_onFetchAbsences);
    on<LoadMoreAbsences>(_onLoadMoreAbsences);
  }

  Future<void> _onFetchAbsences(
      FetchAbsences event, Emitter<AbsenceState> emit) async {
    final currentTypeFilter = event.typeFilter;
    final currentStartDate = event.startDate;
    final currentEndDate = event.endDate;
    emit(state.copyWith(status: Status.loading));
    try {
      final result = await repository.getAbsences(
          page: 1,
          filterBy: FilterBy(
            typeFilter: currentTypeFilter,
            startDate: currentStartDate,
            endDate: currentEndDate,
          ));

      final total = await _getTotalAbsences(
        typeFilter: currentTypeFilter,
        startDate: currentStartDate,
        endDate: currentEndDate,
      );
      emit(AbsenceState(
        absences: result,
        page: 1,
        hasReachedMax: result.length < 10,
        totalAbsences: total,
        status: Status.loaded,
        filterBy: FilterBy(
          typeFilter: currentTypeFilter,
          startDate: currentStartDate,
          endDate: currentEndDate,
        ),
      ));
    } catch (e) {
      emit(state.copyWith(
        message: 'Failed to fetch absences',
        status: Status.error,
      ));
      debugPrint(e.toString());
    }
  }

  Future<void> _onLoadMoreAbsences(
      LoadMoreAbsences event, Emitter<AbsenceState> emit) async {
    if (state.hasReachedMax ||
        [Status.loading, Status.loadMore].contains(state.status)) {
      return;
    }

    emit(state.copyWith(status: Status.loadMore));

    try {
      // Simulate network delay
      await Future.delayed(const Duration(seconds: 3));
      debugPrint('Loading page: ${state.page}');
      final result = await repository.getAbsences(
          page: state.page, filterBy: state.filterBy);

      emit(state.copyWith(
        absences: [...state.absences, ...result],
        page: state.page + 1,
        hasReachedMax: result.length < 10,
        status: Status.loaded,
      ));
    } catch (e) {
      emit(state.copyWith(
        message: 'Failed to load more absences',
        status: Status.error,
      ));
    }
  }

  Future<int> _getTotalAbsences({
    String? typeFilter,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    return repository.getTotalAbsences(
      typeFilter: typeFilter,
      startDate: startDate,
      endDate: endDate,
    );
  }
}
