// import 'dart:ffi';

import 'package:auto_route/auto_route.dart';
import 'package:deall/core/presentation/routes/app_router.gr.dart';
import 'package:deall/core/presentation/widgets/form_text_field.dart';
import 'package:deall/auth/shared/providers.dart';
import 'package:deall/core/presentation/widgets/images.dart';
// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConsumerSignUpForm extends ConsumerWidget {
  const ConsumerSignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child: Container(
              alignment: Alignment.bottomCenter,
              constraints: const BoxConstraints(maxWidth: 200),
              // color: Colors.blue,
              child: FittedBox(
                child: Image.asset(Images.logoText),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Form(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Sign up now for exclusive deals!',
                    textAlign: TextAlign.center,
                    //insert style
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 10.0),
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
                      obscureText: ref.watch(consumerSignUpFormNotifierProvider
                          .select((state) => state.hidePassword)),
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
                      suffixIcon: IconButton(
                        onPressed: () {
                          ref
                              .read(consumerSignUpFormNotifierProvider.notifier)
                              .toggleShowPassword();
                        },
                        icon: ref.watch(consumerSignUpFormNotifierProvider
                                .select((state) => state.hidePassword))
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 10.0),
                    child: ElevatedButton(
                      onPressed: () {
                        //dismiss the keyboard
                        final currentFocus = FocusScope.of(context);
                        currentFocus.unfocus();

                        ref
                            .read(consumerSignUpFormNotifierProvider.notifier)
                            .signUp();
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                        //  backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                      child: const Text('Sign-up'),
                    ),
                  ),
                  const Divider(
                    thickness: 2,
                    indent: 20,
                    endIndent: 20,
                    height: 50,
                  ),
                  Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account? '),
                      InkWell(
                        onTap: () {
                          AutoRouter.of(context).push(const SignInRoute());
                        },
                        child: const Text('Sign in.',
                            style: TextStyle(
                                color: Colors.redAccent,
                                decoration: TextDecoration.underline)),
                      )
                    ],
                  ))
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
