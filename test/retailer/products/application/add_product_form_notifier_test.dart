import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:deall/auth/infrastructure/auth_repository.dart';
import 'package:deall/auth/shared/providers.dart';
import 'package:deall/core/application/image_picking_failure.dart';
import 'package:deall/core/infrastructure/image_picking_repository.dart';
import 'package:deall/core/shared/providers.dart';
import 'package:deall/retailer/product/infrastructure/product_repository.dart';
import 'package:deall/retailer/product/shared/providers.dart';
import 'package:deall/retailer/shared/providers.dart';

import 'add_product_form_notifier_test.mocks.dart';

@GenerateMocks([
  ProductRepository,
  ImagePickingRepository,
  AuthRepository,
])
void main() {
  ProviderContainer setUpContainer() {
    final testContainer = ProviderContainer(overrides: [
      imagePickingRepositoryProvider.overrideWithProvider(
          Provider((ref) => MockImagePickingRepository())),
      authRepositoryProvider
          .overrideWithProvider(Provider((ref) => MockAuthRepository())),
      productRepoProvider
          .overrideWithProvider(Provider((ref) => MockProductRepository())),
    ]);

    addTearDown(testContainer.dispose);
    return testContainer;
  }

  // group('initialiseRetailer', () {
  //   test('should reset the value of retailer field based on the input', () {
  //     final container = setUpContainer();
  //     const testValue = Retailer(
  //       id: 'id',
  //       name: 'name',
  //       block: 'block',
  //       street: 'street',
  //       unit: 'unit',
  //       postalCode: 'postalCode',
  //       operatingHours: 'operatingHours',
  //       description: 'description',
  //       image: 'image',
  //       visibility: false,
  //       uen: 'uen',
  //     );

  //     final initialState = container.read(retailerEditProfileNotifierProvider);

  //     container
  //         .read(retailerEditProfileNotifierProvider.notifier)
  //         .initialiseRetailer(testValue);

  //     final result = container.read(retailerEditProfileNotifierProvider);

  //     expect(
  //         result.retailer, initialState.copyWith(retailer: testValue).retailer);
  //   });
  // });

  group('prodNameChanged', () {
    test('should change product name field based on the input', () {
      final testContainer = setUpContainer();
      const testValue = 'test product';

      final initialState = testContainer.read(addProductFormNotifierProvider);

      testContainer
          .read(addProductFormNotifierProvider.notifier)
          .prodNameChanged(testValue);

      final result = testContainer.read(addProductFormNotifierProvider);

      expect(result, initialState.copyWith(name: testValue));
    });
  });

  group('prodUsualPriceChanged', () {
    test('should change product usual price field based on the input', () {
      final testContainer = setUpContainer();
      const testValue = '9.5';

      final initialState = testContainer.read(addProductFormNotifierProvider);

      testContainer
          .read(addProductFormNotifierProvider.notifier)
          .prodUsualPriceChanged(testValue);

      final result = testContainer.read(addProductFormNotifierProvider);

      expect(result, initialState.copyWith(usualPriceString: testValue));
    });
  });

  group('prodDiscountedPriceChanged', () {
    test('should change product discounted price field based on the input', () {
      final testContainer = setUpContainer();
      const testValue = '6.5';

      final initialState = testContainer.read(addProductFormNotifierProvider);

      testContainer
          .read(addProductFormNotifierProvider.notifier)
          .prodDiscountedPriceChanged(testValue);

      final result = testContainer.read(addProductFormNotifierProvider);

      expect(result, initialState.copyWith(discountedPriceString: testValue));
    });
  });

  group('prodImageChanged', () {
    test('should change imageFile field based on the input', () {
      final container = setUpContainer();
      final testValue = File('');

      container
          .read(addProductFormNotifierProvider.notifier)
          .prodImageChanged(testValue);

      final result = container.read(addProductFormNotifierProvider);

      expect(result.imageFile, isA<File>());
      expect(result.imageFile, testValue);
    });
  });

  group('prodDescriptionChanged', () {
    test('should change product description field based on the input', () {
      final container = setUpContainer();
      const testValue = 'test description';

      final initialState = container.read(addProductFormNotifierProvider);

      container
          .read(addProductFormNotifierProvider.notifier)
          .prodDescriptionChanged(testValue);

      final result = container.read(addProductFormNotifierProvider);

      expect(result, initialState.copyWith(description: testValue));
    });
  });

  group('prodAvailabilityChanged', () {
    test('should change product availability field based on the input', () {
      final container = setUpContainer();

      final initialState = container.read(addProductFormNotifierProvider);

      container
          .read(addProductFormNotifierProvider.notifier)
          .prodAvailabilityChanged();

      final result = container.read(addProductFormNotifierProvider);

      expect(result.availability, !initialState.availability);
    });
  });

// add product
  
  // group('pickImage', () {
  //   test('should return correct state if the user picked a valid image',
  //       () async {
  //     final container = setUpContainer();
  //     final testFile = File('');

  //     when(container.read(imagePickingRepositoryProvider).pickImage())
  //         .thenAnswer((_) async => right(testFile));

  //     await container
  //         .read(retailerEditProfileNotifierProvider.notifier)
  //         .pickImage();
  //     final result = container.read(retailerEditProfileNotifierProvider);

  //     expect(result.imageFile, isA<File>());
  //     expect(result.hasInitialImageChanged, true);
  //   });

  //   test('should return correct state if the user cancel picking image action',
  //       () async {
  //     final container = setUpContainer();

  //     when(container.read(imagePickingRepositoryProvider).pickImage())
  //         .thenAnswer(
  //             (_) async => left(const ImagePickingFailure.imagePicker('')));

  //     await container
  //         .read(retailerEditProfileNotifierProvider.notifier)
  //         .pickImage();
  //     final result = container.read(retailerEditProfileNotifierProvider);

  //     expect(result.imageFile, null);
  //   });
  // });

  // group('deleteImage', () {
  //   test(
  //       'should reset imageFile field to null if a picture is already selected',
  //       () {
  //     final container = setUpContainer();

  //     container
  //         .read(retailerEditProfileNotifierProvider.notifier)
  //         .imageChanged(File(''));

  //     container
  //         .read(retailerEditProfileNotifierProvider.notifier)
  //         .deleteImage();
  //     final result = container.read(retailerEditProfileNotifierProvider);
  //     expect(result.imageFile, null);
  //   });

  //   test('should reset imageFile field to null if a picture is not selected',
  //       () {
  //     final container = setUpContainer();
  //     container
  //         .read(retailerEditProfileNotifierProvider.notifier)
  //         .deleteImage();
  //     final result = container.read(retailerEditProfileNotifierProvider);
  //     expect(result.imageFile, null);
  //   });
  // });
}
