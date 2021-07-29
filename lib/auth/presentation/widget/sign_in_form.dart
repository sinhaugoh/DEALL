import 'package:deall/auth/presentation/widget/email_text_field.dart';
import 'package:deall/auth/presentation/widget/password_text_field.dart';
import 'package:deall/auth/shared/providers.dart';
import 'package:deall/core/presentation/const/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInForm extends ConsumerWidget {
  const SignInForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mq = MediaQuery.of(context);

    return Form(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            SizedBox(height: mq.size.height*0.05),
            Container(
              height: mq.size.height*0.1,
              width: mq.size.width * 0.6,
              // color: Colors.blue,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  'SIGN-IN',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: Header().deallFont(context, Colors.black),
                ),
              ),
            ),
            SizedBox(height: mq.size.height*0.05),

            EmailTextField(
              errorText: ref.watch(signInFormNotifierProvider
                      .select((state) => state.showErrorMessage))
                  ? ref.watch(signInFormNotifierProvider
                      .select((state) => state.emailErrorMessage))
                  : null,
              onChanged:
                  ref.read(signInFormNotifierProvider.notifier).emailChanged,
            ),
            PasswordTextField(
              errorText: ref.watch(signInFormNotifierProvider
                      .select((state) => state.showErrorMessage))
                  ? ref.watch(signInFormNotifierProvider
                      .select((state) => state.passwordErrorMessage))
                  : null,
              onChanged:
                  ref.read(signInFormNotifierProvider.notifier).passwordChanged,
            ),

            Container(
              alignment: Alignment(0.85,0),
              child: InkWell(
                child: Text(
                  'Forgot Password',
                  style: TextStyle(
                    color: Colors.grey,
                    decoration: TextDecoration.underline
                  ),
                ),
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
