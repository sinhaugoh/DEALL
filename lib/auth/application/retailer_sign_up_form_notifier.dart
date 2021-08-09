import 'dart:io';

import 'package:deall/auth/infrastructure/auth_repository.dart';
import 'package:deall/core/application/retailer/retailer.dart';
import 'package:deall/core/application/value_validator.dart';
import 'package:deall/core/infrastructure/form_error_message.dart';
import 'package:deall/core/infrastructure/image_picking_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'retailer_sign_up_form_notifier.freezed.dart';

@freezed
class RetailerSignUpFormState with _$RetailerSignUpFormState {
  const RetailerSignUpFormState._();

  const factory RetailerSignUpFormState({
    required bool hasConnection,
    required bool showErrorMessage,
    required bool isSaving,
    required bool successful,
    required String? emailErrorMessage,
    required String? passwordErrorMessage,
    required String? nameErrorMessage,
    required String? postalCodeErrorMessage,
    required String? uenErrorMessage,
    required String email,
    required String password,
    required Retailer retailer,
    required File? imageFile,
  }) = _RetailerSignUpFormState;

  factory RetailerSignUpFormState.initial() => RetailerSignUpFormState(
        hasConnection: true,
        showErrorMessage: false,
        isSaving: false,
        successful: false,
        emailErrorMessage: null,
        passwordErrorMessage: null,
        nameErrorMessage: null,
        postalCodeErrorMessage: null,
        uenErrorMessage: null,
        email: '',
        password: '',
        retailer: Retailer.initial(),
        imageFile: null,
      );
}

class RetailerSignUpFormNotifier
    extends StateNotifier<RetailerSignUpFormState> {
  final AuthRepository _authRepository;
  final ImagePickingRepository _imagePickingRepository;

  RetailerSignUpFormNotifier(this._authRepository, this._imagePickingRepository)
      : super(RetailerSignUpFormState.initial());

  void emailChanged(String email) {
    state = state.copyWith(email: email);
  }

  void passwordChanged(String password) {
    state = state.copyWith(password: password);
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

  void uenChanged(String uen) {
    state = state.copyWith.retailer(uen: uen);
  }

  void imageChanged(File imageFile) {
    state = state.copyWith(imageFile: imageFile);
  }

  void imageStringChanged(String imageString) {
    state = state.copyWith.retailer(image: imageString);
  }

  void _validateInputs() {
    var stateCopy = state.copyWith(showErrorMessage: true);

    //validate email
    final emailValidate = validateEmail(state.email);
    emailValidate.fold(
      (valueFailure) => valueFailure.maybeWhen(
          invalidEmail: () {
            stateCopy = stateCopy.copyWith(
                emailErrorMessage: FormErrorMessage.emailErrorMessage);
          },
          orElse: () {}),
      (r) {
        stateCopy = stateCopy.copyWith(emailErrorMessage: null);
      },
    );

    //validate password
    final passwordValidate = validatePassword(state.password);
    passwordValidate.fold(
      (valueFailure) => valueFailure.maybeWhen(
          invalidPassword: () {
            stateCopy = stateCopy.copyWith(
                passwordErrorMessage: FormErrorMessage.passwordErrorMessage);
          },
          orElse: () {}),
      (r) {
        stateCopy = stateCopy.copyWith(passwordErrorMessage: null);
      },
    );

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

    //validate UEN
    final uenValidate = validateNotEmpty(state.retailer.uen);
    uenValidate.fold(
      (valueFailure) => valueFailure.maybeWhen(
        empty: () {
          stateCopy = stateCopy.copyWith(
            uenErrorMessage: 'UEN cannot be empty',
          );
        },
        orElse: () {},
      ),
      (r) => stateCopy = stateCopy.copyWith(uenErrorMessage: null),
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

  Future<void> pickImage() async {
    final failureOrSuccess = await _imagePickingRepository.pickImage();
    failureOrSuccess.fold(
      (f) => null,
      (file) => state = state.copyWith(imageFile: file),
    );
  }

  void deleteImage() {
    state = state.copyWith(imageFile: null);
  }

  Future<void> signUp() async {
    //TODO: assign image string into Retailer instance in case needed in the future
    _validateInputs();

    //if the input are valid
    if (state.emailErrorMessage == null &&
        state.passwordErrorMessage == null &&
        state.nameErrorMessage == null &&
        state.postalCodeErrorMessage == null &&
        state.uenErrorMessage == null) {
      state = state.copyWith(
        isSaving: true,
        hasConnection: true,
      );

      final failureOrSuccess = await _authRepository.retailerSignUp(
        email: state.email,
        password: state.password,
        retailer: state.retailer,
        imageFile: state.imageFile,
      );

      failureOrSuccess.fold((authFailure) {
        authFailure.maybeWhen(
          server: (failureMessage) {
            state = state.copyWith(
              emailErrorMessage: failureMessage,
              isSaving: false,
            );
          },
          noConnection: () {
            state = state.copyWith(
              hasConnection: false,
              isSaving: false,
            );
          },
          orElse: () {
            //could throw unknown auth error or storage error
          },
        );
      }, (_) {
        state = state.copyWith(
          isSaving: false,
          successful: true,
        );
      });
    }
  }
}
