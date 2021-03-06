// Mocks generated by Mockito 5.0.12 from annotations
// in deall/test/consumer/application/favourite_retailer_notifier_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:deall/consumer/infrastructure/favourite_retailer_repository.dart'
    as _i3;
import 'package:deall/core/application/retailer/retailer.dart' as _i6;
import 'package:deall/core/infrastructure/firestore_failures.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeEither<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

/// A class which mocks [FavouriteRetailerRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockFavouriteRetailerRepository extends _i1.Mock
    implements _i3.FavouriteRetailerRepository {
  MockFavouriteRetailerRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.FirestoreFailures, List<_i6.Retailer>>>
      getFavouriteRetailers() => (super.noSuchMethod(
          Invocation.method(#getFavouriteRetailers, []),
          returnValue: Future<
                  _i2.Either<_i5.FirestoreFailures, List<_i6.Retailer>>>.value(
              _FakeEither<_i5.FirestoreFailures, List<_i6.Retailer>>())) as _i4
          .Future<_i2.Either<_i5.FirestoreFailures, List<_i6.Retailer>>>);
  @override
  _i4.Future<_i2.Either<_i5.FirestoreFailures, _i2.Unit>>
      updateFavouriteRetailerList(List<_i6.Retailer>? retailerList) =>
          (super.noSuchMethod(
              Invocation.method(#updateFavouriteRetailerList, [retailerList]),
              returnValue:
                  Future<_i2.Either<_i5.FirestoreFailures, _i2.Unit>>.value(
                      _FakeEither<_i5.FirestoreFailures, _i2.Unit>())) as _i4
              .Future<_i2.Either<_i5.FirestoreFailures, _i2.Unit>>);
}
