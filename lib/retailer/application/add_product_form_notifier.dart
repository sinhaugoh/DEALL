import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';

import 'package:deall/consumer/shared/providers.dart';
import 'package:deall/retailer/infrastructure/retailer_repository.dart';
import 'package:deall/core/application/product/product.dart';
import 'package:deall/core/application/value_validator.dart';
import 'package:deall/core/infrastructure/image_picking_repository.dart';
import 'package:deall/retailer/application/add_product_form_state.dart';
import 'package:deall/retailer/infrastructure/product_repository.dart';


class AddProductFormNotifier extends StateNotifier<AddProductFormState> {
  final FirebaseAuth _firebaseAuth;
  final ProductListRepository _productRepository;
  final ImagePickingRepository _imagePickingRepository;

  AddProductFormNotifier(this._firebaseAuth, this._productRepository, this._imagePickingRepository) : super(AddProductFormState.initial());

  void prodNameChanged(String name){
    state = state.copyWith(name: name);
  }

  void prodUsualPriceChanged(double usualPrice){
    state = state.copyWith(usualPrice: usualPrice);
  }

  void prodDiscountPriceChanged(double discountPrice){
    state = state.copyWith(discountPrice: discountPrice);
  }

  void prodImageChanged(File? imageFile){
    state = state.copyWith(imageFile: imageFile);
  }

  void prodDescriptionChanged(String description){
    state = state.copyWith(description: description);
  }

  void prodAvailabilityChanged(){
    state = state.copyWith(availability: !state.availability);
  }

  void _validateInputs(){
    var stateCopy = state.copyWith(showErrorMessage: true);
    //validate name
    final nameValidate = validateNotEmpty(state.name);
    nameValidate.fold(
      (valueFailure) => valueFailure.maybeWhen(
        empty: () {
          stateCopy = stateCopy.copyWith(
            nameErrorMessage: 'Product name cannot be empty',
          );
        },
        orElse: () {},
      ),
      (r) => stateCopy = stateCopy.copyWith(nameErrorMessage: null),
    );
    //validate name
    final usualPriceValidate = validateNotEmpty(state.name);
    usualPriceValidate.fold(
      (valueFailure) => valueFailure.maybeWhen(
        empty: () {
          stateCopy = stateCopy.copyWith(
            usualPriceErrorMessage: 'Usual price of product cannot be empty',
          );
        },
        orElse: () {},
      ),
      (r) => stateCopy = stateCopy.copyWith(usualPriceErrorMessage: null),
    );
  }

  Future<void> addProduct(String uid) async {
    _validateInputs();

    //if the input are valid
    if (state.nameErrorMessage == null &&
        state.usualPriceErrorMessage == null) {
      state = state.copyWith(
        isSaving: true,
        hasConnection: true,
      );

      final newProduct = Product(
        id: '',
        name: state.name,
        usualPrice: state.usualPrice,
        discountPrice: state.discountPrice,
        image: state.imageFile.toString(),
        description: state.description,
        availability: state.availability,
      );
      final failureOrSuccess = await _productRepository.addProduct(newProduct, uid);

      failureOrSuccess.fold((firestoreFailure) {
        firestoreFailure.maybeWhen(
          noConnection: () {
            state = state.copyWith(
              hasConnection: false,
              isSaving: false,
            );
          },
          orElse: () {
            state = state.copyWith(
              isSaving: false,
            );
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
}