import 'package:api/api.dart';
import 'package:get_it/get_it.dart';

import '../../feature/home/bloc/absence_bloc.dart';
import '../../feature/home/repository/absence_repository.dart';
import '../../feature/settings/bloc/setting_bloc.dart';

final getIt = GetIt.instance;

void setUpDependency() {
  getIt.registerSingleton<Api>(Api());
  getIt.registerSingleton<AbsenceRepository>(
      AbsenceRepository(api: getIt<Api>()));
  getIt.registerSingleton<AbsenceBloc>(
      AbsenceBloc(repository: getIt<AbsenceRepository>()));
  getIt.registerSingleton<SettingBloc>(SettingBloc());
}
