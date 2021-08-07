import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:deall/auth/application/auth_failure.dart';
import 'package:deall/auth/application/app_user.dart';
import 'package:deall/auth/infrastructure/firebase_auth_service.dart';
import 'package:deall/auth/infrastructure/initial_user_creation_service.dart';
import 'package:deall/core/application/retailer.dart';
import 'package:deall/core/infrastructure/image_picking_remote_service.dart';
import 'package:deall/core/infrastructure/retailer_dto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class AuthRepository {
  //! DO NOT CHANGE THE VALUE OF THIS,
  //! ELSE THE DATA ON DATABASE NEED TO BE CHANGED
  static const consumerTypeString = 'consumer';
  static const retailerTypeString = 'retailer';

  final FirebaseAuthService _firebaseAuthService;
  final InitialUserCreationService _initialUserCreationService;
  final InternetConnectionChecker _internetConnectionChecker;
  final ImagePickingRemoteService _imagePickingRemoteService;

  AuthRepository(this._firebaseAuthService, this._initialUserCreationService,
      this._internetConnectionChecker, this._imagePickingRemoteService);

  UserType _convertFromStringToUserType(String? userTypeString) {
    UserType userType = UserType.unknown;

    if (userTypeString == consumerTypeString) {
      userType = UserType.consumer;
    }
    if (userTypeString == retailerTypeString) {
      userType = UserType.retailer;
    }

    return userType;
  }

  Future<AppUser?> getFirebaseUser() async {
    final firebaseUser = await _firebaseAuthService.getFirebaseUser();
    if (firebaseUser == null) {
      return null;
    } else {
      return AppUser(
        id: firebaseUser.uid,
        userType: _convertFromStringToUserType(firebaseUser.displayName),
      );
    }
  }

  ///DO NOT use before authenticated
  String getUserId() {
    return _firebaseAuthService.getUserId();
  }

  Future<Either<AuthFailure, AppUser>> signIn({
    required String email,
    required String password,
  }) async {
    //check for internet connection
    if (!await _internetConnectionChecker.hasConnection) {
      return left(const AuthFailure.noConnection());
    }

    try {
      final userCredential =
          await _firebaseAuthService.signIn(email: email, password: password);
      final user = userCredential.user;

      if (user != null) {
        return right(AppUser(
          id: user.uid,
          userType: _convertFromStringToUserType(user.displayName),
        ));
      } else {
        return left(const UnexpectedError(
            'Unexpected error: Firebase User object is missing after successfully signed in'));
      }
    } on FirebaseAuthException catch (e) {
      return left(AuthFailure.server('${e.code}: ${e.message}'));
    }
  }

  Future<Either<AuthFailure, Unit>> consumerSignUp({
    required String email,
    required String password,
  }) async {
    //check for internet connection
    if (!await _internetConnectionChecker.hasConnection) {
      return left(const AuthFailure.noConnection());
    }

    try {
      await _firebaseAuthService.consumerSignUp(
          email: email, password: password);

      await _initialUserCreationService
          .createConsumer(_firebaseAuthService.getUserId());

      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return left(const AuthFailure.server('Email already in use'));
      }
      return left(const AuthFailure.unexpectedError('Unexpected error'));
    } catch (e) {
      return left(const AuthFailure.unexpectedError('Unexpected error'));
    }
  }

  Future<Either<AuthFailure, Unit>> retailerSignUp({
    required String email,
    required String password,
    required Retailer retailer,
    required File? imageFile,
  }) async {
    //check for internet connection
    if (!await _internetConnectionChecker.hasConnection) {
      return left(const AuthFailure.noConnection());
    }

    try {
      await _firebaseAuthService.retailerSignUp(
          email: email, password: password);

      String imageString = '';
      if (imageFile != null) {
        imageString =
            await _imagePickingRemoteService.uploadShopLogoToCloudStorage(
                userId: _firebaseAuthService.getUserId(), file: imageFile);
      }

      await _initialUserCreationService.createRetailer(
        _firebaseAuthService.getUserId(),
        RetailerDTO.fromDomain(retailer.copyWith(image: imageString)),
      );

      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return left(const AuthFailure.server('Email already in use'));
      }

      //could come from either firebase auth or storage
      return left(AuthFailure.unexpectedError(e.code));
    } catch (e) {
      return left(const AuthFailure.unexpectedError('Unexpected error'));
    }
  }

  Future<Either<AuthFailure, Unit>> signOut() async {
    try {
      await _firebaseAuthService.signOut();
      return right(unit);
    } on FirebaseAuthException catch (e) {
      return left(AuthFailure.server(e.code));
    }
  }
}
