import 'dart:io';

import 'package:deall/auth/infrastructure/auth_repository.dart';
import 'package:deall/core/application/retailer.dart';
import 'package:deall/core/application/value_validator.dart';
import 'package:deall/core/infrastructure/image_picking_repository.dart';
import 'package:deall/retailer/infrastructure/retailer_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'retailer_edit_profile_form_notifier.freezed.dart';

@freezed
class RetailerEditProfileFormNotifierState
    with _$RetailerEditProfileFormNotifierState {
  const RetailerEditProfileFormNotifierState._();
  const factory RetailerEditProfileFormNotifierState({
    required bool hasConnection,
    required bool hasInitialImageChanged,
    required bool showErrorMessage,
    required bool hasFirebaseFailure,
    required bool isSaving,
    required bool successful,
    required String? nameErrorMessage,
    required String? postalCodeErrorMessage,
    required Retailer retailer,
    required File? imageFile,
  }) = _RetailerEditProfileFormNotifierState;

  factory RetailerEditProfileFormNotifierState.initial() {
    return RetailerEditProfileFormNotifierState(
      hasConnection: true,
      hasInitialImageChanged: false,
      showErrorMessage: false,
      hasFirebaseFailure: false,
      isSaving: false,
      successful: false,
      nameErrorMessage: null,
      postalCodeErrorMessage: null,
      retailer: Retailer.initial(),
      imageFile: null,
    );
  }
}

class RetailerEditProfileFormNotifier
    extends StateNotifier<RetailerEditProfileFormNotifierState> {
  final ImagePickingRepository _imagePickingRepository;
  final AuthRepository _authRepository;
  final RetailerRepository _retailerRepository;

  RetailerEditProfileFormNotifier(this._imagePickingRepository,
      this._authRepository, this._retailerRepository)
      : super(RetailerEditProfileFormNotifierState.initial());

  void initialiseRetailer(Retailer retailer) {
    state = state.copyWith(retailer: retailer);
  }

  void nameChanged(String name) {
    state = state.copyWith.retailer(name: name);
  }

  void blockChanged(String block) {
    state = state.copyWith.retailer(block: block);
  }

  void streetChanged(String street) {
    state = state.copyWith.retailer(street: street);
  }

  void unitChanged(String unit) {
    state = state.copyWith.retailer(unit: unit);
  }

  void postalCodeChanged(String postalCode) {
    state = state.copyWith.retailer(postalCode: postalCode);
  }

  void operatingHoursChanged(String operatingHours) {
    state = state.copyWith.retailer(operatingHours: operatingHours);
  }

  void descriptionChanged(String description) {
    state = state.copyWith.retailer(description: description);
  }

  void imageChanged(File imageFile) {
    state = state.copyWith(
      imageFile: imageFile,
      hasInitialImageChanged: true,
    );
  }

  void imageStringChanged(String imageString) {
    state = state.copyWith.retailer(image: imageString);
  }

  Future<void> pickImage() async {
    final failureOrSuccess = await _imagePickingRepository.pickImage();
    failureOrSuccess.fold(
      (f) => null,
      (file) => state = state.copyWith(
        imageFile: file,
        hasInitialImageChanged: true,
      ),
    );
  }

  void deleteImage() {
    state = state.copyWith(
      imageFile: null,
      hasInitialImageChanged: true,
    );
  }

  void _validateInputs() {
    var stateCopy = state.copyWith(showErrorMessage: true);

    //validate name
    final nameValidate = validateNotEmpty(state.retailer.name);
    nameValidate.fold(
      (valueFailure) => valueFailure.maybeWhen(
        empty: () {
          stateCopy = stateCopy.copyWith(
            nameErrorMessage: 'Shop name cannot be empty',
          );
        },
        orElse: () {},
      ),
      (r) => stateCopy = stateCopy.copyWith(nameErrorMessage: null),
    );

    //validate postal code
    final postalCodeValidate = validatePostal(state.retailer.postalCode);
    postalCodeValidate.fold(
      (valueFailure) => valueFailure.maybeWhen(
        incorrectLength: (length) {
          stateCopy = stateCopy.copyWith(
            postalCodeErrorMessage: 'Postal code must be $length digit',
          );
        },
        orElse: () {},
      ),
      (r) => stateCopy = stateCopy.copyWith(postalCodeErrorMessage: null),
    );

    state = stateCopy;
  }

  Future<void> editRetailer() async {
    state = state.copyWith(
      hasConnection: true,
      hasFirebaseFailure: false,
    );
    //TODO: assign image string into Retailer instance in case needed in the future
    _validateInputs();

    //if the input are valid
    if (state.nameErrorMessage == null &&
        state.postalCodeErrorMessage == null) {
      state = state.copyWith(
        isSaving: true,
      );

      if (state.imageFile != null) {
        final failureOrImageString =
            await _imagePickingRepository.uploadShopLogoToCloudStorage(
          userId: _authRepository.getUserId(),
          file: state.imageFile!,
        );

        failureOrImageString.fold(
          (f) => state = state.copyWith(
            hasFirebaseFailure: true,
            isSaving: false,
          ),
          (imageString) => state = state.copyWith.retailer(image: imageString),
        );
      }

      if (!state.hasFirebaseFailure) {
        final failureOrSuccess =
            await _retailerRepository.updateRetailer(state.retailer);
        failureOrSuccess.fold(
          (f) => f.maybeWhen(
            noConnection: () => state = state.copyWith(
              hasConnection: false,
              isSaving: false,
            ),
            orElse: () => state = state.copyWith(
              hasFirebaseFailure: true,
              isSaving: false,
            ),
          ),
          (r) => state = state.copyWith(
            isSaving: false,
            successful: true,
          ),
        );
      }

      //   final failureOrSuccess = await _authRepository.retailerSignUp(
      //     email: state.email,
      //     password: state.password,
      //     retailer: state.retailer,
      //     imageFile: state.imageFile,
      //   );

      //   failureOrSuccess.fold((authFailure) {
      //     authFailure.maybeWhen(
      //       server: (failureMessage) {
      //         state = state.copyWith(
      //           emailErrorMessage: failureMessage,
      //           isSaving: false,
      //         );
      //       },
      //       noConnection: () {
      //         state = state.copyWith(
      //           hasConnection: false,
      //           isSaving: false,
      //         );
      //       },
      //       orElse: () {
      //         //could throw unknown auth error or storage error
      //       },
      //     );
      //   }, (_) {
      //     state = state.copyWith(
      //       isSaving: false,
      //       successful: true,
      //     );
      //   });
      // }
    }
  }
}
