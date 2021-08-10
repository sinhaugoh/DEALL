import 'package:deall/retailer/product/shared/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:deall/core/presentation/widgets/form_text_field.dart';
import 'package:deall/retailer/shared/providers.dart';

class AddProductForm extends ConsumerWidget {
  const AddProductForm({Key? key}) : super(key: key);

  String get _currency =>
      NumberFormat.compactSimpleCurrency(locale: 'en').currencySymbol;

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
                label: 'Usual Price',
                controller: usualPriceController,
                errorText: ref.watch(addProductFormNotifierProvider
                        .select((state) => state.showErrorMessage))
                    ? ref.watch(addProductFormNotifierProvider
                        .select((state) => state.usualPriceErrorMessage))
                    : null,
                onChanged: (value) {
                  ref
                      .read(addProductFormNotifierProvider.notifier)
                      .prodUsualPriceChanged(usualPriceController.numberValue);
                },
                keyboardType: TextInputType.number,
                prefixText: _currency,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(8), // max limit of $9,999.99
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FormTextField(
                label: 'Discount Price',
                controller: discountedPriceController,
                errorText: ref.watch(addProductFormNotifierProvider
                        .select((state) => state.showErrorMessage))
                    ? ref.watch(addProductFormNotifierProvider
                        .select((state) => state.discountedPriceErrorMessage))
                    : null,
                onChanged: (value) {
                  ref
                      .read(addProductFormNotifierProvider.notifier)
                      .prodDiscountPriceChanged(
                          discountedPriceController.numberValue);
                },
                keyboardType: const TextInputType.numberWithOptions(),
                prefixText: _currency,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(8), // max limit of $9,999.99
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
