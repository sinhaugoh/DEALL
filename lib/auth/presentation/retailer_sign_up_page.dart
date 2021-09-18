import 'package:auto_route/auto_route.dart';
import 'package:deall/auth/application/retailer_sign_up_form_notifier.dart';
import 'package:deall/auth/presentation/widget/retailer_sign_up_form.dart';
import 'package:deall/auth/shared/providers.dart';
import 'package:deall/consumer/presentation/widgets/custom_appbar.dart';
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
      appBar: CustomAppBar(
        IconButton(
          icon: Icon(
            Icons.add,
            color: Colors.black.withOpacity(0),
          ),
        onPressed: () {  },),
        
      ),
      body: SafeArea(
        child: Stack(
          children: [

            Column(
              children: [
                // Flexible(
                //   child: Container()
                // ),
                // Expanded(
                //   // flex: 2,
                //   child: Column(
                //     children: [
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           IconButton(
                //             onPressed: (){
                //               Navigator.pop(context);
                //             }, 
                //             icon: Icon(Icons.arrow_back_ios),
                //             color: Colors.black,
                //           ),
                //           Padding(
                //         padding: EdgeInsets.symmetric(vertical: 10.0.h),
                //         child: Container(
                //           alignment: Alignment.bottomCenter,
                //           constraints: BoxConstraints(maxWidth: 150.w, maxHeight: 60.h),
                //           child: Image.asset(Images.logoText),
                //         ),
                //       ),
                //         ],
                //       ),
                      
                //     ],
                //   ),
                // ),
                Expanded(
                  flex: 7,
                  child: SafeArea(
                    child: Stack(
                      children: const [
                        RetailerSignUpForm(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // const RetailerSignUpForm(),
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
