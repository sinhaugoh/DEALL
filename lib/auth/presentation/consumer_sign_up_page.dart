import 'package:auto_route/auto_route.dart';
import 'package:deall/auth/application/consumer_sign_up_form_notifier.dart';
import 'package:deall/auth/presentation/widget/consumer_sign_up_form.dart';
import 'package:deall/auth/shared/providers.dart';
import 'package:deall/core/presentation/routes/app_router.gr.dart';
import 'package:deall/core/presentation/saving_in_progress_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            const ConsumerSignUpForm(),
            SavingInProgressOverlay(
              isSaving: ref.watch(consumerSignUpFormNotifierProvider
                  .select((state) => state.isSaving)),
            ),
          ],
        ),
      ),
    );
  }
}
