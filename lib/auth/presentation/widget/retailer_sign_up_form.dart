import 'package:deall/auth/shared/providers.dart';
import 'package:deall/core/presentation/widgets/form_text_field.dart';
import 'package:deall/core/presentation/widgets/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RetailerSignUpForm extends ConsumerWidget {
  const RetailerSignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final image = ref.watch(
        retailerSignUpFormNotifierProvider.select((state) => state.imageFile));

    return Form(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (image != null) Image.file(image),
            ElevatedButton(
              onPressed: () {
                ref
                    .read(retailerSignUpFormNotifierProvider.notifier)
                    .pickImage();
              },
              child: const Text('Upload Image'),
            ),
            ElevatedButton(
              onPressed: () {
                ref
                    .read(retailerSignUpFormNotifierProvider.notifier)
                    .deleteImage();
              },
              child: const Text('Delete Image'),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FormTextField(
                label: 'Email',
                errorText: ref.watch(retailerSignUpFormNotifierProvider
                        .select((state) => state.showErrorMessage))
                    ? ref.watch(retailerSignUpFormNotifierProvider
                        .select((state) => state.emailErrorMessage))
                    : null,
                onChanged: ref
                    .read(retailerSignUpFormNotifierProvider.notifier)
                    .emailChanged,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FormTextField(
                label: 'Password',
                obscureText: ref.watch(retailerSignUpFormNotifierProvider
                    .select((state) => state.hidePassword)),
                errorText: ref.watch(retailerSignUpFormNotifierProvider
                        .select((state) => state.showErrorMessage))
                    ? ref.watch(retailerSignUpFormNotifierProvider
                        .select((state) => state.passwordErrorMessage))
                    : null,
                onChanged: ref
                    .read(retailerSignUpFormNotifierProvider.notifier)
                    .passwordChanged,
                inputFormatters: [
                  FilteringTextInputFormatter.deny(RegExp(r"\s")),
                ],
                suffixIcon: IconButton(
                  onPressed: () {
                    ref
                        .read(retailerSignUpFormNotifierProvider.notifier)
                        .toggleShowPassword();
                  },
                  icon: ref.watch(retailerSignUpFormNotifierProvider
                          .select((state) => state.hidePassword))
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FormTextField(
                label: 'Shop Name',
                maxLength: 50,
                counter: const Offstage(),
                errorText: ref.watch(retailerSignUpFormNotifierProvider
                        .select((state) => state.showErrorMessage))
                    ? ref.watch(retailerSignUpFormNotifierProvider
                        .select((state) => state.nameErrorMessage))
                    : null,
                onChanged: ref
                    .read(retailerSignUpFormNotifierProvider.notifier)
                    .nameChanged,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FormTextField(
                label: 'UEN',
                errorText: ref.watch(retailerSignUpFormNotifierProvider
                        .select((state) => state.showErrorMessage))
                    ? ref.watch(retailerSignUpFormNotifierProvider
                        .select((state) => state.uenErrorMessage))
                    : null,
                onChanged: ref
                    .read(retailerSignUpFormNotifierProvider.notifier)
                    .uenChanged,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FormTextField(
                minLines: 3,
                maxLines: null,
                label: 'Operating Hours',
                onChanged: ref
                    .read(retailerSignUpFormNotifierProvider.notifier)
                    .operatingHoursChanged,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FormTextField(
                label: 'Block',
                onChanged: ref
                    .read(retailerSignUpFormNotifierProvider.notifier)
                    .blockChanged,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FormTextField(
                label: 'Street',
                onChanged: ref
                    .read(retailerSignUpFormNotifierProvider.notifier)
                    .streetChanged,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FormTextField(
                label: 'Unit No.',
                onChanged: ref
                    .read(retailerSignUpFormNotifierProvider.notifier)
                    .unitChanged,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FormTextField(
                maxLength: 6,
                keyboardType: const TextInputType.numberWithOptions(),
                label: 'Postal Code',
                errorText: ref.watch(retailerSignUpFormNotifierProvider
                        .select((state) => state.showErrorMessage))
                    ? ref.watch(retailerSignUpFormNotifierProvider
                        .select((state) => state.postalCodeErrorMessage))
                    : null,
                onChanged: ref
                    .read(retailerSignUpFormNotifierProvider.notifier)
                    .postalCodeChanged,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                ],
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
                      .read(retailerSignUpFormNotifierProvider.notifier)
                      .signUp();
                },
                child: const Text('Create Account'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
