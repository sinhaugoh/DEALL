
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
            const SignInEmailTextField(),
            const SignInPasswordTextField(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () {
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

