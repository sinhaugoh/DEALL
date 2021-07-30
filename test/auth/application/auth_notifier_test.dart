import 'package:dartz/dartz.dart';
import 'package:deall/auth/application/app_user.dart';
import 'package:deall/auth/application/auth_notifier.dart';
import 'package:deall/auth/infrastructure/auth_repository.dart';
import 'package:deall/auth/shared/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_notifier_test.mocks.dart';

@GenerateMocks([
  AuthRepository,
])
void main() {
  ProviderContainer setUpContainer() {
    final container = ProviderContainer(overrides: [
      authRepositoryProvider
          .overrideWithProvider(Provider((ref) => MockAuthRepository())),
    ]);
    addTearDown(container.dispose);
    return container;
  }

  const appUser = AppUser(
    id: 'test',
    userType: UserType.consumer,
  );

  group('checkIfUserIsAuthenticated', () {
    test('should return AuthState.authenticated if the user is authenticated',
        () async {
      final container = setUpContainer();

      when(container.read(authRepositoryProvider).getFirebaseUser())
          .thenAnswer((realInvocation) async => appUser);

      expect(container.read(authNotifierProvider),
          const AuthState.initial());

      await container
          .read(authNotifierProvider.notifier)
          .checkIfUserIsAuthenticated();

      expect(container.read(authNotifierProvider),
          const AuthState.authenticated(appUser));
    });

    test('should return AuthState.notAuthenticated if the user is not authenticated',
        () async {
      final container = setUpContainer();

      when(container.read(authRepositoryProvider).getFirebaseUser())
          .thenAnswer((realInvocation) async => null);

      expect(container.read(authNotifierProvider),
          const AuthState.initial());

      await container
          .read(authNotifierProvider.notifier)
          .checkIfUserIsAuthenticated();

      expect(container.read(authNotifierProvider),
          const AuthState.notAuthenticated());
    });
  });

  group('signOut', () {
    test('should return AuthState.notAuthenticated when sign out is successful', () async {
      final container = setUpContainer();

      when(container.read(authRepositoryProvider).signOut()).thenAnswer((realInvocation) async => right(unit));

      await container.read(authNotifierProvider.notifier).signOut();

      expect(container.read(authNotifierProvider), const AuthState.notAuthenticated());
    });
  });
}
