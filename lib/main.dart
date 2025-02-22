import 'package:absence_manager_app/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'feature/settings/bloc/setting_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUpDependency();
  runApp(BlocProvider(
    create: (context) => getIt<SettingBloc>(),
    child: const App(),
  ));
}
