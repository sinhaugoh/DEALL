import 'package:deall/retailer/product/shared/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:deall/core/presentation/widgets/form_text_field.dart';

class AddProductForm extends ConsumerWidget {
  const AddProductForm(
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final image = ref.watch(
        addProductFormNotifierProvider.select((state) => state.imageFile));
    return Form(
      child: SingleChildScrollView(
        child: Column(
          children: [
            if (image != null) Image.file(image),
            ElevatedButton(
              onPressed: () {
                ref.read(addProductFormNotifierProvider.notifier).pickImage();
              },
              child: const Text('Upload Image'),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(addProductFormNotifierProvider.notifier).deleteImage();
              },
              child: const Text('Delete Image'),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FormTextField(
                label: 'Name',
                errorText: ref.watch(addProductFormNotifierProvider
                        .select((state) => state.showErrorMessage))
                    ? ref.watch(addProductFormNotifierProvider
                        .select((state) => state.nameErrorMessage))
                    : null,
                onChanged: ref
                    .read(addProductFormNotifierProvider.notifier)
                    .prodNameChanged,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FormTextField(
                label: 'Usual Price (S\$)',
                initialValue:
                    ref.read(addProductFormNotifierProvider).usualPriceString,
                errorText: ref.watch(addProductFormNotifierProvider
                        .select((state) => state.showErrorMessage))
                    ? ref.watch(addProductFormNotifierProvider
                        .select((state) => state.usualPriceErrorMessage))
                    : null,
                onChanged: ref
                    .read(addProductFormNotifierProvider.notifier)
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
                    .read(addProductFormNotifierProvider)
                    .discountedPriceString,
                errorText: ref.watch(addProductFormNotifierProvider
                        .select((state) => state.showErrorMessage))
                    ? ref.watch(addProductFormNotifierProvider
                        .select((state) => state.discountedPriceErrorMessage))
                    : null,
                onChanged: ref
                    .read(addProductFormNotifierProvider.notifier)
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
                onChanged: ref
                    .read(addProductFormNotifierProvider.notifier)
                    .prodDescriptionChanged,
              ),
            ),
            //availability default true
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () {
                  //dismiss the keyboard
                  final currentFocus = FocusScope.of(context);
                  currentFocus.unfocus();

                  ref
                      .read(addProductFormNotifierProvider.notifier)
                      .addProduct();
                },
                child: const Text('Add Product'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
