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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround, 
                children: [
                   if (!ref.watch<bool>(
                    retailerEditProfileNotifierProvider
                        .select((state) => state.hasInitialImageChanged),
                  ) &&
                  widget.retailer.image.isNotEmpty)
                  Expanded(
                    child: SizedBox(
                        height: 200.h,
                        width: 200.w,
                        child: CachedNetworkImage(
                          imageUrl: widget.retailer.image,
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        )
                    ),
                  )
                  else if (!ref.watch<bool>(
                      retailerEditProfileNotifierProvider
                          .select((state) => state.hasInitialImageChanged),
                    ) &&
                    widget.retailer.image.isEmpty)
                  Expanded(
                    child: SizedBox(
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
                  ),
                if (ref.watch<bool>(retailerEditProfileNotifierProvider
                      .select((state) => state.hasInitialImageChanged)) &&
                  image != null)
                Expanded(
                  child: SizedBox(
                    height: 200.h,
                    width: 200.w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0.w),
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Image.file(image),
                      ),
                    ),
                  ),
                )
              else if (ref.watch<bool>(retailerEditProfileNotifierProvider
                      .select((state) => state.hasInitialImageChanged)) &&
                  image == null)
                Expanded(
                  child: SizedBox(
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
                ),

                Expanded(
                  child: Column(
                    children:[
                      ElevatedButton(
                        onPressed: () {
                        ref
                            .read(retailerEditProfileNotifierProvider.notifier)
                            .pickImage();
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.w))),
                        ),
                        child: const Text(
                          'Upload Image',
                          // style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                        ref
                            .read(retailerEditProfileNotifierProvider.notifier)
                            .deleteImage();
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.w))),
                        ),
                        child: const Text('Delete Image'),
                      ),
                    ],
                  ),
                )
              ]
              ),
            ),


            Padding(
              padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 25.h),
              child: SizedBox(
                height: 60.h,
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
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 12.h),
              child: SizedBox(
                height: 90.h,
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
            ),
            Divider(
              thickness: 2,
              indent: 30.w,
              endIndent: 30.w,
              height: 50.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 12.h),
              child: SizedBox(
                height: 80.h,
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
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 12.h),
              child: SizedBox(
                height: 50.h,
                child: FormTextField(
                  initialValue: widget.retailer.block,
                  label: 'Block',
                  onChanged: ref
                      .read(retailerEditProfileNotifierProvider.notifier)
                      .blockChanged,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 12.h),
              child: SizedBox(
                height: 50.h,
                child: FormTextField(
                  initialValue: widget.retailer.street,
                  label: 'Street',
                  onChanged: ref
                      .read(retailerEditProfileNotifierProvider.notifier)
                      .streetChanged,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 12.h),
              child: SizedBox(
                height: 50.h,
                child: FormTextField(
                  initialValue: widget.retailer.unit,
                  label: 'Unit No.',
                  onChanged: ref
                      .read(retailerEditProfileNotifierProvider.notifier)
                      .unitChanged,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 12.h),
              child: SizedBox(
                height: 65.h,
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
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 30.0.w, vertical: 25.0.h),
              child: ConstrainedBox(
                constraints: BoxConstraints.tightFor(height: 40.h),
                child: ElevatedButton(
                  onPressed: () {
                    //dismiss the keyboard
                    final currentFocus = FocusScope.of(context);
                    currentFocus.unfocus();

                    ref
                        .read(retailerEditProfileNotifierProvider.notifier)
                        .editRetailer();
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.w))),
                  ),
                  child: const Text('Save'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
