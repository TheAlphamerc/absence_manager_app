import 'package:absence_manager_app/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/setting_bloc.dart';

class ThemeModeSettingsTile extends StatelessWidget {
  const ThemeModeSettingsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      key: const Key('theme_mode_settings_tile'),
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(context.l10n.settingPageDarkMode,
            key: const Key('dark_mode_text')),
        BlocBuilder<SettingBloc, SettingState>(
          builder: (context, state) {
            return Switch.adaptive(
              key: const Key('dark_mode_switch'),
              value: state.themeMode == ThemeMode.dark,
              onChanged: (value) {
                context.read<SettingBloc>().add(
                      ChangeTheme(value ? ThemeMode.dark : ThemeMode.light),
                    );
              },
            );
          },
        ),
      ],
    );
  }
}
