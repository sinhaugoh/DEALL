import 'package:deall/auth/shared/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInEmailTextField extends ConsumerWidget {
  const SignInEmailTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'Email',
          border: const OutlineInputBorder(),
          errorText: ref.watch(signInFormNotifierProvider
                  .select((state) => state.showErrorMessage))
              ? ref.watch(signInFormNotifierProvider
                  .select((state) => state.emailErrorMessage))
              : null,
        ),
        onChanged: (value) {
          ref
              .read(signInFormNotifierProvider.notifier)
              .emailChanged(value);
        },
      ),
    );
  }
}