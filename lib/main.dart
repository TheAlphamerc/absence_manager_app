import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/view/app.dart';
import 'feature/settings/bloc/setting_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(BlocProvider(
    create: (context) => SettingBloc(),
    child: const App(),
  ));
}
