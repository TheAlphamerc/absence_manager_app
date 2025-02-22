import 'package:absence_manager_app/app/di/locator.dart';
import 'package:absence_manager_app/feature/feature.dart';
import 'package:absence_manager_app/feature/home/bloc/absence_bloc.dart';
import 'package:absence_manager_app/l10n/l10n.dart';
import 'package:absence_manager_app/theme/theme.dart';
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
      /**
       * The themeMode and locale are selected from the SettingBloc state.
       * The themeMode and locale are used to set the theme and locale of the app.
       */
      themeMode: context.select((SettingBloc bloc) => bloc.state.themeMode),
      /**
       * The locale is selected from the SettingBloc state.
       * The locale is used to set the locale of the app.
       */
      locale: context.select((SettingBloc bloc) => bloc.state.locale),
      /**
       * The localizationsDelegates and supportedLocales are used to provide the app with the translations.
       */
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      /**
       * The supportedLocales are used to provide the app with the supported locales.
       */
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        /**
         * The AbsenceBloc is created and added to the BlocProvider.
         * The FetchAbsences event is added to the AbsenceBloc to fetch the absences.
         */
        create: (context) => getIt<AbsenceBloc>()..add(const FetchAbsences()),
        child: const HomePage(),
      ),
    );
  }
}
