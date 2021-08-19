import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerFormField extends StatefulWidget {
  final DateTime currentDate;
  final void Function(DateTime?) onSaved;

  DatePickerFormField({required this.currentDate, required this.onSaved});

  @override
  _DatePickerFormFieldState createState() =>
      _DatePickerFormFieldState(currentDate: currentDate, onSaved: onSaved);
}

class _DatePickerFormFieldState extends State<DatePickerFormField> {
  late TextEditingController _controller;
  late DateTime currentDate;
  final void Function(DateTime?) onSaved;

  _DatePickerFormFieldState(
      {required this.currentDate, required this.onSaved}) {
    _controller = new TextEditingController()
      ..text = DateFormat.yMMMEd("ja").format(currentDate);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: Key(currentDate.toString()),
      controller: _controller,
      decoration: const InputDecoration(
        labelText: "いつ",
      ),
      readOnly: true,
      onTap: () async {
        final picked = await showDatePicker(
          locale: const Locale("ja"),
          context: context,
          initialDate: currentDate,
          firstDate: DateTime(2000),
          lastDate: DateTime.now(),
        );
        setState(() {
          if (picked != null) {
            currentDate = picked;
            _controller.text = DateFormat.yMMMEd("ja").format(currentDate);
          }
        });
      },
      onSaved: (value) => onSaved(currentDate),
    );
  }
}
