import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:deall/auth/application/app_user.dart';
import 'package:deall/auth/application/auth_failure.dart';
import 'package:deall/auth/infrastructure/firebase_auth_service.dart';
import 'package:deall/auth/infrastructure/initial_user_creation_service.dart';
import 'package:deall/auth/shared/providers.dart';
import 'package:deall/core/application/retailer/retailer.dart';
import 'package:deall/core/infrastructure/image_picking_remote_service.dart';
import 'package:deall/core/shared/providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_repository_test.mocks.dart';

@GenerateMocks([
  FirebaseAuthService,
  InitialUserCreationService,
  InternetConnectionChecker,
  User,
  UserCredential,
  FirebaseAuthException,
  ImagePickingRemoteService,
])
void main() {
  final container = ProviderContainer(overrides: [
    firebaseAuthServiceProvider
        .overrideWithProvider(Provider((ref) => MockFirebaseAuthService())),
    initialUserCreationServiceProvider.overrideWithProvider(
        Provider((ref) => MockInitialUserCreationService())),
    internetConnectionCheckerProvider.overrideWithProvider(
        Provider((ref) => MockInternetConnectionChecker())),
    imagePickingRemoteServiceProvider.overrideWithProvider(
        Provider((ref) => MockImagePickingRemoteService())),
  ]);

  const testEmail = 'test@gmail.com';
  const testPassword = 'abcd1234';

  void deviceIsOnline() {
    when(container.read(internetConnectionCheckerProvider).hasConnection)
        .thenAnswer((realInvocation) async => true);
  }

  void deviceIsOffline() {
    when(container.read(internetConnectionCheckerProvider).hasConnection)
        .thenAnswer((realInvocation) async => false);
  }

  group('getFirebaseUser', () {
    test(
        'should return correct AppUser object if user of type consumer is authenticated',
        () async {
      //arrange
      final mockUser = MockUser();
      when(container.read(firebaseAuthServiceProvider).getFirebaseUser())
          .thenAnswer((_) async => mockUser);
      when(mockUser.uid).thenReturn('test');
      when(mockUser.displayName).thenReturn('consumer');
      //act
      final result =
          await container.read(authRepositoryProvider).getFirebaseUser();
      //assert
      expect(result, isA<AppUser>());
      expect(result,
          equals(const AppUser(id: 'test', userType: UserType.consumer)));
    });

    test(
        'should return correct AppUser object if user of type retailer is authenticated',
        () async {
      //arrange
      final mockUser = MockUser();
      when(container.read(firebaseAuthServiceProvider).getFirebaseUser())
          .thenAnswer((_) async => mockUser);
      when(mockUser.uid).thenReturn('test');
      when(mockUser.displayName).thenReturn('retailer');
      //act
      final result =
          await container.read(authRepositoryProvider).getFirebaseUser();
      //assert
      expect(result, isA<AppUser>());
      expect(result,
          equals(const AppUser(id: 'test', userType: UserType.retailer)));
    });

    test('should return null if user is unauthenticated', () async {
      //arrange
      when(container.read(firebaseAuthServiceProvider).getFirebaseUser())
          .thenAnswer((_) async => null);
      //act
      final result =
          await container.read(authRepositoryProvider).getFirebaseUser();
      //assert
      expect(result, null);
    });
  });

  group('signIn', () {
    test('should return AuthFailure.noConnection when the device is offline',
        () async {
      //arrange
      deviceIsOffline();
      //act
      final result = await container.read(authRepositoryProvider).signIn(
            email: testEmail,
            password: testPassword,
          );
      //assert
      verify(container.read(internetConnectionCheckerProvider).hasConnection);
      expect(result, left(const AuthFailure.noConnection()));
    });

    test('should return AppUser of type consumer if sign is was successful',
        () async {
      final mockUser = MockUser();
      final mockUserCredential = MockUserCredential();
      deviceIsOnline();
      when(container
              .read(firebaseAuthServiceProvider)
              .signIn(email: testEmail, password: testPassword))
          .thenAnswer((realInvocation) async => mockUserCredential);
      when(mockUserCredential.user).thenReturn(mockUser);
      when(mockUser.uid).thenReturn('test');
      when(mockUser.displayName).thenReturn('consumer');

      final result = await container.read(authRepositoryProvider).signIn(
            email: testEmail,
            password: testPassword,
          );

      verify(container.read(internetConnectionCheckerProvider).hasConnection);
      expect(
        result,
        right(const AppUser(id: 'test', userType: UserType.consumer)),
      );
    });

    test('should return AppUser of type retailer if sign is was successful',
        () async {
      final mockUser = MockUser();
      final mockUserCredential = MockUserCredential();
      deviceIsOnline();
      when(container
              .read(firebaseAuthServiceProvider)
              .signIn(email: testEmail, password: testPassword))
          .thenAnswer((realInvocation) async => mockUserCredential);
      when(mockUserCredential.user).thenReturn(mockUser);
      when(mockUser.uid).thenReturn('test');
      when(mockUser.displayName).thenReturn('retailer');

      final result = await container.read(authRepositoryProvider).signIn(
            email: testEmail,
            password: testPassword,
          );

      verify(container.read(internetConnectionCheckerProvider).hasConnection);
      expect(
        result,
        right(const AppUser(id: 'test', userType: UserType.retailer)),
      );
    });

    test('should return AuthFailure.server if firebase auth throws', () async {
      final mockFirebaseException = MockFirebaseAuthException();
      deviceIsOnline();
      when(container
              .read(firebaseAuthServiceProvider)
              .signIn(email: testEmail, password: testPassword))
          .thenThrow(mockFirebaseException);
      when(mockFirebaseException.code).thenReturn('test');
      when(mockFirebaseException.message).thenReturn('test');

      final result = await container.read(authRepositoryProvider).signIn(
            email: testEmail,
            password: testPassword,
          );

      verify(container.read(internetConnectionCheckerProvider).hasConnection);
      expect(
        result,
        left(const AuthFailure.server('test: test')),
      );
    });
  });

  group('consumerSignUp', () {
    test('should return AuthFailure.noConnection when the device is offline',
        () async {
      //arrange
      deviceIsOffline();
      //act
      final result =
          await container.read(authRepositoryProvider).consumerSignUp(
                email: testEmail,
                password: testPassword,
              );
      //assert
      verify(container.read(internetConnectionCheckerProvider).hasConnection);
      expect(result, left(const AuthFailure.noConnection()));
    });

    test('should return unit if sign up was successful', () async {
      final userCredential = MockUserCredential();
      deviceIsOnline();
      when(container
              .read(firebaseAuthServiceProvider)
              .consumerSignUp(email: testEmail, password: testPassword))
          .thenAnswer((realInvocation) async => userCredential);
      when(container.read(firebaseAuthServiceProvider).getUserId())
          .thenReturn('test');

      final result =
          await container.read(authRepositoryProvider).consumerSignUp(
                email: testEmail,
                password: testPassword,
              );

      expect(result, right(unit));
    });

    test('should return AuthFailure.server if email already in use', () async {
      final mockFirebaseAuthException = MockFirebaseAuthException();
      deviceIsOnline();
      when(container
              .read(firebaseAuthServiceProvider)
              .consumerSignUp(email: testEmail, password: testPassword))
          .thenThrow(mockFirebaseAuthException);
      when(mockFirebaseAuthException.code).thenReturn('email-already-in-use');

      final result =
          await container.read(authRepositoryProvider).consumerSignUp(
                email: testEmail,
                password: testPassword,
              );

      expect(result, left(const AuthFailure.server('Email already in use')));
    });

    test(
        'should return AuthFailure.unexpectedError if unexpected error are thrown',
        () async {
      deviceIsOnline();
      when(container
              .read(firebaseAuthServiceProvider)
              .consumerSignUp(email: testEmail, password: testPassword))
          .thenThrow(PlatformException);

      final result =
          await container.read(authRepositoryProvider).consumerSignUp(
                email: testEmail,
                password: testPassword,
              );

      expect(
          result, left(const AuthFailure.unexpectedError('Unexpected error')));
    });
  });

  group('retailerSignUp', () {
    test('should return AuthFailure.noConnection when the device is offline',
        () async {
      //arrange
      deviceIsOffline();
      //act
      final result =
          await container.read(authRepositoryProvider).retailerSignUp(
                email: testEmail,
                password: testPassword,
                retailer: Retailer.initial(),
                imageFile: null,
              );
      //assert
      verify(container.read(internetConnectionCheckerProvider).hasConnection);
      expect(result, left(const AuthFailure.noConnection()));
    });

    test('should return unit if sign up was successful with a shop logo',
        () async {
      final userCredential = MockUserCredential();
      final File imageFile = File('fakeImageRoute');
      const userId = 'test123';

      deviceIsOnline();
      when(container
              .read(firebaseAuthServiceProvider)
              .retailerSignUp(email: testEmail, password: testPassword))
          .thenAnswer((realInvocation) async => userCredential);
      when(container.read(firebaseAuthServiceProvider).getUserId())
          .thenReturn(userId);
      when(container
              .read(imagePickingRemoteServiceProvider)
              .uploadShopLogoToCloudStorage(userId: userId, file: imageFile))
          .thenAnswer((realInvocation) async => 'imageString');

      final result =
          await container.read(authRepositoryProvider).retailerSignUp(
                email: testEmail,
                password: testPassword,
                retailer: Retailer.initial(),
                imageFile: imageFile,
              );

      expect(result, right(unit));
    });

    test('should return unit if sign up was successful without a shop logo',
        () async {
      final userCredential = MockUserCredential();
      const File? imageFile = null;
      const userId = 'test123';
      final File imageFileNotExist = File('');

      deviceIsOnline();
      when(container
              .read(firebaseAuthServiceProvider)
              .retailerSignUp(email: testEmail, password: testPassword))
          .thenAnswer((realInvocation) async => userCredential);
      when(container.read(firebaseAuthServiceProvider).getUserId())
          .thenReturn(userId);
      when(container
              .read(imagePickingRemoteServiceProvider)
              .uploadShopLogoToCloudStorage(
                  userId: userId, file: imageFileNotExist))
          .thenAnswer((realInvocation) async => 'imageString');

      final result =
          await container.read(authRepositoryProvider).retailerSignUp(
                email: testEmail,
                password: testPassword,
                retailer: Retailer.initial(),
                imageFile: imageFile,
              );

      // verifyZeroInteractions(container.read(imagePickingRemoteServiceProvider)
      //     .uploadShopLogoToCloudStorage(file: imageFileNotExist, userId: userId));

      expect(result, right(unit));
    });

    test('should return AuthFailure.server if email already in use', () async {
      final mockFirebaseAuthException = MockFirebaseAuthException();
      const File? imageFile = null;

      deviceIsOnline();
      when(container
              .read(firebaseAuthServiceProvider)
              .retailerSignUp(email: testEmail, password: testPassword))
          .thenThrow(mockFirebaseAuthException);
      when(mockFirebaseAuthException.code).thenReturn('email-already-in-use');

      final result =
          await container.read(authRepositoryProvider).retailerSignUp(
                email: testEmail,
                password: testPassword,
                retailer: Retailer.initial(),
                imageFile: imageFile,
              );

      expect(result, left(const AuthFailure.server('Email already in use')));
    });

    test(
        'should return AuthFailure.unexpectedError if unexpected error are thrown',
        () async {
      const File? imageFile = null;

      deviceIsOnline();
      when(container
              .read(firebaseAuthServiceProvider)
              .retailerSignUp(email: testEmail, password: testPassword))
          .thenThrow(PlatformException);

      final result =
          await container.read(authRepositoryProvider).retailerSignUp(
                email: testEmail,
                password: testPassword,
                retailer: Retailer.initial(),
                imageFile: imageFile,
              );

      expect(
          result, left(const AuthFailure.unexpectedError('Unexpected error')));
    });
  });

  group('signOut', () {
    test('should return unit when the user sign out successfully', () async {
      final result = await container.read(authRepositoryProvider).signOut();

      verify(container.read(firebaseAuthServiceProvider).signOut());
      expect(result, right(unit));
    });

    test(
        'should return AuthFailure.server when FirebaseAuthExceptionare thrown',
        () async {
      final mockFirebaseAuthException = MockFirebaseAuthException();
      const errorCode = 'test';

      when(container.read(firebaseAuthServiceProvider).signOut())
          .thenThrow(mockFirebaseAuthException);
      when(mockFirebaseAuthException.code).thenReturn(errorCode);

      final result = await container.read(authRepositoryProvider).signOut();

      verify(container.read(firebaseAuthServiceProvider).signOut());

      expect(result, left(const AuthFailure.server(errorCode)));
    });
  });
}
