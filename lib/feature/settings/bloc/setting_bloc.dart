import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_bloc.freezed.dart';
part 'setting_event.dart';
part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(SettingState.initial()) {
    on<ChangeTheme>(_onChangeTheme);
    on<ChangeLocale>(_onChangeLocale);
  }

  void _onChangeTheme(ChangeTheme event, Emitter<SettingState> emit) {
    emit(state.copyWith(themeMode: event.themeMode));
  }

  void _onChangeLocale(ChangeLocale event, Emitter<SettingState> emit) {
    emit(state.copyWith(locale: event.locale));
  }
}
