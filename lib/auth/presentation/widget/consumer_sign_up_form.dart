import 'package:deall/core/presentation/widgets/form_text_field.dart';
import 'package:deall/auth/shared/providers.dart';
import 'package:flutter/material.dart';
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
            Padding(
              padding: const EdgeInsets.all(16.0),
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
              padding: const EdgeInsets.all(16.0),
              child: FormTextField(
                label: 'Password',
                errorText: ref.watch(consumerSignUpFormNotifierProvider
                        .select((state) => state.showErrorMessage))
                    ? ref.watch(consumerSignUpFormNotifierProvider
                        .select((state) => state.passwordErrorMessage))
                    : null,
                onChanged: ref
                    .read(consumerSignUpFormNotifierProvider.notifier)
                    .passwordChanged,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () {
                  //dismiss the keyboard
                  final currentFocus = FocusScope.of(context);
                  currentFocus.unfocus();

                  ref
                      .read(consumerSignUpFormNotifierProvider.notifier)
                      .signUp();
                },
                child: const Text('Create Account'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
