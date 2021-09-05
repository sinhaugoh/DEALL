import 'package:cached_network_image/cached_network_image.dart';
import 'package:deall/core/application/retailer/retailer.dart';
import 'package:deall/core/presentation/widgets/form_text_field.dart';
import 'package:deall/core/presentation/widgets/images.dart';
import 'package:deall/retailer/shared/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileForm extends ConsumerStatefulWidget {
  final Retailer retailer;
  const EditProfileForm({
    Key? key,
    required this.retailer,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditProfileFormState();
}

class _EditProfileFormState extends ConsumerState<EditProfileForm> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback(
      (_) => ref
          .read(retailerEditProfileNotifierProvider.notifier)
          .initialiseRetailer(widget.retailer),
    );
  }

  @override
  Widget build(BuildContext context) {
    final image = ref.watch(
        retailerEditProfileNotifierProvider.select((state) => state.imageFile));

    return Form(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              if (!ref.watch<bool>(
                    retailerEditProfileNotifierProvider
                        .select((state) => state.hasInitialImageChanged),
                  ) &&
                  widget.retailer.image.isNotEmpty)
                SizedBox(
                  height: 200.h,
                  width: 200.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0.w),
                    child: CachedNetworkImage(
                      imageUrl: widget.retailer.image,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Transform.scale(
                        scale: 0.2.h,
                        child: const CircularProgressIndicator(),
                      ),
                    ),
                  ),
                )
              else if (!ref.watch<bool>(
                    retailerEditProfileNotifierProvider
                        .select((state) => state.hasInitialImageChanged),
                  ) &&
                  widget.retailer.image.isEmpty)
                SizedBox(
                  height: 200.h,
                  width: 200.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0.w),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset(Images.imageNotFound),
                    ),
                  ),
                ),
              if (ref.watch<bool>(retailerEditProfileNotifierProvider
                      .select((state) => state.hasInitialImageChanged)) &&
                  image != null)
                SizedBox(
                  height: 200.h,
                  width: 200.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0.w),
                    child: FittedBox(
                      child: Image.file(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              else if (ref.watch<bool>(retailerEditProfileNotifierProvider
                      .select((state) => state.hasInitialImageChanged)) &&
                  image == null)
                SizedBox(
                  height: 200.h,
                  width: 200.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0.w),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset(Images.imageNotFound),
                    ),
                  ),
                ),
              SizedBox(
                height: 20.h,
              ),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      ref
                          .read(retailerEditProfileNotifierProvider.notifier)
                          .pickImage();
                    },
                    child: const Text('Upload Image'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      ref
                          .read(retailerEditProfileNotifierProvider.notifier)
                          .deleteImage();
                    },
                    child: const Text('Delete Image'),
                  ),
                ],
              ),
            ]),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FormTextField(
                initialValue: widget.retailer.name,
                label: 'Shop Name',
                maxLength: 50,
                counter: const Offstage(),
                errorText: ref.watch(retailerEditProfileNotifierProvider
                        .select((state) => state.showErrorMessage))
                    ? ref.watch(retailerEditProfileNotifierProvider
                        .select((state) => state.nameErrorMessage))
                    : null,
                onChanged: ref
                    .read(retailerEditProfileNotifierProvider.notifier)
                    .nameChanged,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FormTextField(
                initialValue: widget.retailer.description,
                minLines: 3,
                maxLines: null,
                label: 'Shop Description',
                onChanged: ref
                    .read(retailerEditProfileNotifierProvider.notifier)
                    .descriptionChanged,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FormTextField(
                initialValue: widget.retailer.operatingHours,
                minLines: 3,
                maxLines: null,
                label: 'Operating Hours',
                onChanged: ref
                    .read(retailerEditProfileNotifierProvider.notifier)
                    .operatingHoursChanged,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FormTextField(
                initialValue: widget.retailer.block,
                label: 'Block',
                onChanged: ref
                    .read(retailerEditProfileNotifierProvider.notifier)
                    .blockChanged,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FormTextField(
                initialValue: widget.retailer.street,
                label: 'Street',
                onChanged: ref
                    .read(retailerEditProfileNotifierProvider.notifier)
                    .streetChanged,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FormTextField(
                initialValue: widget.retailer.unit,
                label: 'Unit No.',
                onChanged: ref
                    .read(retailerEditProfileNotifierProvider.notifier)
                    .unitChanged,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FormTextField(
                initialValue: widget.retailer.postalCode,
                maxLength: 6,
                keyboardType: const TextInputType.numberWithOptions(),
                label: 'Postal Code',
                errorText: ref.watch(retailerEditProfileNotifierProvider
                        .select((state) => state.showErrorMessage))
                    ? ref.watch(retailerEditProfileNotifierProvider
                        .select((state) => state.postalCodeErrorMessage))
                    : null,
                onChanged: ref
                    .read(retailerEditProfileNotifierProvider.notifier)
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
                      .read(retailerEditProfileNotifierProvider.notifier)
                      .editRetailer();
                },
                child: const Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
