import 'package:auto_route/annotations.dart';
import 'package:deall/auth/presentation/sign_in_page.dart';
import 'package:deall/auth/presentation/welcome_page.dart';
import 'package:deall/consumer/home/presentation/consumer_home_page.dart';
import 'package:deall/retailer/home/presentation/retailer_home_page.dart';
import 'package:deall/splash/splash_page.dart';

@MaterialAutoRouter(
  routes: [
    MaterialRoute(page: SplashPage, initial: true),
    MaterialRoute(page: WelcomePage),
    MaterialRoute(page: ConsumerHomePage),
    MaterialRoute(page: RetailerHomePage),
    MaterialRoute(page: SignInPage),
  ],
  replaceInRouteName: 'Page,Route',
)
class $AppRouter {}
