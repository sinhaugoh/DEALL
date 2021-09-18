import 'package:auto_route/auto_route.dart';
import 'package:deall/auth/application/app_user.dart';
import 'package:deall/auth/application/sign_in_form_notifier.dart';
import 'package:deall/auth/presentation/widget/sign_in_form.dart';
import 'package:deall/auth/shared/providers.dart';
import 'package:deall/core/presentation/routes/app_router.gr.dart';
import 'package:deall/core/presentation/saving_in_progress_overlay.dart';
import 'package:deall/core/presentation/widgets/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<SignInFormState>(signInFormNotifierProvider, (state) {
      if (state.userType == UserType.consumer) {
        AutoRouter.of(context).pushAndPopUntil(
          const ConsumerHomeRoute(),
          predicate: (route) => false,
        );
      }

      if (state.userType == UserType.retailer) {
        AutoRouter.of(context).pushAndPopUntil(
          const RetailerHomeRoute(),
          predicate: (route) => false,
        );
      }
    });

    ref.listen<bool>(
      signInFormNotifierProvider.select((state) => state.hasConnection),
      (state) {
        if (state == false) {
          //TODO: use theme snackbar instead
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('No connection'),
            duration: Duration(seconds: 5),
            behavior: SnackBarBehavior.floating,
          ));
        }
      },
    );

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Flexible(
                child: Container()
              ),
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  constraints: BoxConstraints(maxWidth: 150.w),
                  child: Image.asset(Images.logoText),
                ),
              ),
              Expanded(
                flex: 6,
                child: SafeArea(
                  child: Stack(
                    children: const [
                      SignInForm(),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SavingInProgressOverlay(
            isSaving: ref.watch(
                signInFormNotifierProvider.select((state) => state.isSaving)),
            overlayText: 'Signing In',
          ),
        ],
      ),
    );
  }
}
