import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:deall/auth/presentation/widget/header.dart';

class EmailTextField extends ConsumerWidget {
  final String? errorText;
  final void Function(String value) onChanged;
  const EmailTextField({
    Key? key,
    required this.errorText,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //TODO: change to generic name
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextFormField(
          decoration: InputDecoration(
            labelText: 'Email',
            labelStyle: Header().Font(context, 16),
            border: const OutlineInputBorder(),
            errorText: errorText,
            contentPadding: new EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
          ),
        onChanged: onChanged,
      ),
    );
  }
}