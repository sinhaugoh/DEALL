import 'package:auto_route/auto_route.dart';
import 'package:deall/core/application/product/product.dart';
import 'package:deall/core/presentation/saving_in_progress_overlay.dart';
import 'package:deall/core/presentation/widgets/images.dart';
import 'package:deall/retailer/product/application/edit_product_form_notifier.dart';
import 'package:deall/retailer/product/presentation/widgets/edit_product_form.dart';
import 'package:deall/retailer/product/shared/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProductPage extends ConsumerStatefulWidget {
  final Product product;
  const EditProductPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditProductPageState();
}

class _EditProductPageState extends ConsumerState<EditProductPage> {
  @override
  void initState() {
    super.initState();
    ref.read(editProductFormStateNotifierProvider.notifier).initialiseProduct(widget.product);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<EditProductFormNotifierState>(editProductFormStateNotifierProvider, (state) {
      if (state.hasUpdated || state.hasDeleted) {
        AutoRouter.of(context).pop();
      }
      if (!state.hasConnection) {
        //TODO: use theme snackbar instead
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('No connection'),
          duration: Duration(seconds: 5),
          behavior: SnackBarBehavior.floating,
        ));
      }

      if (state.hasFirebaseFailure) {
        //TODO: use theme snackbar instead
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
        title: Text('Edit Product', style: Theme.of(context).textTheme.headline2),
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
            const EditProductForm(),
            SavingInProgressOverlay(
              isSaving: ref.watch(editProductFormStateNotifierProvider
                  .select((state) => state.isSaving)),
              overlayText: 'Saving',
            ),
          ],
        ),
      ),
    );
  }
}
