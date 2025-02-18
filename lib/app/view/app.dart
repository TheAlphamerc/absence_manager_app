import 'package:absence_manager_app/feature/feature.dart';
import 'package:absence_manager_app/feature/home/bloc/absence_bloc.dart';
import 'package:absence_manager_app/feature/home/repository/absence_repository.dart';
import 'package:absence_manager_app/l10n/l10n.dart';
import 'package:api/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        useMaterial3: true,
      ),
      locale: Locale('en'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
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
