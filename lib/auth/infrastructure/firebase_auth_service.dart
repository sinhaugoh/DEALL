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
  }) async =>
      _signUp(
        email: email,
        password: password,
        userType: AuthRepository.consumerTypeString,
      );

  Future<UserCredential> retailerSignUp({
    required String email,
    required String password,
  }) async =>
      _signUp(
        email: email,
        password: password,
        userType: AuthRepository.retailerTypeString,
      );

  Future<UserCredential> _signUp({
    required String email,
    required String password,
    required String userType,
  }) async {
    final userCredential = await _authInstance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await userCredential.user?.updateDisplayName(userType);

    return userCredential;
  }

  Future<void> signOut() {
    return _authInstance.signOut();
  }
}
