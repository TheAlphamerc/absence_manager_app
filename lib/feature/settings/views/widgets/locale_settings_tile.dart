import 'package:absence_manager_app/feature/settings/bloc/setting_bloc.dart';
import 'package:absence_manager_app/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocaleSettingsTile extends StatelessWidget {
  const LocaleSettingsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      key: const Key('locale_settings_tile'),
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(context.l10n.settingPageLanguage),
        BlocBuilder<SettingBloc, SettingState>(
          builder: (context, state) {
            return DropdownButton<String>(
              key: const Key('language_dropdown_button'),
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
                    key: Key(value),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                context.read<SettingBloc>().add(
                      ChangeLocale(Locale(value!)),
                    );
              },
            );
          },
        ),
      ],
    );
  }
}
