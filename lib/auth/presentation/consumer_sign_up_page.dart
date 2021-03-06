import 'package:auto_route/auto_route.dart';
import 'package:deall/auth/application/consumer_sign_up_form_notifier.dart';
import 'package:deall/auth/presentation/widget/consumer_sign_up_form.dart';
import 'package:deall/auth/shared/providers.dart';
import 'package:deall/core/presentation/routes/app_router.gr.dart';
import 'package:deall/core/presentation/saving_in_progress_overlay.dart';
import 'package:deall/core/presentation/widgets/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConsumerSignUpPage extends ConsumerWidget {
  const ConsumerSignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<ConsumerSignUpFormState>(consumerSignUpFormNotifierProvider,
        (state) {
      if (state.successful) {
        AutoRouter.of(context).pushAndPopUntil(
          const ConsumerHomeRoute(),
          predicate: (_) => false,
        );
      }
    });

    ref.listen<bool>(
      consumerSignUpFormNotifierProvider.select((state) => state.hasConnection),
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
      body: SafeArea(
        child: Stack(
          children: [
            // const ConsumerSignUpForm(),
              Column(
              children: [
                Expanded(
                  child: Container()
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0.h),
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      constraints: BoxConstraints(maxWidth: 150.w),
                      child: Image.asset(Images.logoText),
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: SafeArea(
                    child: Stack(
                      children: const [
                        ConsumerSignUpForm(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            
            SavingInProgressOverlay(
              isSaving: ref.watch(
                signInFormNotifierProvider.select((state) => state.isSaving),
              ),
              overlayText: 'Signing Up',
            ),
          ],
        ),
      ),
    );
  }
}
