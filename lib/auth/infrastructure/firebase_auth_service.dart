import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _authInstance;

  FirebaseAuthService(this._authInstance);

  Future<bool> isUserAuthenticated() async {
    final result = await _authInstance.authStateChanges().first;
    if(result == null) {
      return false;
    } else {
      return true;
    }
  }
}