import 'package:deall/auth/application/firebase_user.dart';
import 'package:deall/auth/infrastructure/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_notifier.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const AuthState._();
  const factory AuthState.initial() = _Initial;
  const factory AuthState.authenticated(FirebaseUser user) = _Authenticated;
  const factory AuthState.notAuthenticated() = _NotAuthenticated;
}

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository _authRepository;

  AuthNotifier(this._authRepository) : super(const AuthState.initial());

  Future<void> checkIfUserIsAuthenticated() async {
    final firebaseUser = await _authRepository.getFirebaseUser();
    firebaseUser == null
        ? state = const AuthState.notAuthenticated()
        : state = AuthState.authenticated(firebaseUser);
  }

  // Future<void> signIn() async {
  //   await _authRepository.signIn();
  //   state = const AuthState.authenticated(FirebaseUser(id: '123', userType: UserType.consumer));
  // }
}
