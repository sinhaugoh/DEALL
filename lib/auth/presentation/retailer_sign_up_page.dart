import 'package:auto_route/auto_route.dart';
import 'package:deall/auth/application/retailer_sign_up_form_notifier.dart';
import 'package:deall/auth/presentation/widget/retailer_sign_up_form.dart';
import 'package:deall/auth/shared/providers.dart';
import 'package:deall/core/presentation/routes/app_router.gr.dart';
import 'package:deall/core/presentation/saving_in_progress_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RetailerSignUpPage extends ConsumerWidget {
  const RetailerSignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
        ref.listen<RetailerSignUpFormState>(retailerSignUpFormNotifierProvider,
        (state) {
      if (state.successful) {
        AutoRouter.of(context).pushAndPopUntil(
          const RetailerHomeRoute(),
          predicate: (_) => false,
        );
      }
    });
        
    ref.listen<bool>(
      retailerSignUpFormNotifierProvider.select((state) => state.hasConnection),
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
      appBar: AppBar(
        title: const Text('Sign Up'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            const RetailerSignUpForm(),
            SavingInProgressOverlay(
              isSaving: ref.watch(retailerSignUpFormNotifierProvider
                  .select((state) => state.isSaving)),
              overlayText: 'Signing Up',
            ),
          ],
        ),
      ),
    );
  }
}
