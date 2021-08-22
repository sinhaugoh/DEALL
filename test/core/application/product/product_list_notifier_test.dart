import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:deall/core/application/product/product.dart';
import 'package:deall/core/application/product/product_list_state.dart';
import 'package:deall/core/infrastructure/firestore_failures.dart';
import 'package:deall/core/shared/providers.dart';
import 'package:deall/retailer/product/infrastructure/product_repository.dart';
import 'package:deall/retailer/product/shared/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'product_list_notifier_test.mocks.dart';

@GenerateMocks([
  ProductRepository,
])
void main() {
  ProviderContainer setUpContainer() {
    final container = ProviderContainer(overrides: [
      productRepoProvider
          .overrideWithProvider(Provider((ref) => MockProductRepository())),
    ]);
    addTearDown(container.dispose);
    return container;
  }

  group('getProductStream', () {
    test(
        'should return ProductListState.failure state if getting product list failed',
        () {
      final container = setUpContainer();

      when(container.read(productRepoProvider).getProductStream())
          .thenAnswer((realInvocation) async* {
        yield left(const FirestoreFailures.noConnection());
      });

      const expected = [
        ProductListState.loading(),
        ProductListState.failure('Unexpected error. Please contact support'),
      ];

      final streamController = StreamController<ProductListState>();

      container.listen<ProductListState>(productListNotifierProvider, (state) {
        streamController.sink.add(state);
      });

      expectLater(streamController.stream, emitsInAnyOrder(expected));

      container.read(productListNotifierProvider.notifier).getProductStream();

      addTearDown(() {
        streamController.close();
      });
    });

    test(
        'should return ProductListState.loaded state if successfully retrieve the latest version of product list',
        () {
      final container = setUpContainer();
      const testProductList = <Product>[];

      when(container.read(productRepoProvider).getProductStream())
          .thenAnswer((realInvocation) async* {
        yield right(testProductList);
      });

      const expected = [
        ProductListState.loading(),
        ProductListState.loaded(testProductList),
      ];

      final streamController = StreamController<ProductListState>();

      container.listen<ProductListState>(productListNotifierProvider, (state) {
        streamController.sink.add(state);
      });

      expectLater(streamController.stream, emitsInAnyOrder(expected));

      container.read(productListNotifierProvider.notifier).getProductStream();

      addTearDown(() {
        streamController.close();
      });
    });
  });
}
