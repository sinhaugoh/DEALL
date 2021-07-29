import 'package:deall/auth/infrastructure/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _authInstance;

  FirebaseAuthService(this._authInstance);

  Future<User?> getFirebaseUser() {
    return _authInstance.authStateChanges().first;
  }

  ///DO NOT use before authenticated
  String getUserId() {
    return _authInstance.currentUser!.uid;
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

  Future<UserCredential> consumerSignUp({
    required String email,
    required String password,
  }) async {
    final userCredential = await _authInstance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await userCredential.user?.updateDisplayName(AuthRepository.consumerTypeString);
    
    return userCredential;
  }

  Future<void> signOut() {
    return _authInstance.signOut();
  }
}
