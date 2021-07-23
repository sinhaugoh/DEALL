import 'package:dartz/dartz.dart';
import 'package:deall/auth/application/auth_notifier.dart';
import 'package:deall/auth/shared/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'routes/app_router.gr.dart';

//Do all the initialisation here
final initialisationProvider = FutureProvider<Unit>((ref) async {
  final authNotifier = ref.read(authNotifierProvider.notifier);
  await authNotifier.checkIfUserIsAuthenticated();

  return unit;
});

class AppWidget extends ConsumerWidget {
  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(initialisationProvider, (value) {});
    ref.listen<AuthState>(authNotifierProvider, (state) {
      state.maybeMap(
        authenticated: (_) {
          //TODO: navigate to home page
          // appRouter.pushAndPopUntil(
          //   const TestRoute(),
          //   predicate: (route) => false,
          // );
        },
        notAuthenticated: (_) {
          appRouter.pushAndPopUntil(
            const WelcomeRoute(),
            predicate: (route) => false,
          );
        },
        orElse: () {},
      );
    });

    return MaterialApp.router(
      title: 'DEALL',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routeInformationParser: appRouter.defaultRouteParser(),
      routerDelegate: appRouter.delegate(),
    );
  }
}
