import 'package:deall/auth/application/auth_notifier.dart';
import 'package:deall/auth/application/sign_in_form_notifier.dart';
import 'package:deall/auth/infrastructure/auth_repository.dart';
import 'package:deall/auth/infrastructure/firebase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseAuthProvider = Provider((ref) => FirebaseAuth.instance);

final firebaseAuthServiceProvider = Provider((ref) => FirebaseAuthService(ref.watch(firebaseAuthProvider)));
final authRepositoryProvider = Provider((ref) => AuthRepository(ref.watch(firebaseAuthServiceProvider)));
final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) => AuthNotifier(ref.watch(authRepositoryProvider)));

final signInFormNotifierProvider = StateNotifierProvider.autoDispose<SignInFormNotifier, SignInFormState>((ref) =>SignInFormNotifier(ref.watch(authRepositoryProvider)));