// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../../../auth/presentation/consumer_sign_up_page.dart' as _i9;
import '../../../auth/presentation/retailer_sign_up_page.dart' as _i10;
import '../../../auth/presentation/sign_in_page.dart' as _i7;
import '../../../auth/presentation/sign_up_page.dart' as _i8;
import '../../../auth/presentation/welcome_page.dart' as _i4;
import '../../../consumer/presentation/consumer_home_page.dart' as _i5;
import '../../../retailer/home/presentation/retailer_home_page.dart' as _i6;
import '../../../splash/splash_page.dart' as _i3;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.SplashPage();
        }),
    WelcomeRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i4.WelcomePage();
        }),
    ConsumerHomeRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i5.ConsumerHomePage();
        }),
    RetailerHomeRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i6.RetailerHomePage();
        }),
    SignInRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i7.SignInPage();
        }),
    SignUpRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i8.SignUpPage();
        }),
    ConsumerSignUpRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i9.ConsumerSignUpPage();
        }),
    RetailerSignUpRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i10.RetailerSignUpPage();
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(SplashRoute.name, path: '/'),
        _i1.RouteConfig(WelcomeRoute.name, path: '/welcome-page'),
        _i1.RouteConfig(ConsumerHomeRoute.name, path: '/consumer-home-page'),
        _i1.RouteConfig(RetailerHomeRoute.name, path: '/retailer-home-page'),
        _i1.RouteConfig(SignInRoute.name, path: '/sign-in-page'),
        _i1.RouteConfig(SignUpRoute.name, path: '/sign-up-page'),
        _i1.RouteConfig(ConsumerSignUpRoute.name,
            path: '/consumer-sign-up-page'),
        _i1.RouteConfig(RetailerSignUpRoute.name,
            path: '/retailer-sign-up-page')
      ];
}

class SplashRoute extends _i1.PageRouteInfo {
  const SplashRoute() : super(name, path: '/');

  static const String name = 'SplashRoute';
}

class WelcomeRoute extends _i1.PageRouteInfo {
  const WelcomeRoute() : super(name, path: '/welcome-page');

  static const String name = 'WelcomeRoute';
}

class ConsumerHomeRoute extends _i1.PageRouteInfo {
  const ConsumerHomeRoute() : super(name, path: '/consumer-home-page');

  static const String name = 'ConsumerHomeRoute';
}

class RetailerHomeRoute extends _i1.PageRouteInfo {
  const RetailerHomeRoute() : super(name, path: '/retailer-home-page');

  static const String name = 'RetailerHomeRoute';
}

class SignInRoute extends _i1.PageRouteInfo {
  const SignInRoute() : super(name, path: '/sign-in-page');

  static const String name = 'SignInRoute';
}

class SignUpRoute extends _i1.PageRouteInfo {
  const SignUpRoute() : super(name, path: '/sign-up-page');

  static const String name = 'SignUpRoute';
}

class ConsumerSignUpRoute extends _i1.PageRouteInfo {
  const ConsumerSignUpRoute() : super(name, path: '/consumer-sign-up-page');

  static const String name = 'ConsumerSignUpRoute';
}

class RetailerSignUpRoute extends _i1.PageRouteInfo {
  const RetailerSignUpRoute() : super(name, path: '/retailer-sign-up-page');

  static const String name = 'RetailerSignUpRoute';
}
