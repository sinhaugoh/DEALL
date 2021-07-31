import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormTextField extends StatelessWidget {
  final String label;
  final String? errorText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String value) onChanged;

  const FormTextField({
    Key? key,
    this.errorText,
    this.keyboardType,
    this.obscureText = false,
    this.inputFormatters,
    this.maxLength,
    required this.onChanged,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        errorText: errorText,
      ),
      onChanged: onChanged,
      inputFormatters: inputFormatters,
    );
  }
}
