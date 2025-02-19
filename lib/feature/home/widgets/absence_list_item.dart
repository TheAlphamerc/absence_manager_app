import 'package:flutter/material.dart';
import '../entity/entity.dart';

class AbsenceListItem extends StatelessWidget {
  final Absence absence;
  final int index;
  const AbsenceListItem(
      {super.key, required this.absence, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 40,
          width: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.network(
              '${absence.member?.image}?id=${absence.member!.userId}',
              fit: BoxFit.cover,
              cacheWidth: 40,
              cacheHeight: 40,
              key: Key(absence.id.toString()),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                absence.member?.name ?? "",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text('Type: ${absence.type}'),
              Text('Status: ${absence.type.name.toUpperCase()}'),
              Text(
                  'From: ${_formatDate(absence.startDate)} To: ${_formatDate(absence.endDate)}'),
              if (absence.memberNote.isNotEmpty)
                Text('Note: ${absence.memberNote}'),
              if (absence.admitterNote.isNotEmpty)
                Text('Admitter Note: ${absence.admitterNote}'),
            ],
          ),
        ),
        _buildActions(context, absence),
      ],
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  void _generateICal(Absence absence) {}

  Widget _buildActions(BuildContext context, Absence absence) {
    return PopupMenuButton(
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            child: ListTile(
              title: const Text('Generate iCal'),
              onTap: () => _generateICal(absence),
            ),
          ),
        ];
      },
    );
  }
}
