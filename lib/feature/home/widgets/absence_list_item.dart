import 'package:absence_manager_app/l10n/l10n.dart';
import 'package:absence_manager_app/theme/theme.dart';
import 'package:flutter/material.dart';
import '../entity/entity.dart';

/// AbsenceListItem is a widget that displays the details of an absence.
/// The details include the member's name, type, status, start date, end date,
/// member note, and admitter note.
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
              _label(context, context.l10n.type, absence.type.name),
              _label(context, context.l10n.status,
                  absence.type.name.toUpperCase()),
              Row(
                children: [
                  _label(context, context.l10n.from,
                      _formatDate(absence.startDate)),
                  const SizedBox(width: 8),
                  _label(
                      context, context.l10n.to, _formatDate(absence.endDate)),
                ],
              ),
              if (absence.memberNote.isNotEmpty)
                _label(context, context.l10n.note, absence.memberNote),
              if (absence.admitterNote.isNotEmpty)
                _label(
                    context, context.l10n.admitterNote, absence.admitterNote),
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

  /// Generate iCal file for the absence.
  void _generateICal(Absence absence) {}

  Widget _label(BuildContext context, String key, String value) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$key:',
          style: context.textTheme.titleSmall,
        ),
        const SizedBox(width: 4),
        Flexible(
            child: Text(
          value,
          style: context.textTheme.bodyMedium!.copyWith(
            color: context.colorScheme.secondary,
          ),
        )),
      ],
    );
  }

  Widget _buildActions(BuildContext context, Absence absence) {
    return PopupMenuButton(
      key: const Key('absence_popup_menu'),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            child: ListTile(
              key: const Key('generate_ical'),
              title: const Text('Generate iCal'),
              onTap: () => _generateICal(absence),
            ),
          ),
        ];
      },
    );
  }
}
