import 'package:absence_manager_app/feature/home/bloc/absence_bloc.dart';
import 'package:absence_manager_app/feature/settings/views/setting_page.dart';
import 'package:absence_manager_app/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../settings/bloc/setting_bloc.dart';
import '../widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  /// Open the filter dialog to filter the absences.
  /// The filter dialog is opened when the filter button is pressed.
  /// The filter dialog is used to filter the absences by type and date.
  void _openFiltersDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (_) {
        return FiltersWidget(
          /**
           * Default filterBy value is taken from the AbsenceBloc state.
           */
          filterBy: context.read<AbsenceBloc>().state.filterBy,
          onFilterApplied:
              (String? type, DateTime? startDate, DateTime? endDate) {
            /**
             * update the AbsenceBloc state with the new filter values.
             * Fetch the absences with the new filter values.
             */
            context.read<AbsenceBloc>().add(
                  FetchAbsences(
                    typeFilter: type,
                    startDate: startDate,
                    endDate: endDate,
                  ),
                );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).appName),
        actions: [
          /**
           * Display total Absences if there are any.
           */
          BlocBuilder<AbsenceBloc, AbsenceState>(
            builder: (context, state) {
              if (state.totalAbsences > 0) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      '${AppLocalizations.of(context).total}: ${state.totalAbsences}'),
                );
              }
              return const SizedBox.shrink();
            },
          ),
          /**
           * Filter button to open the filter dialog.
           */
          IconButton(
            key: const Key('filter_button'),
            icon: const Icon(Icons.filter_list),
            onPressed: () => _openFiltersDialog(context),
          ),
          /**
           * Settings button to open the settings page.
           */
          IconButton(
              key: const Key('settings_button'),
              onPressed: () {
                Navigator.push(
                    context, SettingPage.getRoute(context.read<SettingBloc>()));
              },
              icon: const Icon(Icons.settings)),
        ],
      ),
      body: AbsenceList(),
    );
  }
}
