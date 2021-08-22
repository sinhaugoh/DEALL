import 'dart:io';

import 'package:deall/auth/infrastructure/auth_repository.dart';
import 'package:deall/core/application/product/product.dart';
import 'package:deall/core/application/value_validator.dart';
import 'package:deall/core/infrastructure/image_picking_repository.dart';
import 'package:deall/retailer/product/infrastructure/product_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_product_form_notifier.freezed.dart';

@freezed
class EditProductFormNotifierState with _$EditProductFormNotifierState {
  const EditProductFormNotifierState._();
  const factory EditProductFormNotifierState({
    required bool hasInitialImageChanged,
    required bool hasConnection,
    required bool showErrorMessage,
    required bool isSaving,
    required bool hasUpdated,
    required bool hasDeleted,
    required bool hasFirebaseFailure,
    required String? nameErrorMessage,
    required String? usualPriceErrorMessage,
    required String? discountedPriceErrorMessage,
    required Product product,
    required String usualPriceString,
    required String discountedPriceString,
    required File? imageFile,
  }) = _EditProductFormNotifierState;

  factory EditProductFormNotifierState.initial() {
    return EditProductFormNotifierState(
      hasInitialImageChanged: false,
      hasConnection: true,
      showErrorMessage: false,
      isSaving: false,
      hasUpdated: false,
      hasDeleted: false,
      hasFirebaseFailure: false,
      nameErrorMessage: null,
      usualPriceErrorMessage: null,
      discountedPriceErrorMessage: null,
      product: Product.initial(),
      usualPriceString: '',
      discountedPriceString: '',
      imageFile: null,
    );
  }
}

class EditProductFormNotifier
    extends StateNotifier<EditProductFormNotifierState> {
  final ProductRepository _productRepository;
  final ImagePickingRepository _imagePickingRepository;
  final AuthRepository _authRepository;

  EditProductFormNotifier(this._productRepository, this._imagePickingRepository,
      this._authRepository)
      : super(EditProductFormNotifierState.initial());

  void initialiseProduct(Product product) {
    state = state.copyWith(
      product: product,
      usualPriceString: product.usualPrice.toString(),
      discountedPriceString: product.discountedPrice.toString(),
    );
  }

  void prodNameChanged(String name) {
    state = state.copyWith.product(name: name.trim());
  }

  void prodUsualPriceChanged(String usualPriceString) {
    state = state.copyWith(usualPriceString: usualPriceString);
  }

  void prodDiscountPriceChanged(String discountedPriceString) {
    state = state.copyWith(discountedPriceString: discountedPriceString);
  }

  void prodImageChanged(File? imageFile) {
    state = state.copyWith(
      imageFile: imageFile,
      hasInitialImageChanged: true,
    );
  }

  void prodDescriptionChanged(String description) {
    state = state.copyWith.product(description: description.trim());
  }

  void _validateInputs() {
    var stateCopy = state.copyWith(showErrorMessage: true);
    //validate name
    final nameValidate = validateNotEmpty(state.product.name);
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
    //validate usualPrice
    final usualPriceValidate = validateUsualPrice(stateCopy.usualPriceString);
    usualPriceValidate.fold(
      (valueFailure) => valueFailure.maybeWhen(
        empty: () {
          stateCopy = stateCopy.copyWith(
            usualPriceErrorMessage: 'Usual price of product must not be empty',
          );
        },
        invalidPriceValue: () {
          stateCopy = stateCopy.copyWith(
            usualPriceErrorMessage:
                'Usual price of product must be between \$0.02 and \$10,000.00',
          );
        },
        orElse: () {},
      ),
      (price) => stateCopy = stateCopy.copyWith(
        usualPriceErrorMessage: null,
        product: stateCopy.product.copyWith(usualPrice: price),
      ),
    );
    //validate discounted price
    final discountedPriceValidate = validateDiscountedPrice(
        stateCopy.discountedPriceString, stateCopy.product.usualPrice);
    discountedPriceValidate.fold(
      (valueFailure) => valueFailure.maybeWhen(
        empty: () {
          stateCopy = stateCopy.copyWith(
            discountedPriceErrorMessage:
                'Discounted price of product must not be empty',
          );
        },
        invalidPriceValue: () {
          stateCopy = stateCopy.copyWith(
            discountedPriceErrorMessage:
                'Discounted price of product must be lesser than usual price',
          );
        },
        orElse: () {},
      ),
      (price) => stateCopy = stateCopy.copyWith(
        discountedPriceErrorMessage: null,
        product: stateCopy.product.copyWith(discountedPrice: price),
      ),
    );
    state = stateCopy;
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
      product: state.product.copyWith(image: ''),
    );
  }

  Future<void> updateProduct() async {
    state = state.copyWith(
      hasConnection: true,
      hasFirebaseFailure: false,
    );
    _validateInputs();

    //if the input are valid
    if (state.nameErrorMessage == null &&
        state.usualPriceErrorMessage == null &&
        state.discountedPriceErrorMessage == null) {
      state = state.copyWith(
        isSaving: true,
        hasConnection: true,
      );

      if (state.imageFile != null) {
        final failureOrString =
            await _imagePickingRepository.uploadProductImageToCloudStorage(
          userId: _authRepository.getUserId(),
          file: state.imageFile!,
          productId: state.product.id,
        );

        failureOrString.fold(
          (f) => f.maybeWhen(
            noConnection: () => state = state.copyWith(
              hasConnection: false,
              isSaving: false,
            ),
            orElse: () => state = state.copyWith(
              isSaving: false,
              hasFirebaseFailure: true,
            ),
          ),
          (imgString) => state = state.copyWith.product(image: imgString),
        );
      }

      if (!state.hasFirebaseFailure && state.hasConnection) {
        final failureOrSuccess =
            await _productRepository.updateProduct(state.product);
        failureOrSuccess.fold(
          (f) => f.maybeWhen(
            noConnection: () => state = state.copyWith(
              hasConnection: false,
              isSaving: false,
            ),
            orElse: () => state = state.copyWith(
              isSaving: false,
              hasFirebaseFailure: true,
            ),
          ),
          (_) => state = state.copyWith(
            isSaving: false,
            hasUpdated: true,
          ),
        );
      }
    }
  }

  Future<void> deleteProduct() async {
    state = state.copyWith(
      hasConnection: true,
      hasFirebaseFailure: false,
    );
    final successOrFailure =
        await _productRepository.deleteProduct(state.product);

    successOrFailure.fold(
      (f) => f.maybeWhen(
        noConnection: () => state = state.copyWith(
          hasConnection: false,
          isSaving: false,
        ),
        orElse: () => state = state.copyWith(
          isSaving: false,
          hasFirebaseFailure: true,
        ),
      ),
      (_) => state = state.copyWith(
        isSaving: false,
        hasDeleted: true,
      ),
    );
  }
}
