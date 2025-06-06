part of 'setting_bloc.dart';

@freezed
class SettingState with _$SettingState {
  const factory SettingState({
    @Default(ThemeMode.light) ThemeMode themeMode,
    @Default(Locale('en')) Locale locale,
  }) = _SettingState;
  factory SettingState.initial() => const SettingState();
}
