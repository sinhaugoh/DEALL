import 'package:deall/auth/application/auth_notifier.dart';
import 'package:deall/auth/application/consumer_sign_up_form_notifier.dart';
import 'package:deall/auth/application/sign_in_form_notifier.dart';
import 'package:deall/auth/infrastructure/auth_repository.dart';
import 'package:deall/auth/infrastructure/firebase_auth_service.dart';
import 'package:deall/auth/infrastructure/initial_user_creation_service.dart';
import 'package:deall/core/shared/providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseAuthProvider = Provider((ref) => FirebaseAuth.instance);

final firebaseAuthServiceProvider =
    Provider((ref) => FirebaseAuthService(ref.watch(firebaseAuthProvider)));
final initialUserCreationServiceProvider =
    Provider((ref) => InitialUserCreationService(ref.watch(firestoreProvider)));

final authRepositoryProvider = Provider((ref) => AuthRepository(
      ref.watch(firebaseAuthServiceProvider),
      ref.watch(initialUserCreationServiceProvider),
      ref.watch(internetConnectionCheckerProvider),
    ));
final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
    (ref) => AuthNotifier(ref.watch(authRepositoryProvider)));

final signInFormNotifierProvider =
    StateNotifierProvider.autoDispose<SignInFormNotifier, SignInFormState>(
        (ref) => SignInFormNotifier(ref.watch(authRepositoryProvider)));
final consumerSignUpFormNotifierProvider = StateNotifierProvider.autoDispose<
        ConsumerSignUpFormNotifier, ConsumerSignUpFormState>(
    (ref) => ConsumerSignUpFormNotifier(ref.watch(authRepositoryProvider)));
