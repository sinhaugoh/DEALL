import 'dart:io';
import 'package:deall/auth/infrastructure/auth_repository.dart';
import 'package:deall/retailer/product/application/add_product_form_state.dart';
import 'package:deall/retailer/product/infrastructure/product_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:deall/core/application/product/product.dart';
import 'package:deall/core/application/value_validator.dart';
import 'package:deall/core/infrastructure/image_picking_repository.dart';

class AddProductFormNotifier extends StateNotifier<AddProductFormState> {
  final ProductRepository _productRepository;
  final ImagePickingRepository _imagePickingRepository;
  final AuthRepository _authRepository;

  AddProductFormNotifier(this._productRepository, this._imagePickingRepository,
      this._authRepository)
      : super(AddProductFormState.initial());

  void prodNameChanged(String name) {
    state = state.copyWith(name: name);
  }

  void prodUsualPriceChanged(double usualPrice) {
    state = state.copyWith(usualPrice: usualPrice);
  }

  void prodDiscountPriceChanged(double discountedPrice) {
    state = state.copyWith(discountedPrice: discountedPrice);
  }

  void prodImageChanged(File? imageFile) {
    state = state.copyWith(imageFile: imageFile);
  }

  void prodDescriptionChanged(String description) {
    state = state.copyWith(description: description);
  }

  void prodAvailabilityChanged() {
    state = state.copyWith(availability: !state.availability);
  }

  void _validateInputs() {
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
    //validate usualPrice
    final usualPriceValidate = validateUsualPrice(state.usualPrice);
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
                'Usual price of product must be between \$0.00 and \$10,000.00',
          );
        },
        orElse: () {},
      ),
      (r) => stateCopy = stateCopy.copyWith(usualPriceErrorMessage: null),
    );
    //validate discounted price
    final discountedPriceValidate =
        validateDiscountedPrice(state.discountedPrice, state.usualPrice);
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
      (r) => stateCopy = stateCopy.copyWith(discountedPriceErrorMessage: null),
    );
    state = stateCopy;
  }

  Future<void> addProduct() async {
    _validateInputs();

    //if the input are valid
    if (state.nameErrorMessage == null &&
        state.usualPriceErrorMessage == null &&
        state.discountedPriceErrorMessage == null) {
      state = state.copyWith(
        isSaving: true,
        hasConnection: true,
      );

      final uid = _authRepository.getUserId();
      final productId = _productRepository.generateNewProductId(uid);

      // if state.imageFile == null
      var newProduct = Product(
        id: productId,
        name: state.name,
        usualPrice: state.usualPrice,
        discountedPrice: state.discountedPrice,
        image: '',
        description: state.description,
        availability: state.availability,
      );

      if (state.imageFile != null) {
        final result =
            await _imagePickingRepository.uploadProductImageToCloudStorage(
                userId: uid, file: state.imageFile!, productId: productId);

        result.fold((imagePickingFailure) {
          imagePickingFailure.maybeWhen(
            noConnection: () {
              state = state.copyWith(
                hasConnection: false,
                isSaving: false,
              );
            },
            orElse: () {
              state = state.copyWith(
                isSaving: false,
                hasFailureUploadingImage: true,
              );
            },
          );
        }, (filePath) async {
          newProduct = newProduct.copyWith(image: filePath);
        });
      }

      if (!state.hasFailureUploadingImage && state.hasConnection) {
        final failureOrSuccess =
            await _productRepository.addProduct(newProduct, uid);

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
                hasFirebaseFailure: true,
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
