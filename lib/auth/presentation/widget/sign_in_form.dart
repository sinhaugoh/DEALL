import 'package:auto_route/auto_route.dart';
import 'package:deall/core/presentation/routes/app_router.gr.dart';
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
              padding: const EdgeInsets.symmetric(horizontal: 16),
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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: FormTextField(
                label: 'Password',
                obscureText: ref.watch(signInFormNotifierProvider
                    .select((state) => state.hidePassword)),
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
                suffixIcon: IconButton(
                  onPressed: () {
                    ref
                        .read(signInFormNotifierProvider.notifier)
                        .toggleShowPassword();
                  },
                  icon: ref.watch(signInFormNotifierProvider
                          .select((state) => state.hidePassword))
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline),
                  )),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ConstrainedBox(
                constraints: const BoxConstraints.tightFor(height: 40),
                child: ElevatedButton(
                  onPressed: () {
                    //dismiss the keyboard
                    final currentFocus = FocusScope.of(context);
                    currentFocus.unfocus();

                    ref.read(signInFormNotifierProvider.notifier).signIn();
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                    //  backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  child: const Text('Sign In'),
                ),
              ),
            ),

            const Divider(
              thickness: 2,
              indent: 20,
              endIndent: 20,
              height: 50,
            ),

            const Center(child: Text("Don't have an account? Sign up.")),

            //SIGN UP PART TEST
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: IntrinsicHeight(
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: () {
                                AutoRouter.of(context)
                                    .push(const ConsumerSignUpRoute());
                              },
                              child: const Text('Consumer',
                                  style: TextStyle(
                                      color: Colors.redAccent,
                                      decoration: TextDecoration.underline)),
                            )),
                      ),

                      // SizedBox(width: 10,),
                      const SizedBox(
                        height: 20,
                        child: VerticalDivider(
                          color: Colors.black54,
                          thickness: 1,
                          width: 20,
                        ),
                      ),

                      Expanded(
                        flex: 1,
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: InkWell(
                              onTap: () {
                                AutoRouter.of(context)
                                    .push(const RetailerSignUpRoute());
                              },
                              child: const Text('Retailer',
                                  style: TextStyle(
                                      color: Colors.redAccent,
                                      decoration: TextDecoration.underline)),
                            )),
                      ),
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
