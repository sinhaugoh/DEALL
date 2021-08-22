import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:deall/consumer/application/favourite_retailer_notifier.dart';
import 'package:deall/consumer/infrastructure/favourite_retailer_repository.dart';
import 'package:deall/consumer/shared/providers.dart';
import 'package:deall/core/application/retailer/retailer.dart';
import 'package:deall/core/infrastructure/firestore_failures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'favourite_retailer_notifier_test.mocks.dart';

@GenerateMocks([
  FavouriteRetailerRepository,
])
void main() {
  ProviderContainer setUpContainer() {
    final container = ProviderContainer(overrides: [
      favouriteRetailerRepositoryProvider.overrideWithProvider(
          Provider((ref) => MockFavouriteRetailerRepository())),
    ]);
    addTearDown(container.dispose);
    return container;
  }

  group('getRetailerList', () {
    test(
        'should return FavouriteRetailerState.failure if failure to get favourite retailer list',
        () {
      final container = setUpContainer();

      when(container
              .read(favouriteRetailerRepositoryProvider)
              .getFavouriteRetailers())
          .thenAnswer((realInvocation) async =>
              left(const FirestoreFailures.noConnection()));

      const expected = [
        FavouriteRetailerState.loading(),
        FavouriteRetailerState.failure(FirestoreFailures.noConnection()),
      ];

      final streamController = StreamController<FavouriteRetailerState>();

      container.listen<FavouriteRetailerState>(
          favouriteRetailerStateNotifierProvider, (state) {
        streamController.sink.add(state);
      });

      expectLater(streamController.stream, emitsInAnyOrder(expected));

      container
          .read(favouriteRetailerStateNotifierProvider.notifier)
          .getRetailerList();

      addTearDown(() {
        streamController.close();
      });
    });

    test(
        'should return FavouriteRetailerState.loaded if successfully retrieved favouriter retaielr list from database',
        () {
      final container = setUpContainer();

      when(container
              .read(favouriteRetailerRepositoryProvider)
              .getFavouriteRetailers())
          .thenAnswer((realInvocation) async => right(<Retailer>[]));

      const expected = [
        FavouriteRetailerState.loading(),
        FavouriteRetailerState.loaded(<Retailer>[]),
      ];

      final streamController = StreamController<FavouriteRetailerState>();

      container.listen<FavouriteRetailerState>(
          favouriteRetailerStateNotifierProvider, (state) {
        streamController.sink.add(state);
      });

      expectLater(streamController.stream, emitsInAnyOrder(expected));

      container
          .read(favouriteRetailerStateNotifierProvider.notifier)
          .getRetailerList();

      addTearDown(() {
        streamController.close();
      });
    });
  });
}
