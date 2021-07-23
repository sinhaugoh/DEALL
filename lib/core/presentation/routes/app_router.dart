import 'package:auto_route/annotations.dart';
import 'package:deall/auth/presentation/welcome_page.dart';
import 'package:deall/splash/splash_page.dart';

@MaterialAutoRouter(
  routes: [
    MaterialRoute(page: SplashPage, initial: true),
    MaterialRoute(page: WelcomePage),
  ],
  replaceInRouteName: 'Page,Route',
)
class $AppRouter {}
