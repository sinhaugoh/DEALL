// Mocks generated by Mockito 5.0.12 from annotations
// in deall/test/retailer/product/infrastructure/product_repository_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:deall/core/infrastructure/product/product_dto.dart' as _i5;
import 'package:deall/retailer/product/infrastructure/product_remote_service.dart'
    as _i3;
import 'package:firebase_auth/firebase_auth.dart' as _i6;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeDuration extends _i1.Fake implements Duration {}

class _FakeAddressCheckResult extends _i1.Fake
    implements _i2.AddressCheckResult {}

/// A class which mocks [ProductRemoteService].
///
/// See the documentation for Mockito's code generation for more information.
class MockProductRemoteService extends _i1.Mock
    implements _i3.ProductRemoteService {
  MockProductRemoteService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<List<_i5.ProductDTO>> getProductList(String? retailerId) =>
      (super.noSuchMethod(Invocation.method(#getProductList, [retailerId]),
              returnValue:
                  Future<List<_i5.ProductDTO>>.value(<_i5.ProductDTO>[]))
          as _i4.Future<List<_i5.ProductDTO>>);
  @override
  _i4.Stream<List<_i5.ProductDTO>> getProductStream() =>
      (super.noSuchMethod(Invocation.method(#getProductStream, []),
              returnValue: Stream<List<_i5.ProductDTO>>.empty())
          as _i4.Stream<List<_i5.ProductDTO>>);
  @override
  _i4.Future<void> addProduct(_i5.ProductDTO? newProduct, String? uid) =>
      (super.noSuchMethod(Invocation.method(#addProduct, [newProduct, uid]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  _i4.Future<void> updateProduct(_i5.ProductDTO? productDTO) =>
      (super.noSuchMethod(Invocation.method(#updateProduct, [productDTO]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  _i4.Future<void> deleteProduct(_i5.ProductDTO? productDTO) =>
      (super.noSuchMethod(Invocation.method(#deleteProduct, [productDTO]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  _i4.Future<void> updateProductList(List<_i5.ProductDTO>? productList) =>
      (super.noSuchMethod(Invocation.method(#updateProductList, [productList]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i4.Future<void>);
  @override
  String generateNewProductId(String? uid) =>
      (super.noSuchMethod(Invocation.method(#generateNewProductId, [uid]),
          returnValue: '') as String);
}

/// A class which mocks [InternetConnectionChecker].
///
/// See the documentation for Mockito's code generation for more information.
class MockInternetConnectionChecker extends _i1.Mock
    implements _i2.InternetConnectionChecker {
  MockInternetConnectionChecker() {
    _i1.throwOnMissingStub(this);
  }

  @override
  List<_i2.AddressCheckOptions> get addresses =>
      (super.noSuchMethod(Invocation.getter(#addresses),
              returnValue: <_i2.AddressCheckOptions>[])
          as List<_i2.AddressCheckOptions>);
  @override
  set addresses(List<_i2.AddressCheckOptions>? _addresses) =>
      super.noSuchMethod(Invocation.setter(#addresses, _addresses),
          returnValueForMissingStub: null);
  @override
  Duration get checkInterval =>
      (super.noSuchMethod(Invocation.getter(#checkInterval),
          returnValue: _FakeDuration()) as Duration);
  @override
  set checkInterval(Duration? _checkInterval) =>
      super.noSuchMethod(Invocation.setter(#checkInterval, _checkInterval),
          returnValueForMissingStub: null);
  @override
  _i4.Future<bool> get hasConnection =>
      (super.noSuchMethod(Invocation.getter(#hasConnection),
          returnValue: Future<bool>.value(false)) as _i4.Future<bool>);
  @override
  _i4.Future<_i2.InternetConnectionStatus> get connectionStatus =>
      (super.noSuchMethod(Invocation.getter(#connectionStatus),
              returnValue: Future<_i2.InternetConnectionStatus>.value(
                  _i2.InternetConnectionStatus.connected))
          as _i4.Future<_i2.InternetConnectionStatus>);
  @override
  _i4.Stream<_i2.InternetConnectionStatus> get onStatusChange =>
      (super.noSuchMethod(Invocation.getter(#onStatusChange),
              returnValue: Stream<_i2.InternetConnectionStatus>.empty())
          as _i4.Stream<_i2.InternetConnectionStatus>);
  @override
  bool get hasListeners =>
      (super.noSuchMethod(Invocation.getter(#hasListeners), returnValue: false)
          as bool);
  @override
  bool get isActivelyChecking =>
      (super.noSuchMethod(Invocation.getter(#isActivelyChecking),
          returnValue: false) as bool);
  @override
  _i4.Future<_i2.AddressCheckResult> isHostReachable(
          _i2.AddressCheckOptions? options) =>
      (super.noSuchMethod(Invocation.method(#isHostReachable, [options]),
              returnValue: Future<_i2.AddressCheckResult>.value(
                  _FakeAddressCheckResult()))
          as _i4.Future<_i2.AddressCheckResult>);
}

/// A class which mocks [FirebaseException].
///
/// See the documentation for Mockito's code generation for more information.
// ignore: must_be_immutable
class MockFirebaseException extends _i1.Mock implements _i6.FirebaseException {
  MockFirebaseException() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get plugin =>
      (super.noSuchMethod(Invocation.getter(#plugin), returnValue: '')
          as String);
  @override
  String get code =>
      (super.noSuchMethod(Invocation.getter(#code), returnValue: '') as String);
  @override
  String toString() => super.toString();
}