import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _authInstance;

  FirebaseAuthService(this._authInstance);

  Future<User?> getFirebaseUser() {
    return _authInstance.authStateChanges().first;
  }

  // Future<void> signIn() {
  //   return _authInstance.signInWithEmailAndPassword(
  //     email: 'test@gmail.com',
  //     password: '123456',
  //   );
  // }
}
