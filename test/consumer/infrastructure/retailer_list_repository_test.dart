import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:deall/consumer/infrastructure/firestore_failures.dart';
import 'package:deall/consumer/infrastructure/retailer_list_remote_service.dart';
import 'package:deall/consumer/shared/providers.dart';

import 'package:deall/core/application/retailer.dart';
import 'package:deall/core/infrastructure/retailer_dto.dart';

import 'retailer_list_repository_test.mocks.dart';

@GenerateMocks([
  RetailerListRemoteService,
  FirestoreFailures,
  Retailer,
  RetailerDTO,
  FirebaseException,
])
void main() {
  ProviderContainer setUpTestContainer() {
    final testContainer = ProviderContainer(overrides: [
      retailerListRemoteServiceProvider
          .overrideWithProvider(Provider((ref) => MockRetailerListRemoteService())),
    ]);
    addTearDown(testContainer.dispose);
    return testContainer;
  }

  group('getRetailerList', () {
    test('should return populated RetailerDTO list if successfully retrieved data from firebase retailer collection list', () async {
      final testContainer = setUpTestContainer();
      List<RetailerDTO> mockList = [];
      when(testContainer.read(retailerListRemoteServiceProvider).getRetailerList()).thenAnswer((_) async => firebaseList);
      mockList = await testContainer.read(retailerListRemoteServiceProvider).getRetailerList();
      expect(mockList, isA<List<RetailerDTO>>());
      expect(mockList, firebaseList);
    });

    test('should return empty RetailerDTO list if successfully retrieved data firebase retailer collection list is empty', () async {
      final testContainer = setUpTestContainer();
      List<RetailerDTO> mockList = [];
      when(testContainer.read(retailerListRemoteServiceProvider).getRetailerList()).thenAnswer((_) async => <RetailerDTO>[]);
      mockList = await testContainer.read(retailerListRemoteServiceProvider).getRetailerList();
      expect(mockList, isA<List<RetailerDTO>>());
      expect(mockList, []);
    });

    // failure/exception testing in retailer_list_notifier_test
  });
}

// based on 'retailer' collection in firebase
  const List<RetailerDTO> firebaseList = [
    RetailerDTO(
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
    RetailerDTO(
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
    RetailerDTO(
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
    RetailerDTO(
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
