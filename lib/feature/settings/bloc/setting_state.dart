part of 'setting_bloc.dart';

@freezed
class SettingState with _$SettingState {
  const factory SettingState({
    @Default(ThemeMode.light) ThemeMode themeMode,
    @Default(Locale('de', 'DE')) Locale locale,
  }) = _SettingState;
  factory SettingState.initial() => const SettingState();
}
