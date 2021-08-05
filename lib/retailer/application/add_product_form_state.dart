import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_product_form_state.freezed.dart';

@freezed
class AddProductFormState with _$AddProductFormState {
  const AddProductFormState._();
  const factory AddProductFormState({
    required bool hasConnection,
    required bool showErrorMessage,
    required bool isSaving,
    required bool successful,
    required String? nameErrorMessage,
    required String? usualPriceErrorMessage,
    required String? discountPriceErrorMessage,
    required String name,
    required double usualPrice,
    required double discountPrice,
    required File? imageFile,
    required String description,
    required bool availability,
  }) = _AddProductFormState;

  factory AddProductFormState.initial() => const AddProductFormState(
        hasConnection: true,
        showErrorMessage: false,
        isSaving: false,
        successful: false,
        nameErrorMessage: null,
        usualPriceErrorMessage: null,
        discountPriceErrorMessage: null,
        name: '',
        usualPrice: 0.0,
        discountPrice: 0.0,
        imageFile: null,
        description: '',
        availability: true,
      );
}
