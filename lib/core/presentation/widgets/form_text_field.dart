import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget {
  final String label;
  final String? errorText;
  final void Function(String value) onChanged;
  const FormTextField({
    Key? key,
    required this.errorText,
    required this.onChanged,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        errorText: errorText,
      ),
      onChanged: onChanged,
    );
  }
}
