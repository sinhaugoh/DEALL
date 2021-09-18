import 'package:auto_route/auto_route.dart';
import 'package:deall/core/presentation/routes/app_router.gr.dart';
import 'package:deall/core/presentation/saving_in_progress_overlay.dart';
import 'package:deall/retailer/product/application/add_product_form_state.dart';
import 'package:deall/retailer/product/presentation/widgets/add_product_form.dart';
import 'package:deall/retailer/product/shared/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddProductPage extends ConsumerStatefulWidget {
  const AddProductPage(
      {Key? key})
      : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddProductPageState();
}

class _AddProductPageState extends ConsumerState<AddProductPage> {
  @override
  Widget build(BuildContext context) {
    ref.listen<AddProductFormState>(addProductFormNotifierProvider, (state) {
      if (state.successful) {
        AutoRouter.of(context).pushAndPopUntil(
          const RetailerHomeRoute(),
          predicate: (_) => false,
        );
      }

      if (!state.hasConnection) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('No connection'),
          duration: Duration(seconds: 5),
          behavior: SnackBarBehavior.floating,
        ));
      }

      if (state.hasFirebaseFailure) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('An unexpected error occurred. Please contact support.'),
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
        title: Text('Add Product', style: Theme.of(context).textTheme.headline2),
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
            const AddProductForm(),
            SavingInProgressOverlay(
              isSaving: ref.watch(addProductFormNotifierProvider
                  .select((state) => state.isSaving)),
              overlayText: 'Adding',
            ),
          ],
        ),
      ),
    );
  }
}
