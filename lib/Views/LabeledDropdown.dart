import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LabeledDropdown<T> extends StatelessWidget {
  final String label;
  final T value;
  final Function onChanged;
  final List<DropdownMenuItem<T>>? items;

  const LabeledDropdown({
    Key? key,
    required this.label,
    required this.value,
    required this.onChanged,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        labelText: label,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.black),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
      value: value,
      items: items,
      onChanged: (T? newValue) {
        onChanged(newValue);
      },
    );
  }
}
