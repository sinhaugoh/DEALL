import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:deall/auth/infrastructure/auth_repository.dart';
import 'package:deall/auth/shared/providers.dart';
import 'package:deall/consumer/infrastructure/favourite_retailer_remote_service.dart';
import 'package:deall/consumer/shared/providers.dart';
import 'package:deall/core/application/retailer/retailer.dart';
import 'package:deall/core/infrastructure/firestore_failures.dart';
import 'package:deall/core/infrastructure/retailer/retailer_dto.dart';
import 'package:deall/core/shared/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'favourite_retailer_repository_test.mocks.dart';

@GenerateMocks([
  AuthRepository,
  InternetConnectionChecker,
  FavouriteRetailerRemoteService,
  FirebaseException,
])
void main() {
  final container = ProviderContainer(overrides: [
    authRepositoryProvider
        .overrideWithProvider(Provider((ref) => MockAuthRepository())),
    internetConnectionCheckerProvider.overrideWithProvider(
        Provider((ref) => MockInternetConnectionChecker())),
    favouriteRetailerRemoteServiceProvider.overrideWithProvider(
        Provider((ref) => MockFavouriteRetailerRemoteService())),
  ]);

  void deviceIsOnline() {
    when(container.read(internetConnectionCheckerProvider).hasConnection)
        .thenAnswer((realInvocation) async => true);
  }

  void deviceIsOffline() {
    when(container.read(internetConnectionCheckerProvider).hasConnection)
        .thenAnswer((realInvocation) async => false);
  }

  group('getFavouriteRetailers', () {
    const testConsumerId = '123';
    test(
        'should return FirestoreFailures.noConnection if there is no internet connection',
        () async {
      deviceIsOffline();

      final result = await container
          .read(favouriteRetailerRepositoryProvider)
          .getFavouriteRetailers();
      expect(result, left(const FirestoreFailures.noConnection()));
    });

    test(
        'should return FirestoreFailures.objectNotFound if the retailer list is not found in the database',
        () async {
      final mockFirebaseException = MockFirebaseException();
      deviceIsOnline();
      when(container
              .read(favouriteRetailerRemoteServiceProvider)
              .getFavouriteRetailers(testConsumerId))
          .thenThrow(mockFirebaseException);
      when(container.read(authRepositoryProvider).getUserId())
          .thenReturn(testConsumerId);
      when(mockFirebaseException.code).thenReturn('not-found');
      when(mockFirebaseException.message).thenReturn('any');

      final result = await container
          .read(favouriteRetailerRepositoryProvider)
          .getFavouriteRetailers();

      expect(result, left(const FirestoreFailures.objectNotFound()));
    });

    test(
        'should return FirestoreFailures.unknown if unknown firebase exception thrown',
        () async {
      final mockFirebaseException = MockFirebaseException();
      deviceIsOnline();
      when(container
              .read(favouriteRetailerRemoteServiceProvider)
              .getFavouriteRetailers(testConsumerId))
          .thenThrow(mockFirebaseException);
      when(container.read(authRepositoryProvider).getUserId())
          .thenReturn(testConsumerId);
      when(mockFirebaseException.code).thenReturn('any');
      when(mockFirebaseException.message).thenReturn('any');

      final result = await container
          .read(favouriteRetailerRepositoryProvider)
          .getFavouriteRetailers();

      expect(result, left(const FirestoreFailures.unknown()));
    });

    test('should return a list of favourite retailers if successful', () async {
      const testRetailerDTOList = <RetailerDTO>[];

      deviceIsOnline();
      when(container
              .read(favouriteRetailerRemoteServiceProvider)
              .getFavouriteRetailers(testConsumerId))
          .thenAnswer((realInvocation) async => testRetailerDTOList);
      when(container.read(authRepositoryProvider).getUserId())
          .thenReturn(testConsumerId);

      final result = await container
          .read(favouriteRetailerRepositoryProvider)
          .getFavouriteRetailers();

      expect(result, isA<Right<FirestoreFailures, List<Retailer>>>());
    });
  });

  group('updateFavouriteRetailers', () {
    const testConsumerId = '123';
    const testUpdatedRetailerList = [
      Retailer(
        id: 'abcd1234',
        name: 'name',
        block: 'block',
        street: 'street',
        unit: 'unit',
        postalCode: 'postalCode',
        operatingHours: 'operatingHours',
        description: 'description',
        image: '',
        visibility: false,
        uen: 'uen',
      ),
    ];

    const testRetailerIdList = [
      'abcd1234',
    ];

    const testUpdatedRetailerDTOList = [
      RetailerDTO(
        id: 'abcd1234',
        name: 'name',
        block: 'block',
        street: 'street',
        unit: 'unit',
        postalCode: 'postalCode',
        operatingHours: 'operatingHours',
        description: 'description',
        image: '',
        visibility: false,
        uen: 'uen',
      ),
    ];

    test(
        'should return FirestoreFailures.noConnection if there is no internet connection',
        () async {
      deviceIsOffline();

      final result = await container
          .read(favouriteRetailerRepositoryProvider)
          .updateFavouriteRetailerList(testUpdatedRetailerList);
      expect(result, left(const FirestoreFailures.noConnection()));
    });

    test('should update the database with new data if successful', () async {
      deviceIsOnline();

      final result = await container
          .read(favouriteRetailerRepositoryProvider)
          .updateFavouriteRetailerList(testUpdatedRetailerList);

      expect(result, isA<Right<FirestoreFailures, Unit>>());
    });

    test(
        'should return FirestoreFailures.objectNotFound if the retailer list is not found in the database',
        () async {
      final mockFirebaseException = MockFirebaseException();
      deviceIsOnline();
      when(container
              .read(favouriteRetailerRemoteServiceProvider)
              .updateFavouriteRetailerList(
                  retailerIdList: testRetailerIdList, userId: testConsumerId))
          .thenThrow(mockFirebaseException);
      when(mockFirebaseException.code).thenReturn('not-found');
      when(mockFirebaseException.message).thenReturn('any');

      final result = await container
          .read(favouriteRetailerRepositoryProvider)
          .updateFavouriteRetailerList(testUpdatedRetailerList);

      expect(result, left(const FirestoreFailures.objectNotFound()));
    });

    test(
        'should return FirestoreFailures.unknown if if unknown firebase exception thrown',
        () async {
      final mockFirebaseException = MockFirebaseException();
      deviceIsOnline();
      when(container
              .read(favouriteRetailerRemoteServiceProvider)
              .updateFavouriteRetailerList(
                  retailerIdList: testRetailerIdList, userId: testConsumerId))
          .thenThrow(mockFirebaseException);
      when(mockFirebaseException.code).thenReturn('any');
      when(mockFirebaseException.message).thenReturn('any');

      final result = await container
          .read(favouriteRetailerRepositoryProvider)
          .updateFavouriteRetailerList(testUpdatedRetailerList);

      expect(result, left(const FirestoreFailures.unknown()));
    });
  });
}
