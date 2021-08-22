import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:deall/auth/infrastructure/auth_repository.dart';
import 'package:deall/auth/shared/providers.dart';
import 'package:deall/core/application/image_picking_failure.dart';
import 'package:deall/core/application/retailer/retailer.dart';
import 'package:deall/core/infrastructure/image_picking_repository.dart';
import 'package:deall/core/shared/providers.dart';
import 'package:deall/retailer/infrastructure/retailer_repository.dart';
import 'package:deall/retailer/shared/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'retailer_edit_profile_form_notifier_test.mocks.dart';

@GenerateMocks([
  ImagePickingRepository,
  AuthRepository,
  RetailerRepository,
])
void main() {
  ProviderContainer setUpContainer() {
    final container = ProviderContainer(overrides: [
      imagePickingRepositoryProvider.overrideWithProvider(
          Provider((ref) => MockImagePickingRepository())),
      authRepositoryProvider
          .overrideWithProvider(Provider((ref) => MockAuthRepository())),
      retailerRepositoryProvider
          .overrideWithProvider(Provider((ref) => MockRetailerRepository())),
    ]);

    addTearDown(container.dispose);
    return container;
  }

  group('initialiseRetailer', () {
    test('should reset the value of retailer field based on the input', () {
      final container = setUpContainer();
      const testValue = Retailer(
        id: 'id',
        name: 'name',
        block: 'block',
        street: 'street',
        unit: 'unit',
        postalCode: 'postalCode',
        operatingHours: 'operatingHours',
        description: 'description',
        image: 'image',
        visibility: false,
        uen: 'uen',
      );

      final initialState = container.read(retailerEditProfileNotifierProvider);

      container
          .read(retailerEditProfileNotifierProvider.notifier)
          .initialiseRetailer(testValue);

      final result = container.read(retailerEditProfileNotifierProvider);

      expect(
          result.retailer, initialState.copyWith(retailer: testValue).retailer);
    });
  });

  group('nameChanged', () {
    test('should change retailer name field based on the input', () {
      final container = setUpContainer();
      const testValue = 'abc';

      final initialState = container.read(retailerEditProfileNotifierProvider);

      container
          .read(retailerEditProfileNotifierProvider.notifier)
          .nameChanged(testValue);

      final result = container.read(retailerEditProfileNotifierProvider);

      expect(result, initialState.copyWith.retailer(name: testValue));
    });
  });

  group('blockChanged', () {
    test('should change retailer block field based on the input', () {
      final container = setUpContainer();
      const testValue = 'abc';

      final initialState = container.read(retailerEditProfileNotifierProvider);

      container
          .read(retailerEditProfileNotifierProvider.notifier)
          .blockChanged(testValue);

      final result = container.read(retailerEditProfileNotifierProvider);

      expect(result, initialState.copyWith.retailer(block: testValue));
    });
  });

  group('streetChanged', () {
    test('should change retailer street field based on the input', () {
      final container = setUpContainer();
      const testValue = 'abc';

      final initialState = container.read(retailerEditProfileNotifierProvider);

      container
          .read(retailerEditProfileNotifierProvider.notifier)
          .streetChanged(testValue);

      final result = container.read(retailerEditProfileNotifierProvider);

      expect(result, initialState.copyWith.retailer(street: testValue));
    });
  });

  group('unitChanged', () {
    test('should change retailer unit field based on the input', () {
      final container = setUpContainer();
      const testValue = 'abc';

      final initialState = container.read(retailerEditProfileNotifierProvider);

      container
          .read(retailerEditProfileNotifierProvider.notifier)
          .unitChanged(testValue);

      final result = container.read(retailerEditProfileNotifierProvider);

      expect(result, initialState.copyWith.retailer(unit: testValue));
    });
  });

  group('postalCodeChanged', () {
    test('should change retailer postalCode field based on the input', () {
      final container = setUpContainer();
      const testValue = 'abc';

      final initialState = container.read(retailerEditProfileNotifierProvider);

      container
          .read(retailerEditProfileNotifierProvider.notifier)
          .postalCodeChanged(testValue);

      final result = container.read(retailerEditProfileNotifierProvider);

      expect(result, initialState.copyWith.retailer(postalCode: testValue));
    });
  });

  group('operatingHoursChanged', () {
    test('should change retailer operatingHours field based on the input', () {
      final container = setUpContainer();
      const testValue = 'abc';

      final initialState = container.read(retailerEditProfileNotifierProvider);

      container
          .read(retailerEditProfileNotifierProvider.notifier)
          .operatingHoursChanged(testValue);

      final result = container.read(retailerEditProfileNotifierProvider);

      expect(result, initialState.copyWith.retailer(operatingHours: testValue));
    });
  });

  group('descriptionChanged', () {
    test('should change retailer description field based on the input', () {
      final container = setUpContainer();
      const testValue = 'abc';

      final initialState = container.read(retailerEditProfileNotifierProvider);

      container
          .read(retailerEditProfileNotifierProvider.notifier)
          .descriptionChanged(testValue);

      final result = container.read(retailerEditProfileNotifierProvider);

      expect(result, initialState.copyWith.retailer(description: testValue));
    });
  });

  group('imageChanged', () {
    test('should change imageFile field based on the input', () {
      final container = setUpContainer();
      final testValue = File('');

      container
          .read(retailerEditProfileNotifierProvider.notifier)
          .imageChanged(testValue);

      final result = container.read(retailerEditProfileNotifierProvider);

      expect(result.imageFile, isA<File>());
      expect(result.hasInitialImageChanged, true);
    });
  });

  group('imageStringChanged', () {
    test('should change retailer imageString field based on the input', () {
      final container = setUpContainer();
      const testValue = 'abc';

      final initialState = container.read(retailerEditProfileNotifierProvider);

      container
          .read(retailerEditProfileNotifierProvider.notifier)
          .imageStringChanged(testValue);

      final result = container.read(retailerEditProfileNotifierProvider);

      expect(result, initialState.copyWith.retailer(image: testValue));
    });
  });

  group('pickImage', () {
    test('should return correct state if the user picked a valid image',
        () async {
      final container = setUpContainer();
      final testFile = File('');

      when(container.read(imagePickingRepositoryProvider).pickImage())
          .thenAnswer((_) async => right(testFile));

      await container
          .read(retailerEditProfileNotifierProvider.notifier)
          .pickImage();
      final result = container.read(retailerEditProfileNotifierProvider);

      expect(result.imageFile, isA<File>());
      expect(result.hasInitialImageChanged, true);
    });

    test('should return correct state if the user cancel picking image action',
        () async {
      final container = setUpContainer();

      when(container.read(imagePickingRepositoryProvider).pickImage())
          .thenAnswer(
              (_) async => left(const ImagePickingFailure.imagePicker('')));

      await container
          .read(retailerEditProfileNotifierProvider.notifier)
          .pickImage();
      final result = container.read(retailerEditProfileNotifierProvider);

      expect(result.imageFile, null);
    });
  });

  group('deleteImage', () {
    test(
        'should reset imageFile field to null if a picture is already selected',
        () {
      final container = setUpContainer();

      container
          .read(retailerEditProfileNotifierProvider.notifier)
          .imageChanged(File(''));

      container
          .read(retailerEditProfileNotifierProvider.notifier)
          .deleteImage();
      final result = container.read(retailerEditProfileNotifierProvider);
      expect(result.imageFile, null);
    });

    test('should reset imageFile field to null if a picture is not selected',
        () {
      final container = setUpContainer();
      container
          .read(retailerEditProfileNotifierProvider.notifier)
          .deleteImage();
      final result = container.read(retailerEditProfileNotifierProvider);
      expect(result.imageFile, null);
    });
  });
}
