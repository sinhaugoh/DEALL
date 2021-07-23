import 'package:deall/auth/application/auth_notifier.dart';
import 'package:deall/auth/infrastructure/firebase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseAuthProvider = Provider((ref) => FirebaseAuth.instance);

final firebaseAuthServiceProvider = Provider((ref) => FirebaseAuthService(ref.watch(firebaseAuthProvider)));
final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) => AuthNotifier(ref.watch(firebaseAuthServiceProvider)));