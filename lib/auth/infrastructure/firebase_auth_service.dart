import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _authInstance;

  FirebaseAuthService(this._authInstance);

  Future<User?> getFirebaseUser() {
    return _authInstance.authStateChanges().first;
  }

  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) {
    return _authInstance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
