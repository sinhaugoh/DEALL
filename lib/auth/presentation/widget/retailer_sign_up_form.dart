import 'package:deall/auth/presentation/widget/email_text_field.dart';
import 'package:deall/auth/presentation/widget/password_text_field.dart';
import 'package:deall/auth/shared/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:deall/auth/presentation/widget/header.dart';

class RetailerSignUpForm extends ConsumerWidget {
  const RetailerSignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 100), //change to alignment?
            Text(
              'REGISTRATION',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: Header().Font(context, 40),
            ),
            EmailTextField(
              errorText: ref.watch(consumerSignUpFormNotifierProvider
                      .select((state) => state.showErrorMessage))
                  ? ref.watch(consumerSignUpFormNotifierProvider
                      .select((state) => state.emailErrorMessage))
                  : null,
              onChanged:
                  ref.read(consumerSignUpFormNotifierProvider.notifier).emailChanged,
            ),
            PasswordTextField(
              errorText: ref.watch(consumerSignUpFormNotifierProvider
                      .select((state) => state.showErrorMessage))
                  ? ref.watch(consumerSignUpFormNotifierProvider
                      .select((state) => state.passwordErrorMessage))
                  : null,
              onChanged:
                  ref.read(consumerSignUpFormNotifierProvider.notifier).passwordChanged,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () {
                  //dismiss the keyboard
                  final currentFocus = FocusScope.of(context);
                  currentFocus.unfocus();

                  ref.read(consumerSignUpFormNotifierProvider.notifier).signUp();
                },
                child: const Text('Create Account'),
                style: ElevatedButton.styleFrom(primary: Colors.red[300]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
