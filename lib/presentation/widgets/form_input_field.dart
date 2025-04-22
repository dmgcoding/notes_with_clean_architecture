import 'package:flutter/material.dart';

class FormInputField extends StatelessWidget {
  const FormInputField({
    super.key,
    required this.onChanged,
    required this.labelText,
    required this.errorText,
  });

  final Function(String) onChanged;
  final String labelText;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        errorText: errorText,
      ),
      onChanged: (value) {
        onChanged(value);
      },
    );
  }
}
