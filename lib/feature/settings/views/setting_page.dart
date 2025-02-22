import 'package:absence_manager_app/feature/settings/bloc/setting_bloc.dart';
import 'package:absence_manager_app/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/widgets.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});
  static Route<T> getRoute<T>(SettingBloc bloc) {
    return MaterialPageRoute(
      builder: (_) {
        return BlocProvider.value(
          value: bloc,
          child: const SettingPage(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.settingPageTitle)),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: <Widget>[
            ThemeModeSettingsTile(),
            const Divider(),
            LocaleSettingsTile(),
          ],
        ),
      ),
    );
  }
}
