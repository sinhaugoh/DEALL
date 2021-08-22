import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:deall/core/application/product/product.dart';
import 'package:deall/core/infrastructure/firestore_failures.dart';
import 'package:deall/core/infrastructure/product/product_dto.dart';
import 'package:deall/core/shared/providers.dart';
import 'package:deall/retailer/product/infrastructure/product_remote_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'product_repository_test.mocks.dart';

@GenerateMocks([
  ProductRemoteService,
  InternetConnectionChecker,
  FirebaseException,
])
void main() {
  final container = ProviderContainer(overrides: [
    productRemoteServiceProvider
        .overrideWithProvider(Provider((ref) => MockProductRemoteService())),
    internetConnectionCheckerProvider.overrideWithProvider(
        Provider((ref) => MockInternetConnectionChecker())),
  ]);

  void deviceIsOnline() {
    when(container.read(internetConnectionCheckerProvider).hasConnection)
        .thenAnswer((realInvocation) async => true);
  }

  void deviceIsOffline() {
    when(container.read(internetConnectionCheckerProvider).hasConnection)
        .thenAnswer((realInvocation) async => false);
  }

  group('getProductList', () {
    const testRetailerId = 'abc';
    test(
        'should return FirestoreFailures.noConnection when no internet connection',
        () async {
      deviceIsOffline();
      when(container
              .read(productRemoteServiceProvider)
              .getProductList(testRetailerId))
          .thenAnswer((realInvocation) async => <ProductDTO>[]);

      final result = await container
          .read(productRepoProvider)
          .getProductList(testRetailerId);
      expect(result, left(const FirestoreFailures.noConnection()));
    });

    test(
        'should return FirestoreFailures.objectNotFoud if the product document is not found in the database',
        () async {
      final mockFirebaseException = MockFirebaseException();
      deviceIsOnline();
      when(container
              .read(productRemoteServiceProvider)
              .getProductList(testRetailerId))
          .thenThrow(mockFirebaseException);
      when(mockFirebaseException.code).thenReturn('not-found');
      when(mockFirebaseException.message).thenReturn('any');

      final result = await container
          .read(productRepoProvider)
          .getProductList(testRetailerId);
      expect(result, left(const FirestoreFailures.objectNotFound()));
    });

    test(
        'should return FirestoreFailures.unknown if unexpected firebase exception thrown',
        () async {
      final mockFirebaseException = MockFirebaseException();
      deviceIsOnline();
      when(container
              .read(productRemoteServiceProvider)
              .getProductList(testRetailerId))
          .thenThrow(mockFirebaseException);
      when(mockFirebaseException.code).thenReturn('any');
      when(mockFirebaseException.message).thenReturn('any');

      final result = await container
          .read(productRepoProvider)
          .getProductList(testRetailerId);
      expect(result, left(const FirestoreFailures.unknown()));
    });

    test('should return list of product if no exception thrown', () async {
      const testProductDTO = <ProductDTO>[];
      deviceIsOnline();
      when(container
              .read(productRemoteServiceProvider)
              .getProductList(testRetailerId))
          .thenAnswer((realInvocation) async => testProductDTO);

      final result = await container
          .read(productRepoProvider)
          .getProductList(testRetailerId);
      expect(result, isA<Right<FirestoreFailures, List<Product>>>());
    });
  });

  group('generateNewProductId', () {
    test('', () {
      const testNewProductId = '123';
      const testUserId = 'abc';

      when(container
              .read(productRemoteServiceProvider)
              .generateNewProductId(testUserId))
          .thenReturn(testNewProductId);

      final result =
          container.read(productRepoProvider).generateNewProductId(testUserId);
      expect(result, testNewProductId);
    });
  });

  group('addProduct', () {
    const testRetailerId = 'abc';
    const testProductDTO = ProductDTO(
      id: 'test',
      name: 'name',
      usualPrice: 12,
      discountedPrice: 11,
      image: '',
      description: 'description',
      availability: false,
    );
    const testProduct = Product(
      id: 'test',
      name: 'name',
      usualPrice: 12,
      discountedPrice: 11,
      image: '',
      description: 'description',
      availability: false,
    );

    test('should return null if no exception thrown', () async {
      deviceIsOnline();

      final result = await container
          .read(productRepoProvider)
          .addProduct(testProduct, testRetailerId);
      expect(result, right<FirestoreFailures, void>(null));
    });

    test(
        'should return FirestoreFailures.noConnection when no internet connection',
        () async {
      deviceIsOffline();

      final result = await container
          .read(productRepoProvider)
          .addProduct(testProduct, testRetailerId);
      expect(result, left(const FirestoreFailures.noConnection()));
    });

    test(
        'should return FirestoreFailures.cancelledOperation if the operation is cancelled',
        () async {
      final mockFirebaseException = MockFirebaseException();

      deviceIsOnline();
      when(container
              .read(productRemoteServiceProvider)
              .addProduct(testProductDTO, testRetailerId))
          .thenThrow(mockFirebaseException);
      when(mockFirebaseException.code).thenReturn('cancelled');
      when(mockFirebaseException.message).thenReturn('any');

      final result = await container
          .read(productRepoProvider)
          .addProduct(testProduct, testRetailerId);
      expect(result, left(const FirestoreFailures.cancelledOperation()));
    });

    test(
        'should return FirestoreFailures.unknown if unexpected firebase exception thrown',
        () async {
      final mockFirebaseException = MockFirebaseException();

      deviceIsOnline();
      when(container
              .read(productRemoteServiceProvider)
              .addProduct(testProductDTO, testRetailerId))
          .thenThrow(mockFirebaseException);
      when(mockFirebaseException.code).thenReturn('any');
      when(mockFirebaseException.message).thenReturn('any');

      final result = await container
          .read(productRepoProvider)
          .addProduct(testProduct, testRetailerId);
      expect(result, left(const FirestoreFailures.unknown()));
    });
  });

  group('updateProduct', () {
    const testProductDTO = ProductDTO(
      id: 'test',
      name: 'name',
      usualPrice: 12,
      discountedPrice: 11,
      image: '',
      description: 'description',
      availability: false,
    );
    const testProduct = Product(
      id: 'test',
      name: 'name',
      usualPrice: 12,
      discountedPrice: 11,
      image: '',
      description: 'description',
      availability: false,
    );

    test('should update the document if no exception thrown', () async {
      deviceIsOnline();

      final result =
          await container.read(productRepoProvider).updateProduct(testProduct);
      expect(result, right(unit));
    });

    test(
        'should return FirestoreFailures.noConnection when no internet connection',
        () async {
      deviceIsOffline();

      final result =
          await container.read(productRepoProvider).updateProduct(testProduct);
      expect(result, left(const FirestoreFailures.noConnection()));
    });

    test(
        'should return FirestoreFailures.objectNotFound if the document is not found in the database',
        () async {
      final mockFirebaseException = MockFirebaseException();

      deviceIsOnline();
      when(container
              .read(productRemoteServiceProvider)
              .updateProduct(testProductDTO))
          .thenThrow(mockFirebaseException);
      when(mockFirebaseException.code).thenReturn('not-found');
      when(mockFirebaseException.message).thenReturn('any');

      final result =
          await container.read(productRepoProvider).updateProduct(testProduct);
      expect(result, left(const FirestoreFailures.objectNotFound()));
    });

    test(
        'should return FirestoreFailures.unknown if unexpected firebase exception thrown',
        () async {
      final mockFirebaseException = MockFirebaseException();

      deviceIsOnline();
      when(container
              .read(productRemoteServiceProvider)
              .updateProduct(testProductDTO))
          .thenThrow(mockFirebaseException);
      when(mockFirebaseException.code).thenReturn('any');
      when(mockFirebaseException.message).thenReturn('any');

      final result =
          await container.read(productRepoProvider).updateProduct(testProduct);
      expect(result, left(const FirestoreFailures.unknown()));
    });
  });

  group('deleteProduct', () {
    const testProductDTO = ProductDTO(
      id: 'test',
      name: 'name',
      usualPrice: 12,
      discountedPrice: 11,
      image: '',
      description: 'description',
      availability: false,
    );
    const testProduct = Product(
      id: 'test',
      name: 'name',
      usualPrice: 12,
      discountedPrice: 11,
      image: '',
      description: 'description',
      availability: false,
    );

    test('should delete document if no exception thrown', () async {
      deviceIsOnline();

      final result =
          await container.read(productRepoProvider).deleteProduct(testProduct);
      expect(result, right(unit));
    });

    test(
        'should return FirestoreFailures.noConnection when no internet connection',
        () async {
      deviceIsOffline();

      final result =
          await container.read(productRepoProvider).deleteProduct(testProduct);
      expect(result, left(const FirestoreFailures.noConnection()));
    });

    test(
        'should return FirestoreFailures.objectNotFound if the document is not found in the database',
        () async {
      final mockFirebaseException = MockFirebaseException();

      deviceIsOnline();
      when(container
              .read(productRemoteServiceProvider)
              .deleteProduct(testProductDTO))
          .thenThrow(mockFirebaseException);
      when(mockFirebaseException.code).thenReturn('not-found');
      when(mockFirebaseException.message).thenReturn('any');

      final result =
          await container.read(productRepoProvider).deleteProduct(testProduct);
      expect(result, left(const FirestoreFailures.objectNotFound()));
    });

    test(
        'should return FirestoreFailures.unknown if unexpected firebase exception thrown',
        () async {
      final mockFirebaseException = MockFirebaseException();

      deviceIsOnline();
      when(container
              .read(productRemoteServiceProvider)
              .deleteProduct(testProductDTO))
          .thenThrow(mockFirebaseException);
      when(mockFirebaseException.code).thenReturn('any');
      when(mockFirebaseException.message).thenReturn('any');

      final result =
          await container.read(productRepoProvider).deleteProduct(testProduct);
      expect(result, left(const FirestoreFailures.unknown()));
    });
  });

  group('updateProductList', () {
    const testProductList = <Product>[];
    const testProductDTOList = <ProductDTO>[];

    test('should update list of document if no exception thrown', () async {
      deviceIsOnline();

      final result =
          await container.read(productRepoProvider).updateProductList(testProductList);
      expect(result, right(unit));
    });

    test(
        'should return FirestoreFailures.noConnection when no internet connection',
        () async {
      deviceIsOffline();

      final result =
          await container.read(productRepoProvider).updateProductList(testProductList);
      expect(result, left(const FirestoreFailures.noConnection()));
    });

    test(
        'should return FirestoreFailures.objectNotFound if the document is not found in the database',
        () async {
      final mockFirebaseException = MockFirebaseException();

      deviceIsOnline();
      when(container
              .read(productRemoteServiceProvider)
              .updateProductList(testProductDTOList))
          .thenThrow(mockFirebaseException);
      when(mockFirebaseException.code).thenReturn('not-found');
      when(mockFirebaseException.message).thenReturn('any');

      final result =
          await container.read(productRepoProvider).updateProductList(testProductList);
      expect(result, left(const FirestoreFailures.objectNotFound()));
    });

    test(
        'should return FirestoreFailures.unknown if unexpected firebase exception thrown',
        () async {
      final mockFirebaseException = MockFirebaseException();

      deviceIsOnline();
      when(container
              .read(productRemoteServiceProvider)
              .updateProductList(testProductDTOList))
          .thenThrow(mockFirebaseException);
      when(mockFirebaseException.code).thenReturn('any');
      when(mockFirebaseException.message).thenReturn('any');

      final result =
          await container.read(productRepoProvider).updateProductList(testProductList);
      expect(result, left(const FirestoreFailures.unknown()));
    });
  });
}
