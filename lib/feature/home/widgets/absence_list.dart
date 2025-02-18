import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/absence_bloc.dart';
import 'widgets.dart';

class AbsenceList extends StatelessWidget {
  const AbsenceList({super.key});

  Widget _list(BuildContext context, AbsenceState state) {
    if (state.absences.isEmpty) {
      return const Center(
        child: Text('No absences record found'),
      );
    }
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: state.hasReachedMax
          ? state.absences.length
          : state.absences.length + 1,
      itemBuilder: (context, index) {
        if (index >= state.absences.length) {
          context.read<AbsenceBloc>().add(LoadMoreAbsences());
          return LoadingIndicator(height: 100);
        }
        return AbsenceListItem(
          absence: state.absences[index],
          index: index,
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AbsenceBloc, AbsenceState>(
      builder: (context, state) {
        return EnumStack<Status>(
          value: state.status,
          children: {
            Status.initial: const SizedBox.shrink(),
            Status.loading: const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
            Status.error: ErrorView(message: state.message ?? ""),
            Status.loaded: _list(context, state),
            Status.loadMore: _list(context, state),
          },
        );
      },
    );
  }
}
