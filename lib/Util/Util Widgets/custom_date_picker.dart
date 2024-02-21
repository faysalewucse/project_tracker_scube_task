import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scube_project_tracker/Helper/Constant.dart';
import 'package:scube_project_tracker/Helper/colors.dart';
import 'package:scube_project_tracker/Util/Util.dart';

class CustomDatePicker extends StatefulWidget {
  final String initialDate;
  final String label;
  final TextStyle? labelStyle;
  final bool? required;
  final Function(DateTime) onDateSelected;

  const CustomDatePicker({
    Key? key,
    required this.initialDate,
    required this.onDateSelected,
    required this.label,
    this.labelStyle,
    this.required,
  }) : super(key: key);

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _parseInitialDate();
  }

  void _parseInitialDate() {
    try {
      _selectedDate = DateFormat('yyyy-MM-dd').parse(widget.initialDate);
    } catch (e) {
      showMessage('Error parsing initial date: $e', isSuccess: false);
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: ThemeData(
            dialogTheme: const DialogTheme(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(2.0),
                ),
              ),
            ),
            colorScheme: const ColorScheme.light(
              primary: PRIMARY_COLOR, // Adjust as needed
              onPrimary: WHITE,
              surface: WHITE,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        widget.onDateSelected(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              widget.label,
              style:
                  widget.labelStyle ?? Theme.of(context).textTheme.bodyMedium,
            ),
            if (widget.required == true)
              const Text(
                " *",
                style: TextStyle(color: ERROR_500),
              ),
          ],
        ),
        VERTICAL_GAP_12,
        InkWell(
          onTap: () {
            _selectDate(context);
          },
          child: Container(
            width: MAX_WIDTH,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: NEUTRAL_N10,
              borderRadius: ROUNDED_2,
              border: Border.all(color: NEUTRAL_N40),
            ),
            child: Text(
              _selectedDate != null
                  ? DateFormat('yyyy-MM-dd').format(_selectedDate!)
                  : 'Select Date',
              style: const TextStyle(fontSize: 15, color: BLACK),
            ),
          ),
        ),
        VERTICAL_GAP_12,
      ],
    );
  }
}
