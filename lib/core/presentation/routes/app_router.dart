import 'package:auto_route/annotations.dart';
import 'package:deall/auth/presentation/consumer_sign_up_page.dart';
import 'package:deall/auth/presentation/retailer_sign_up_page.dart';
import 'package:deall/auth/presentation/sign_in_page.dart';
import 'package:deall/auth/presentation/sign_up_page.dart';
import 'package:deall/auth/presentation/welcome_page.dart';
import 'package:deall/consumer/presentation/consumer_home_page.dart';
import 'package:deall/retailer/home/presentation/retailer_home_page.dart';
import 'package:deall/splash/splash_page.dart';

@MaterialAutoRouter(
  routes: [
    MaterialRoute(page: SplashPage, initial: true),
    MaterialRoute(page: WelcomePage),
    MaterialRoute(page: ConsumerHomePage),
    MaterialRoute(page: RetailerHomePage),
    MaterialRoute(page: SignInPage),
    MaterialRoute(page: SignUpPage),
    MaterialRoute(page: ConsumerSignUpPage),
    MaterialRoute(page: RetailerSignUpPage),
  ],
  replaceInRouteName: 'Page,Route',
)
class $AppRouter {}
