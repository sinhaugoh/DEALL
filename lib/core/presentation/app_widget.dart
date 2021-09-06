import 'package:dartz/dartz.dart';
import 'package:deall/auth/application/app_user.dart';
import 'package:deall/auth/application/auth_notifier.dart';
import 'package:deall/auth/shared/providers.dart';
import 'package:deall/core/presentation/const/style_theme.dart';
import 'package:deall/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    final isInitialPageRendered = ref.watch(splashHasRenderedProvider).state;
    if (isInitialPageRendered) {
      ref.listen(initialisationProvider, (value) {});
      ref.listen<AuthState>(authNotifierProvider, (state) {
        state.maybeWhen(
          authenticated: (appUser) {
            //TODO: navigate to home page
            if (appUser.userType == UserType.consumer) {
              appRouter.pushAndPopUntil(
                const ConsumerHomeRoute(),
                predicate: (route) => false,
              );
            }

            if (appUser.userType == UserType.retailer) {
              appRouter.pushAndPopUntil(
                const RetailerHomeRoute(),
                predicate: (route) => false,
              );
            }
          },
          notAuthenticated: () {
            appRouter.pushAndPopUntil(
              const SignInRoute(),
              predicate: (route) => false,
            );
          },
          orElse: () {},
        );
      });
    }
            
    return ScreenUtilInit(
        designSize: const Size(411, 731),
        builder: () => MaterialApp.router(
          title: 'DEALL',
          theme: StyleTheme.lightTheme,
          routeInformationParser: appRouter.defaultRouteParser(),
          routerDelegate: appRouter.delegate(),
          debugShowCheckedModeBanner: false,
      ),
    );
  }
}