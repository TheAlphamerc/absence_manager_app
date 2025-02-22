import 'package:api/api.dart';
import 'package:get_it/get_it.dart';

import '../../feature/home/bloc/absence_bloc.dart';
import '../../feature/home/repository/absence_repository.dart';
import '../../feature/settings/bloc/setting_bloc.dart';

final getIt = GetIt.instance;

/// Set up dependency injection. Register all the dependencies that will be used in the app
/// and can be accessed globally
void setUpDependency() {
  getIt.registerSingleton<Api>(Api());
  getIt.registerSingleton<AbsenceRepository>(
      AbsenceRepository(api: getIt<Api>()));
  getIt.registerSingleton<AbsenceBloc>(
      AbsenceBloc(repository: getIt<AbsenceRepository>()));
  getIt.registerSingleton<SettingBloc>(SettingBloc());
}
