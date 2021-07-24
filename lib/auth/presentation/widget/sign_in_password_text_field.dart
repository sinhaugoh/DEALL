import 'package:deall/auth/shared/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInPasswordTextField extends ConsumerWidget {
  const SignInPasswordTextField({
    Key? key,
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
          errorText: ref.watch(signInFormNotifierProvider
                  .select((state) => state.showErrorMessage))
              ? ref.watch(signInFormNotifierProvider
                  .select((state) => state.passwordErrorMessage))
              : null,
        ),
        onChanged: (value) {
          ref
              .read(signInFormNotifierProvider.notifier)
              .passwordChanged(value);
        },
      ),
    );
  }
}