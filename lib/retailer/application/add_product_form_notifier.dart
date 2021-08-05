import 'dart:io';
import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:deall/core/infrastructure/image_picking_repository.dart';
import 'package:deall/core/shared/providers.dart';
import 'package:deall/retailer/application/add_product_form_state.dart';
import 'package:deall/retailer/infrastructure/product_repository.dart';


class AddProductFormNotifier extends StateNotifier<AddProductFormState> {
  ProductListRepository _productRepository;
  final ImagePickingRepository _imagePickingRepository;

  AddProductFormNotifier(this._productRepository, this._imagePickingRepository) : super(AddProductFormState.initial());

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

  void validateInputs(){
    
  }

  void addProduct() async {
    // await _productRepository
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