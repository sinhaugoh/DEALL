import 'package:deall/auth/shared/providers.dart';
import 'package:deall/core/presentation/widgets/form_text_field.dart';
import 'package:deall/core/presentation/widgets/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [

                  SizedBox(
                      height: 200.h,
                      width: 200.w,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0.w),
                        //child: Image.file(image),
                        child: FittedBox(fit: BoxFit.cover,child: image!=null? Image.file(image):  Image.asset(Images.imageNotFound),),
                      )
                  ),

                Column(
                children:[

                  ElevatedButton(
                    onPressed: () {
                    ref
                        .read(retailerSignUpFormNotifierProvider.notifier)
                        .pickImage();
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.w))),
                    ),
                    child: const Text('Upload Image'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                    ref
                        .read(retailerSignUpFormNotifierProvider.notifier)
                        .deleteImage();
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.w))),
                    ),
                    child: const Text('Delete Image'),
                  ),
                ],
              )

          ]),
            ),


            Padding(
              padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 16.h, bottom: 12.h),
              child: SizedBox(
                height: 50.h,
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
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: SizedBox(
                height: 50.h,
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
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 12.h),
              child: SizedBox(
                height: 50.h,
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
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 12.h),
              child: SizedBox(
                height: 90.h,
                child: FormTextField(
                  minLines: 3,
                  maxLines: null,
                  label: 'Shop Description',
                  onChanged: ref
                      .read(retailerSignUpFormNotifierProvider.notifier)
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
                height: 50.h,
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
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 12.h),
              child: SizedBox(
                height: 80.h,
                child: FormTextField(
                  minLines: 3,
                  maxLines: null,
                  label: 'Operating Hours',
                  onChanged: ref
                      .read(retailerSignUpFormNotifierProvider.notifier)
                      .operatingHoursChanged,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 12.h),
              child: SizedBox(
                height: 50.h,
                child: FormTextField(
                  label: 'Block',
                  onChanged: ref
                      .read(retailerSignUpFormNotifierProvider.notifier)
                      .blockChanged,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 12.h),
              child: SizedBox(
                height: 50.h,
                child: FormTextField(
                  label: 'Street',
                  onChanged: ref
                      .read(retailerSignUpFormNotifierProvider.notifier)
                      .streetChanged,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 12.h),
              child: SizedBox(
                height: 50.h,
                child: FormTextField(
                  label: 'Unit No.',
                  onChanged: ref
                      .read(retailerSignUpFormNotifierProvider.notifier)
                      .unitChanged,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 12.h),
              child: SizedBox(
                height: 50.h,
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
                        .read(retailerSignUpFormNotifierProvider.notifier)
                        .signUp();
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.w))),
                  ),
                  child: const Text('Create Account'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
