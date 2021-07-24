import 'package:deall/auth/application/firebase_user.dart';
import 'package:deall/auth/infrastructure/firebase_auth_service.dart';

class AuthRepository {
  //! DO NOT CHANGE THE VALUE OF THIS,
  //! ELSE THE DATA ON DATABASE NEED TO BE CHANGED
  static const consumerTypeString = 'consumer';
  static const retailerTypeString = 'retailer';

  final FirebaseAuthService _firebaseAuthService;

  AuthRepository(this._firebaseAuthService);

  Future<FirebaseUser?> getFirebaseUser() async {
    final firebaseUser = await _firebaseAuthService.getFirebaseUser();
    if (firebaseUser == null) {
      return null;
    } else {
      return FirebaseUser(
        id: firebaseUser.uid,
        userType: UserType.consumer,
      );
    }
  }

  // Future<void> signIn() {
  //   return _firebaseAuthService.signIn();
  // }
}
