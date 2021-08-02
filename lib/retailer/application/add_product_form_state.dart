import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_product_form_state.freezed.dart';

@freezed
class AddProductFormState with _$AddProductFormState {
  const AddProductFormState._();
  const factory AddProductFormState({
    required bool hasConnection,
    required bool showErrorMessage,
    required bool isSaving,
    required String name,
    required double usualPrice,
    required double discountPrice,
    required String image,
    required String description,
    required bool availability,
  }) = _AddProductFormState;

  factory AddProductFormState.initial() => const AddProductFormState(
        hasConnection: true,
        showErrorMessage: false,
        isSaving: false,
        name: '',
        usualPrice: 0.0,
        discountPrice: 0.0,
        image: '',
        description: '',
        availability: true,
      );
}
