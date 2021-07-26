import 'package:deall/auth/presentation/widget/sign_in_email_text_field.dart';
import 'package:deall/auth/presentation/widget/sign_in_password_text_field.dart';
import 'package:deall/auth/shared/providers.dart';
import 'package:flutter/material.dart';
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
            SignInEmailTextField(
              errorText: ref.watch(signInFormNotifierProvider
                      .select((state) => state.showErrorMessage))
                  ? ref.watch(signInFormNotifierProvider
                      .select((state) => state.emailErrorMessage))
                  : null,
              onChanged:
                  ref.read(signInFormNotifierProvider.notifier).emailChanged,
            ),
            SignInPasswordTextField(
              errorText: ref.watch(signInFormNotifierProvider
                      .select((state) => state.showErrorMessage))
                  ? ref.watch(signInFormNotifierProvider
                      .select((state) => state.passwordErrorMessage))
                  : null,
              onChanged:
                  ref.read(signInFormNotifierProvider.notifier).passwordChanged,
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
