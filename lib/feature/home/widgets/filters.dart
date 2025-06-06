import 'package:absence_manager_app/l10n/l10n.dart';
import 'package:flutter/material.dart';

import '../bloc/absence_bloc.dart';

typedef OnFilterApplied = void Function(
    String? type, DateTime? startDate, DateTime? endDate);

/// FiltersWidget is used to filter the absences by type and date.
class FiltersWidget extends StatefulWidget {
  const FiltersWidget({
    super.key,
    required this.onFilterApplied,
    this.filterBy,
  });

  /// The onFilterApplied function is called when the filters are applied or cleared.
  final OnFilterApplied onFilterApplied;

  /// The filterBy is used to set the default values of the filters.
  final FilterBy? filterBy;

  @override
  FiltersWidgetState createState() => FiltersWidgetState();
}

class FiltersWidgetState extends State<FiltersWidget> {
  String? _selectedType;
  DateTime? _startDate;
  DateTime? _endDate;

  @override
  void initState() {
    super.initState();
    _selectedType = widget.filterBy?.typeFilter;
    _startDate = widget.filterBy?.startDate;
    _endDate = widget.filterBy?.endDate;
  }

  /// Select the date from the date picker.
  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        if (isStartDate) {
          _startDate = picked;
        } else {
          _endDate = picked;
        }
      });
    }
  }

  /// Apply the filters and close the dialog.
  void _applyFilters(BuildContext context) {
    Navigator.of(context).pop();
    widget.onFilterApplied(_selectedType, _startDate, _endDate);
  }

  /// Clear the filters.
  void _clearFilters(BuildContext context) {
    setState(() {
      _selectedType = null;
      _startDate = null;
      _endDate = null;
    });
    Navigator.of(context).pop();
    widget.onFilterApplied(null, null, null);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(context.l10n.filters),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<String>(
              key: const Key('filter_by_type_dropdown'),
              value: _selectedType,
              hint: Text(context.l10n.filterByType,
                  key: Key('filter_by_type_text')),
              items: ['sickness', 'vacation'].map((String type) {
                return DropdownMenuItem<String>(
                  value: type,
                  key: Key('filter_by_type_$type'),
                  child: Text(type),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  _selectedType = value;
                });
              },
            ),
            const SizedBox(height: 10),
            /**
             * Start date button to select the start date.
             */
            Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton.icon(
                      key: const Key('start_date_button'),
                      icon: const Icon(Icons.calendar_month_outlined),
                      onPressed: () => _selectDate(context, true),
                      label: Text(
                        _startDate == null
                            ? context.l10n.selectStartDate
                            : _startDate!.toLocal().toString().split(' ')[0],
                        key: const Key('start_date_text'),
                      ),
                    ),
                  ),
                ),
                /**
                 * Clear button to clear the start date if it is pre selected.
                 */
                if (_startDate != null)
                  IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      setState(() {
                        _startDate = null;
                      });
                    },
                  ),
              ],
            ),
            /**
             * End date button to select the end date.
             */
            Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton.icon(
                      key: const Key('end_date_button'),
                      icon: const Icon(Icons.calendar_month_outlined),
                      onPressed: () => _selectDate(context, false),
                      label: Text(
                        _endDate == null
                            ? context.l10n.selectEndDate
                            : _endDate!.toLocal().toString().split(' ')[0],
                        key: const Key('end_date_text'),
                      ),
                    ),
                  ),
                ),
                /**
                 * Clear button to clear the end date if it is pre selected.
                 */
                if (_endDate != null)
                  IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      setState(() {
                        _endDate = null;
                      });
                    },
                  ),
              ],
            )
          ],
        ),
      ),
      actions: [
        /**
         * Clear filters button to clear the filters.
         */
        TextButton(
          key: const Key('clear_filters_button'),
          onPressed: () => _clearFilters(context),
          child: Text(context.l10n.clearFilters),
        ),
        /**
         * Apply filters button to apply the filters.
         */
        TextButton(
          key: const Key('apply_filters_button'),
          onPressed: () => _applyFilters(context),
          child: Text(context.l10n.applyFilters),
        ),
      ],
    );
  }
}
