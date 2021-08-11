import 'package:cached_network_image/cached_network_image.dart';
import 'package:deall/core/presentation/widgets/form_text_field.dart';
import 'package:deall/retailer/product/shared/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditProductForm extends ConsumerWidget {
  const EditProductForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final image = ref.watch(editProductFormStateNotifierProvider
        .select((state) => state.imageFile));

    final imageString =
        ref.read(editProductFormStateNotifierProvider).product.image;

    return Form(
      child: SingleChildScrollView(
        child: Column(
          children: [
            if (!ref.watch(editProductFormStateNotifierProvider
                    .select((state) => state.hasInitialImageChanged)) &&
                imageString != '')
              CachedNetworkImage(
                imageUrl: imageString,
                placeholder: (context, _) => const CircularProgressIndicator(),
              ),
            if (image != null) Image.file(image),
            ElevatedButton(
              onPressed: () {
                ref
                    .read(editProductFormStateNotifierProvider.notifier)
                    .pickImage();
              },
              child: const Text('Upload Image'),
            ),
            ElevatedButton(
              onPressed: () {
                ref
                    .read(editProductFormStateNotifierProvider.notifier)
                    .deleteImage();
              },
              child: const Text('Delete Image'),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FormTextField(
                label: 'Name',
                initialValue:
                    ref.read(editProductFormStateNotifierProvider).product.name,
                errorText: ref.watch(editProductFormStateNotifierProvider
                        .select((state) => state.showErrorMessage))
                    ? ref.watch(editProductFormStateNotifierProvider
                        .select((state) => state.nameErrorMessage))
                    : null,
                onChanged: ref
                    .read(editProductFormStateNotifierProvider.notifier)
                    .prodNameChanged,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FormTextField(
                label: 'Usual Price (S\$)',
                initialValue: ref
                    .read(editProductFormStateNotifierProvider)
                    .usualPriceString,
                errorText: ref.watch(editProductFormStateNotifierProvider
                        .select((state) => state.showErrorMessage))
                    ? ref.watch(editProductFormStateNotifierProvider
                        .select((state) => state.usualPriceErrorMessage))
                    : null,
                onChanged: ref
                    .read(editProductFormStateNotifierProvider.notifier)
                    .prodUsualPriceChanged,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(8), // max limit of $9,999.99
                  FilteringTextInputFormatter.allow(
                      RegExp(r'^(\d+)?\.?\d{0,2}')),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FormTextField(
                label: 'Discount Price (S\$)',
                initialValue: ref
                    .read(editProductFormStateNotifierProvider)
                    .discountedPriceString,
                errorText: ref.watch(editProductFormStateNotifierProvider
                        .select((state) => state.showErrorMessage))
                    ? ref.watch(editProductFormStateNotifierProvider
                        .select((state) => state.discountedPriceErrorMessage))
                    : null,
                onChanged: ref
                    .read(editProductFormStateNotifierProvider.notifier)
                    .prodDiscountPriceChanged,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(8), // max limit of $9,999.99
                  FilteringTextInputFormatter.allow(
                      RegExp(r'^(\d+)?\.?\d{0,2}')),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FormTextField(
                label: 'Description',
                initialValue: ref
                    .read(editProductFormStateNotifierProvider)
                    .product
                    .description,
                onChanged: ref
                    .read(editProductFormStateNotifierProvider.notifier)
                    .prodDescriptionChanged,
              ),
            ),
            //availability default true
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: ElevatedButton(
                    onPressed: () {
                      //dismiss the keyboard
                      final currentFocus = FocusScope.of(context);
                      currentFocus.unfocus();

                      ref
                          .read(editProductFormStateNotifierProvider.notifier)
                          .updateProduct();
                    },
                    child: const Text('Update'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: ElevatedButton(
                    onPressed: () {
                      //dismiss the keyboard
                      final currentFocus = FocusScope.of(context);
                      currentFocus.unfocus();

                      ref
                          .read(editProductFormStateNotifierProvider.notifier)
                          .deleteProduct();
                    },
                    child: const Text('Delete'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}