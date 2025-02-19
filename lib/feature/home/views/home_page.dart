import 'package:absence_manager_app/feature/home/bloc/absence_bloc.dart';
import 'package:absence_manager_app/feature/settings/views/setting_page.dart';
import 'package:absence_manager_app/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../settings/bloc/setting_bloc.dart';
import '../widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _openFiltersDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return FiltersWidget(
          filterBy: context.read<AbsenceBloc>().state.filterBy,
          onFilterApplied:
              (String? type, DateTime? startDate, DateTime? endDate) {
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
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () => _openFiltersDialog(context),
          ),
          IconButton(
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
