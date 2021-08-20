import 'package:dartz/dartz.dart';
import 'package:deall/core/application/retailer/retailer.dart';
import 'package:deall/core/infrastructure/retailer/retailer_dto.dart';
import 'package:deall/core/shared/providers.dart';
import 'package:deall/retailer/application/retailer_failure.dart';
import 'package:deall/retailer/infrastructure/retailer_remote_service.dart';
import 'package:deall/retailer/shared/providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'retailer_repository_test.mocks.dart';

@GenerateMocks([
  RetailerRemoteService,
  InternetConnectionChecker,
  FirebaseAuthException,
  FirebaseException,
  RetailerDTO,
])
void main() {
  final container = ProviderContainer(
    overrides: [
      retailerRemoteServiceProvider
          .overrideWithProvider(Provider((ref) => MockRetailerRemoteService())),
      internetConnectionCheckerProvider.overrideWithProvider(
          Provider((ref) => MockInternetConnectionChecker())),
    ],
  );

  void deviceIsOnline() {
    when(container.read(internetConnectionCheckerProvider).hasConnection)
        .thenAnswer((realInvocation) async => true);
  }

  void deviceIsOffline() {
    when(container.read(internetConnectionCheckerProvider).hasConnection)
        .thenAnswer((realInvocation) async => false);
  }

  group('getRetailer', () {
    test(
        'should return RetailerFailure.noConnection when there is no internet connection',
        () async {
      deviceIsOffline();
      final result =
          await container.read(retailerRepositoryProvider).getRetailer();
      expect(result, left(const RetailerFailure.noConnection()));
    });

    test(
        'should return RetailerFailure.authentication if not authenticated to access database',
        () async {
      final mockFirebaseAuthException = MockFirebaseAuthException();
      deviceIsOnline();
      when(container.read(retailerRemoteServiceProvider).getRetailer())
          .thenThrow(mockFirebaseAuthException);
      when(mockFirebaseAuthException.code).thenReturn('any');
      when(mockFirebaseAuthException.message).thenReturn('any');

      final result =
          await container.read(retailerRepositoryProvider).getRetailer();

      verify(container.read(retailerRemoteServiceProvider).getRetailer());
      expect(result, left(const RetailerFailure.authentication('any: any')));
    });

    test(
        'should return RetailerFailure.notFound if the user document is not found in the database',
        () async {
      final mockFirebaseException = MockFirebaseException();
      deviceIsOnline();
      when(container.read(retailerRemoteServiceProvider).getRetailer())
          .thenThrow(mockFirebaseException);
      when(mockFirebaseException.code).thenReturn('not-found');
      when(mockFirebaseException.message).thenReturn('any');

      final result =
          await container.read(retailerRepositoryProvider).getRetailer();

      verify(container.read(retailerRemoteServiceProvider).getRetailer());
      expect(result, left(const RetailerFailure.notFound()));
    });

    test(
        'should return RetailerFailure.unexpected if unexpected exception thrown',
        () async {
      final mockFirebaseException = MockFirebaseException();
      deviceIsOnline();
      when(container.read(retailerRemoteServiceProvider).getRetailer())
          .thenThrow(mockFirebaseException);
      when(mockFirebaseException.code).thenReturn('any');
      when(mockFirebaseException.message).thenReturn('any');

      final result =
          await container.read(retailerRepositoryProvider).getRetailer();

      verify(container.read(retailerRemoteServiceProvider).getRetailer());
      expect(result, left(const RetailerFailure.unexpected('any: any')));
    });

    test(
        'should return Retailer if successfully retrieved the retailer document',
        () async {
      final testRetailerDTO = MockRetailerDTO();

      deviceIsOnline();
      when(container.read(retailerRemoteServiceProvider).getRetailer())
          .thenAnswer((realInvocation) async => testRetailerDTO);
      when(testRetailerDTO.toDomain()).thenReturn(Retailer.initial());

      final result =
          await container.read(retailerRepositoryProvider).getRetailer();

      verify(container.read(retailerRemoteServiceProvider).getRetailer());
      expect(result, right(Retailer.initial()));
    });
  });

  group('updateRetailer', () {
    final updatedRetailerInstance = Retailer.initial();
    test(
        'should return RetailerFailure.noConnection when there is no internet connection',
        () async {
      deviceIsOffline();
      final result = await container
          .read(retailerRepositoryProvider)
          .updateRetailer(updatedRetailerInstance);
      expect(result, left(const RetailerFailure.noConnection()));
    });

    test(
        'should return RetailerFailure.authentication if not authenticated to access database',
        () async {
      final mockFirebaseAuthException = MockFirebaseAuthException();
      deviceIsOnline();
      when(container
              .read(retailerRemoteServiceProvider)
              .updateRetailer(RetailerDTO.fromDomain(updatedRetailerInstance)))
          .thenThrow(mockFirebaseAuthException);
      when(mockFirebaseAuthException.code).thenReturn('any');
      when(mockFirebaseAuthException.message).thenReturn('any');

      final result = await container
          .read(retailerRepositoryProvider)
          .updateRetailer(updatedRetailerInstance);

      expect(result, left(const RetailerFailure.authentication('any: any')));
    });

    test(
        'should return RetailerFailure.notFound if the user document is not found in the database',
        () async {
      final mockFirebaseException = MockFirebaseException();
      deviceIsOnline();
      when(container
              .read(retailerRemoteServiceProvider)
              .updateRetailer(RetailerDTO.fromDomain(updatedRetailerInstance)))
          .thenThrow(mockFirebaseException);
      when(mockFirebaseException.code).thenReturn('not-found');
      when(mockFirebaseException.message).thenReturn('any');

      final result = await container
          .read(retailerRepositoryProvider)
          .updateRetailer(updatedRetailerInstance);

      expect(result, left(const RetailerFailure.notFound()));
    });

    test(
        'should return RetailerFailure.unexpected if unexpected exception thrown',
        () async {
      final mockFirebaseException = MockFirebaseException();
      deviceIsOnline();
      when(container
              .read(retailerRemoteServiceProvider)
              .updateRetailer(RetailerDTO.fromDomain(updatedRetailerInstance)))
          .thenThrow(mockFirebaseException);
      when(mockFirebaseException.code).thenReturn('any');
      when(mockFirebaseException.message).thenReturn('any');

      final result = await container
          .read(retailerRepositoryProvider)
          .updateRetailer(updatedRetailerInstance);

      expect(result, left(const RetailerFailure.unexpected('any: any')));
    });

    test('should return Unit if successfully updated the retailer document',
        () async {
      deviceIsOnline();
      when(container
              .read(retailerRemoteServiceProvider)
              .updateRetailer(RetailerDTO.fromDomain(updatedRetailerInstance)))
          .thenAnswer((realInvocation) async => unit);

      final result = await container
          .read(retailerRepositoryProvider)
          .updateRetailer(updatedRetailerInstance);

      expect(result, right(unit));
    });
  });
}
