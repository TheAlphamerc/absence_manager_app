import 'package:absence_manager_app/feature/settings/bloc/setting_bloc.dart';
import 'package:absence_manager_app/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      body: BlocBuilder<SettingBloc, SettingState>(
        builder: (context, state) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(context.l10n.settingPageDarkMode),
                    Switch.adaptive(
                      value: state.themeMode == ThemeMode.dark,
                      onChanged: (value) {
                        context.read<SettingBloc>().add(
                              ChangeTheme(
                                  value ? ThemeMode.dark : ThemeMode.light),
                            );
                      },
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(context.l10n.settingPageLanguage),
                    DropdownButton<String>(
                      value: state.locale.languageCode,
                      items: const <String>['en', 'de']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            {
                              'en': 'English',
                              'de': 'Deutsch',
                            }[value]!,
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        context.read<SettingBloc>().add(
                              ChangeLocale(Locale(value!)),
                            );
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
