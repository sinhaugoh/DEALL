import 'package:deall/retailer/infrastructure/product_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:deall/retailer/application/add_product_form_state.dart';

class AddProductFormNotifier extends StateNotifier<AddProductFormState> {
  ProductListRepository _productRepository;
  AddProductFormNotifier(this._productRepository) : super(AddProductFormState.initial());

  void prodNameChanged(String name){
    state = state.copyWith(name: name);
  }

  void prodUsualPriceChanged(double usualPrice){
    state = state.copyWith(usualPrice: usualPrice);
  }

  void prodDiscountPriceChanged(double discountPrice){
    state = state.copyWith(discountPrice: discountPrice);
  }

  void prodImageChanged(String image){
    state = state.copyWith(image: image);
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
}