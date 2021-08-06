import 'dart:ffi';

import 'package:deall/core/presentation/widgets/form_text_field.dart';
import 'package:deall/auth/shared/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConsumerSignUpForm extends ConsumerWidget {
  const ConsumerSignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            
            Text(
              'Sign up now for exclusive deals!',
              textAlign: TextAlign.center,
              //insert style
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: FormTextField(
                label: 'Email',
                errorText: ref.watch(consumerSignUpFormNotifierProvider
                        .select((state) => state.showErrorMessage))
                    ? ref.watch(consumerSignUpFormNotifierProvider
                        .select((state) => state.emailErrorMessage))
                    : null,
                onChanged: ref
                    .read(consumerSignUpFormNotifierProvider.notifier)
                    .emailChanged,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: FormTextField(
                label: 'Password',
                obscureText: true,
                errorText: ref.watch(consumerSignUpFormNotifierProvider
                        .select((state) => state.showErrorMessage))
                    ? ref.watch(consumerSignUpFormNotifierProvider
                        .select((state) => state.passwordErrorMessage))
                    : null,
                onChanged: ref
                    .read(consumerSignUpFormNotifierProvider.notifier)
                    .passwordChanged,
                inputFormatters: [
                  FilteringTextInputFormatter.deny(RegExp(r"\s")),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: FormTextField(
                label: 'Confirm Password',
                obscureText: true,
                // errorText: ref.watch(consumerSignUpFormNotifierProvider
                //         .select((state) => state.showErrorMessage))
                //     ? ref.watch(consumerSignUpFormNotifierProvider
                //         .select((state) => state.passwordErrorMessage))
                //     : null,
                onChanged: ref
                    .read(consumerSignUpFormNotifierProvider.notifier)
                    .passwordChanged,
                // inputFormatters: [
                //   FilteringTextInputFormatter.deny(RegExp(r"\s")),
                // ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: ElevatedButton(
                onPressed: () {
                  //dismiss the keyboard
                  final currentFocus = FocusScope.of(context);
                  currentFocus.unfocus();

                  ref
                      .read(consumerSignUpFormNotifierProvider.notifier)
                      .signUp();
                },
                child: const Text('Sign-up'),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))
                    ),
                  //  backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                ),
              ),
            ),

            Divider(
              thickness: 2,
              indent: 20,
              endIndent: 20,
              height: 50,
            ),

            Center(child: Text("Already have an account? Sign-in.")),

          ],
        ),
      ),
    );
  }
}
