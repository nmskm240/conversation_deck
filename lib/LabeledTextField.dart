import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LabeledTextField extends StatelessWidget {
  final String text;
  final String label;
  final String hint;
  final Function onChanged;
  final TextInputType type;

  const LabeledTextField({
    Key? key,
    required this.text,
    required this.label,
    required this.hint,
    required this.onChanged,
    this.type = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: TextEditingController(text: text),
      keyboardType: type,
      maxLines: null,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        hintStyle: TextStyle(color: Colors.black),
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
      onChanged: (String text) {
        onChanged(text);
      },
    );
  }
}
