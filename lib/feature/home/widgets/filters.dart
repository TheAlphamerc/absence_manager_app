import 'package:flutter/material.dart';

typedef OnFilterApplied = void Function(
    String? type, DateTime? startDate, DateTime? endDate);

class FiltersWidget extends StatefulWidget {
  const FiltersWidget({super.key, required this.onFilterApplied});
  final OnFilterApplied onFilterApplied;

  @override
  FiltersWidgetState createState() => FiltersWidgetState();
}

class FiltersWidgetState extends State<FiltersWidget> {
  String? _selectedType;
  DateTime? _startDate;
  DateTime? _endDate;

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

  void _applyFilters(BuildContext context) {
    // context.read<AbsenceBloc>().add(
    //       FetchAbsences(
    //         typeFilter: _selectedType,
    //         startDate: _startDate,
    //         endDate: _endDate,
    //       ),
    //     );

    Navigator.of(context).pop(); // Close the dialog after applying filters
    widget.onFilterApplied(_selectedType, _startDate, _endDate);
  }

  void _clearFilters(BuildContext context) {
    setState(() {
      _selectedType = null;
      _startDate = null;
      _endDate = null;
    });
    Navigator.of(context).pop(); // Close the dialog after clearing filters
    widget.onFilterApplied(null, null, null);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Filters'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<String>(
              value: _selectedType,
              hint: const Text('Filter by type'),
              items: ['sickness', 'vacation'].map((String type) {
                return DropdownMenuItem<String>(
                  value: type,
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
            Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton.icon(
                      icon: const Icon(Icons.calendar_month_outlined),
                      onPressed: () => _selectDate(context, true),
                      label: Text(
                        _startDate == null
                            ? 'Select Start Date'
                            : _startDate!.toLocal().toString().split(' ')[0],
                      ),
                    ),
                  ),
                ),
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
            Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton.icon(
                      icon: const Icon(Icons.calendar_month_outlined),
                      onPressed: () => _selectDate(context, false),
                      label: Text(
                        _endDate == null
                            ? 'Select End Date'
                            : _endDate!.toLocal().toString().split(' ')[0],
                      ),
                    ),
                  ),
                ),
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
        TextButton(
          onPressed: () => _clearFilters(context),
          child: const Text('Clear Filters'),
        ),
        TextButton(
          onPressed: () => _applyFilters(context),
          child: const Text('Apply Filters'),
        ),
      ],
    );
  }
}
