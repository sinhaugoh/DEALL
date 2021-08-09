import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormTextField extends StatelessWidget {
  final String label;
  final String? errorText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final int? maxLength;
  final int? minLines;
  final int? maxLines;
  final String? initialValue;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String value) onChanged;

  const FormTextField({
    Key? key,
    this.errorText,
    this.keyboardType,
    this.obscureText = false,
    this.inputFormatters,
    this.maxLength,
    this.minLines,
    this.initialValue,
    this.maxLines = 1,
    required this.onChanged,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      maxLines: maxLines,
      minLines: minLines,
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
