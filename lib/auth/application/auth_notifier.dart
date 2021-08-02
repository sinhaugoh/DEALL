import 'package:deall/auth/application/app_user.dart';
import 'package:deall/auth/infrastructure/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_notifier.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const AuthState._();
  const factory AuthState.initial() = _Initial;
  const factory AuthState.authenticated(AppUser user) = _Authenticated;
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

  Future<void> signOut() async {
    final successOrFailure = await _authRepository.signOut();

    successOrFailure.fold(
        (f) => null,
        (r) => state = const AuthState.notAuthenticated());
  }
}
