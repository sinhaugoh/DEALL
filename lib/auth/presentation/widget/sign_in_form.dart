import 'package:deall/core/presentation/widgets/form_text_field.dart';
import 'package:deall/auth/shared/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInForm extends ConsumerWidget {
  const SignInForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: FormTextField(
                label: 'Email',
                errorText: ref.watch(signInFormNotifierProvider
                        .select((state) => state.showErrorMessage))
                    ? ref.watch(signInFormNotifierProvider
                        .select((state) => state.emailErrorMessage))
                    : null,
                onChanged:
                    ref.read(signInFormNotifierProvider.notifier).emailChanged,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FormTextField(
                label: 'Password',
                obscureText: true,
                errorText: ref.watch(signInFormNotifierProvider
                        .select((state) => state.showErrorMessage))
                    ? ref.watch(signInFormNotifierProvider
                        .select((state) => state.passwordErrorMessage))
                    : null,
                onChanged: ref
                    .read(signInFormNotifierProvider.notifier)
                    .passwordChanged,
                inputFormatters: [
                  FilteringTextInputFormatter.deny(RegExp(r"\s")),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () {
                  //dismiss the keyboard
                  final currentFocus = FocusScope.of(context);
                  currentFocus.unfocus();

                  ref.read(signInFormNotifierProvider.notifier).signIn();
                },
                child: const Text('Sign In'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
