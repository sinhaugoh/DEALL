import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInPasswordTextField extends ConsumerWidget {
  final String? errorText;
  final void Function(String value) onChanged;
  const SignInPasswordTextField({
    Key? key,
    required this.errorText,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Password',
          border: const OutlineInputBorder(),
          errorText: errorText,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
