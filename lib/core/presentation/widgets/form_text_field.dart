import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormTextField extends StatelessWidget {
  final String label;
  final String? errorText;
  final bool obscureText;
  final String? prefixText;
  final TextInputType? keyboardType;
  final int? maxLength;
  final Widget? counter;
  final int? minLines;
  final int? maxLines;
  final String? initialValue;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final void Function(String value) onChanged;
  final Widget? suffixIcon;

  const FormTextField({
    Key? key,
    this.errorText,
    this.keyboardType,
    this.obscureText = false,
    this.prefixText,
    this.inputFormatters,
    this.maxLength,
    this.counter,
    this.minLines,
    this.initialValue,
    this.maxLines = 1,
    this.controller,
    this.suffixIcon,
    required this.onChanged,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
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
        counter: counter,
        prefixText: prefixText,
        suffixIcon: suffixIcon,
      ),
      onChanged: onChanged,
      inputFormatters: inputFormatters,
    );
  }
}
