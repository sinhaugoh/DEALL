import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:deall/consumer/infrastructure/retailer_list_repository.dart';
import 'package:deall/core/infrastructure/firestore_failures.dart';
import 'package:deall/consumer/shared/providers.dart';
import 'package:deall/core/application/retailer/retailer.dart';


import 'retailer_list_notifier_test.mocks.dart';

@GenerateMocks([
  RetailerListRepository,
])
void main() {
  ProviderContainer setUpTestContainer() {
    final testContainer = ProviderContainer(overrides: [
      retailerListRepoProvider
          .overrideWithProvider(Provider((ref) => MockRetailerListRepository())),
    ]);
    addTearDown(testContainer.dispose);
    return testContainer;
  }
  group('getRetailerList', () {
    test('should return a List<Retailer> if query is successful', () async {
      final testContainer = setUpTestContainer();
      when(testContainer.read(retailerListRepoProvider).getRetailerList()).thenAnswer((_) async => const Right(firebaseList));
      final resultList = await testContainer.read(retailerListRepoProvider).getRetailerList();
      
      expect(resultList.isRight(), equals(true));
      expect(resultList.isLeft(), equals(false));
      expect(resultList, equals(const Right(firebaseList)));
    });

    test('should return FirestoreFailures.cancelledOperation() if operation cancelled before it is completed', () async {
      final testContainer = setUpTestContainer();
      when(testContainer.read(retailerListRepoProvider).getRetailerList()).thenAnswer((_) async => const Left(FirestoreFailures.cancelledOperation()));
      final resultList = await testContainer.read(retailerListRepoProvider).getRetailerList();
      
      expect(resultList.isRight(), equals(false));
      expect(resultList.isLeft(), equals(true));
      expect(resultList, equals(const Left(FirestoreFailures.cancelledOperation())));
    });

    test('should return FirestoreFailures.objectNotFound() if no object found during query', () async {
      final testContainer = setUpTestContainer();
      when(testContainer.read(retailerListRepoProvider).getRetailerList()).thenAnswer((_) async => const Left(FirestoreFailures.objectNotFound()));
      final resultList = await testContainer.read(retailerListRepoProvider).getRetailerList();
      
      expect(resultList.isRight(), equals(false));
      expect(resultList.isLeft(), equals(true));
      expect(resultList, equals(const Left(FirestoreFailures.objectNotFound())));
    });

    test('should return FirestoreFailures.cancelledOperation() if an unknown error occured', () async {
      final testContainer = setUpTestContainer();
      when(testContainer.read(retailerListRepoProvider).getRetailerList()).thenAnswer((_) async => const Left(FirestoreFailures.unknown()));
      final resultList = await testContainer.read(retailerListRepoProvider).getRetailerList();
      
      expect(resultList.isRight(), equals(false));
      expect(resultList.isLeft(), equals(true));
      expect(resultList, equals(const Left(FirestoreFailures.unknown())));
    });
  }); 
}

// based on 'retailer' collection in firebase
  const List<Retailer> firebaseList = [
    Retailer(
      id: 'SeFlKi',
      uen: '',
      name: 'Bad & Poor Cake',
      block: 'Bedok Town Center',
      street: 'Bedok North Street 1',
      unit: '01-05',
      postalCode: '460209',
      operatingHours: 'Monday - Sunday: 11:00am - 9:30pm',
      image: '',
      description: 'Cake cake cake cake',
      visibility: true,
    ),
    Retailer(
      id: 'pAMo6dB',
      uen: '',
      name: 'Sum Cake',
      block: '32A',
      street: 'Chai Chee Ave',
      unit: '01-145',
      postalCode: '462032',
      operatingHours: 'Monday - Sunday: 11:30am - 9:30pm',
      image: '',
      description: 'Some cake',
      visibility: true,
    ),
    Retailer(
      id: 'sle1F4u',
      uen: '',
      name: 'WcDonalds',
      block: '311 Bedok Mall',
      street: 'New Upper Changi Road Bedok Mall',
      unit: '01-056',
      postalCode: '467360',
      operatingHours: 'Open 24hrs',
      image: '',
      description: 'Vegan burgers and soggy fries',
      visibility: true,
    ),
    Retailer(
      id: 'zYR2JUN',
      uen: '',
      name: 'Jall & Jick',
      block: '32A',
      street: 'Chai Chee Ave',
      unit: '01-198',
      postalCode: '462032',
      operatingHours: 'Monday - Sunday: 12:00pm - 9:00pm',
      image: '',
      description: 'Melting ice cream',
      visibility: true,
    ),
  ];
