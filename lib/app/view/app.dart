import 'package:absence_manager_app/feature/feature.dart';
import 'package:absence_manager_app/feature/home/bloc/absence_bloc.dart';
import 'package:absence_manager_app/feature/home/repository/absence_repository.dart';
import 'package:absence_manager_app/l10n/l10n.dart';
import 'package:absence_manager_app/theme/theme.dart';
import 'package:api/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../feature/settings/bloc/setting_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: context.select((SettingBloc bloc) => bloc.state.themeMode),
      locale: context.select((SettingBloc bloc) => bloc.state.locale),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => AbsenceBloc(
          repository: AbsenceRepository(
            api: Api(),
          ),
        )..add(const FetchAbsences()),
        child: const HomePage(),
      ),
    );
  }
}
