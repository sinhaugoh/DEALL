import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:deall/core/presentation/routes/app_router.gr.dart';
import 'package:deall/core/presentation/saving_in_progress_overlay.dart';
import 'package:deall/retailer/product/application/add_product_form_state.dart';
import 'package:deall/retailer/product/shared/providers.dart';
import 'package:deall/retailer/product/presentation/widgets/add_product_form.dart';

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
        title: const Text('Add Product'),
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
