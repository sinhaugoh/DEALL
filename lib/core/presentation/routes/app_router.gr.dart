// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../../../auth/presentation/consumer_sign_up_page.dart' as _i9;
import '../../../auth/presentation/retailer_sign_up_page.dart' as _i11;
import '../../../auth/presentation/sign_in_page.dart' as _i7;
import '../../../auth/presentation/sign_up_page.dart' as _i8;
import '../../../auth/presentation/welcome_page.dart' as _i4;
import '../../../consumer/presentation/consumer_home_page.dart' as _i5;
import '../../../consumer/presentation/consumer_product_list_page.dart' as _i15;
import '../../../consumer/presentation/consumer_retailer_detail_page.dart'
    as _i16;
import '../../../retailer/presentation/edit_profile_page.dart' as _i13;
import '../../../retailer/presentation/retailer_home_page.dart' as _i6;
import '../../../retailer/presentation/retailer_profile_page.dart' as _i12;
import '../../../retailer/product/presentation/add_product_page.dart' as _i10;
import '../../../retailer/product/presentation/edit_product_page.dart' as _i14;
import '../../../splash/splash_page.dart' as _i3;
import '../../application/product/product.dart' as _i18;
import '../../application/retailer/retailer.dart' as _i17;

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
    AddProductRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i10.AddProductPage();
        }),
    RetailerSignUpRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i11.RetailerSignUpPage();
        }),
    RetailerProfileRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i12.RetailerProfilePage();
        }),
    EditProfileRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<EditProfileRouteArgs>();
          return _i13.EditProfilePage(key: args.key, retailer: args.retailer);
        }),
    EditProductRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<EditProductRouteArgs>();
          return _i14.EditProductPage(key: args.key, product: args.product);
        }),
    ConsumerProductListRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<ConsumerProductListRouteArgs>();
          return _i15.ConsumerProductListPage(args.retailerData, key: args.key);
        }),
    ConsumerRetailerDetailRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<ConsumerRetailerDetailRouteArgs>();
          return _i16.ConsumerRetailerDetailPage(args.retailerData,
              key: args.key);
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
        _i1.RouteConfig(AddProductRoute.name, path: '/add-product-page'),
        _i1.RouteConfig(RetailerSignUpRoute.name,
            path: '/retailer-sign-up-page'),
        _i1.RouteConfig(RetailerProfileRoute.name,
            path: '/retailer-profile-page'),
        _i1.RouteConfig(EditProfileRoute.name, path: '/edit-profile-page'),
        _i1.RouteConfig(EditProductRoute.name, path: '/edit-product-page'),
        _i1.RouteConfig(ConsumerProductListRoute.name,
            path: '/consumer-product-list-page'),
        _i1.RouteConfig(ConsumerRetailerDetailRoute.name,
            path: '/consumer-retailer-detail-page')
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

class AddProductRoute extends _i1.PageRouteInfo {
  const AddProductRoute() : super(name, path: '/add-product-page');

  static const String name = 'AddProductRoute';
}

class RetailerSignUpRoute extends _i1.PageRouteInfo {
  const RetailerSignUpRoute() : super(name, path: '/retailer-sign-up-page');

  static const String name = 'RetailerSignUpRoute';
}

class RetailerProfileRoute extends _i1.PageRouteInfo {
  const RetailerProfileRoute() : super(name, path: '/retailer-profile-page');

  static const String name = 'RetailerProfileRoute';
}

class EditProfileRoute extends _i1.PageRouteInfo<EditProfileRouteArgs> {
  EditProfileRoute({_i2.Key? key, required _i17.Retailer retailer})
      : super(name,
            path: '/edit-profile-page',
            args: EditProfileRouteArgs(key: key, retailer: retailer));

  static const String name = 'EditProfileRoute';
}

class EditProfileRouteArgs {
  const EditProfileRouteArgs({this.key, required this.retailer});

  final _i2.Key? key;

  final _i17.Retailer retailer;
}

class EditProductRoute extends _i1.PageRouteInfo<EditProductRouteArgs> {
  EditProductRoute({_i2.Key? key, required _i18.Product product})
      : super(name,
            path: '/edit-product-page',
            args: EditProductRouteArgs(key: key, product: product));

  static const String name = 'EditProductRoute';
}

class EditProductRouteArgs {
  const EditProductRouteArgs({this.key, required this.product});

  final _i2.Key? key;

  final _i18.Product product;
}

class ConsumerProductListRoute
    extends _i1.PageRouteInfo<ConsumerProductListRouteArgs> {
  ConsumerProductListRoute({required _i17.Retailer retailerData, _i2.Key? key})
      : super(name,
            path: '/consumer-product-list-page',
            args: ConsumerProductListRouteArgs(
                retailerData: retailerData, key: key));

  static const String name = 'ConsumerProductListRoute';
}

class ConsumerProductListRouteArgs {
  const ConsumerProductListRouteArgs({required this.retailerData, this.key});

  final _i17.Retailer retailerData;

  final _i2.Key? key;
}

class ConsumerRetailerDetailRoute
    extends _i1.PageRouteInfo<ConsumerRetailerDetailRouteArgs> {
  ConsumerRetailerDetailRoute(
      {required _i17.Retailer retailerData, _i2.Key? key})
      : super(name,
            path: '/consumer-retailer-detail-page',
            args: ConsumerRetailerDetailRouteArgs(
                retailerData: retailerData, key: key));

  static const String name = 'ConsumerRetailerDetailRoute';
}

class ConsumerRetailerDetailRouteArgs {
  const ConsumerRetailerDetailRouteArgs({required this.retailerData, this.key});

  final _i17.Retailer retailerData;

  final _i2.Key? key;
}
