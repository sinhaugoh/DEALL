import 'package:deall/auth/infrastructure/firebase_auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_notifier.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const AuthState._();
  const factory AuthState.initial() = _Initial;
  const factory AuthState.authenticated() = _Authenticated;
  const factory AuthState.notAuthenticated() = _NotAuthenticated;
}

class AuthNotifier extends StateNotifier<AuthState> {
  final FirebaseAuthService _firebaseAuthService;

  AuthNotifier(this._firebaseAuthService) : super(const AuthState.initial());

  Future<AuthState> checkIfUserIsAuthenticated() async =>
      await _firebaseAuthService.isUserAuthenticated()
          ? state = const AuthState.authenticated()
          : state = const AuthState.notAuthenticated();
}
