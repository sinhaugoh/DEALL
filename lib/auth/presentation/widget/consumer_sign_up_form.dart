// import 'dart:ffi';

import 'package:auto_route/auto_route.dart';
import 'package:deall/auth/shared/providers.dart';
import 'package:deall/core/presentation/routes/app_router.gr.dart';
import 'package:deall/core/presentation/widgets/form_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.grey,
                fontSize: 17.sp
              ),
              //insert style
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 30.0.w, vertical: 10.0.h),
              child: Container(
                constraints: BoxConstraints(
                  minHeight: 40.h
                ),
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
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0.w),
              child: Container(
                constraints: BoxConstraints(
                  minHeight: 40.h
                ),
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
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            ),

            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 30.0.w, vertical: 10.0.h),
              child: ConstrainedBox(
                constraints: BoxConstraints.tightFor(height: 40.h),
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
                        borderRadius: BorderRadius.circular(30.w))),
                  ),
                  child: const Text('Sign-up'),
                ),
              ),
            ),
            Divider(
              thickness: 2,
              indent: 30.w,
              endIndent: 30.w,
              height: 50.h,
            ),

            SizedBox(height: 20.h),
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 8.h, bottom: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
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
            ),
              ))
          ],
        ),
      ),
    );
  }
}
