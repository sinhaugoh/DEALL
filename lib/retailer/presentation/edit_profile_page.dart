import 'package:auto_route/auto_route.dart';
import 'package:deall/core/application/retailer/retailer.dart';
import 'package:deall/core/presentation/saving_in_progress_overlay.dart';
import 'package:deall/core/presentation/widgets/images.dart';
import 'package:deall/retailer/application/retailer_edit_profile_form_notifier.dart';
import 'package:deall/retailer/presentation/widget/edit_profile_form.dart';
import 'package:deall/retailer/shared/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfilePage extends ConsumerWidget {
  final Retailer retailer;
  const EditProfilePage({
    Key? key,
    required this.retailer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<RetailerEditProfileFormNotifierState>(
        retailerEditProfileNotifierProvider, (state) {
      //check if the saving process is successful
      if (state.successful) {
        ref.read(retailerNotifierProvider.notifier).setRetailer(
              ref.read(retailerEditProfileNotifierProvider).retailer,
            );
        AutoRouter.of(context).pop();
      }
      
      //check if the device has connection
      if (!state.hasConnection) {
        //TODO: use theme snackbar instead
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('No connection'),
          duration: Duration(seconds: 5),
          behavior: SnackBarBehavior.floating,
        ));
      }

      //check if firebase error occur
      if (state.hasFirebaseFailure) {
        //TODO: use theme snackbar instead
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Unexpected Error. Please try again.'),
          duration: Duration(seconds: 5),
          behavior: SnackBarBehavior.floating,
        ));
      }
    });

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 140.h,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(350.w, 50.h),
          ),
        ),
        title: const Text('Edit Profile'),
        // actions: [
        //   // iconbtn!,
        // ],
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.white
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            EditProfileForm(
              retailer: retailer,
            ),
            SavingInProgressOverlay(
              isSaving: ref.watch(
                retailerEditProfileNotifierProvider
                    .select((state) => state.isSaving),
              ),
              overlayText: 'Saving',
            ),
          ],
        ),
      ),
    );
  }
}
