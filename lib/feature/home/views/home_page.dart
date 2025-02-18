import 'package:absence_manager_app/feature/home/bloc/absence_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _openFiltersDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return FiltersWidget(
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
        title: const Text('Absence Manager'),
        actions: [
          BlocBuilder<AbsenceBloc, AbsenceState>(
            builder: (context, state) {
              if (state.totalAbsences > 0) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Total: ${state.totalAbsences}'),
                );
              }
              return const SizedBox.shrink();
            },
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () => _openFiltersDialog(context),
          ),
        ],
      ),
      body: Column(
        children: [
          // const FiltersWidget(),
          Expanded(
            child: AbsenceList(),
          ),
        ],
      ),
    );
  }
}
