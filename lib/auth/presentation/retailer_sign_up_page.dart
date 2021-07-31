import 'package:deall/auth/presentation/widget/retailer_sign_up_form.dart';
import 'package:deall/auth/shared/providers.dart';
import 'package:deall/core/presentation/saving_in_progress_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RetailerSignUpPage extends ConsumerWidget {
  const RetailerSignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            const RetailerSignUpForm(),
            SavingInProgressOverlay(
              isSaving: ref.watch(retailerSignUpFormNotifierProvider
                  .select((state) => state.isSaving)),
            ),
          ],
        ),
      ),
    );
  }
}
