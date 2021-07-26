import 'package:dartz/dartz.dart';
import 'package:deall/auth/application/auth_failure.dart';
import 'package:deall/auth/application/app_user.dart';
import 'package:deall/auth/infrastructure/firebase_auth_service.dart';
import 'package:deall/auth/infrastructure/initial_user_creation_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  //! DO NOT CHANGE THE VALUE OF THIS,
  //! ELSE THE DATA ON DATABASE NEED TO BE CHANGED
  static const consumerTypeString = 'consumer';
  static const retailerTypeString = 'retailer';

  final FirebaseAuthService _firebaseAuthService;
  final InitialUserCreationService _initialUserCreationService;

  AuthRepository(this._firebaseAuthService, this._initialUserCreationService);

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

  Future<Either<AuthFailure, AppUser>> signIn({
    required String email,
    required String password,
  }) async {
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
    } catch(e) {
      return left(const AuthFailure.unexpectedError('Unexpected error'));
    }
  }
}
