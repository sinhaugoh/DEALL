import 'package:dartz/dartz.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deall/retailer/product/infrastructure/product_remote_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:rxdart/rxdart.dart';

import 'package:deall/core/application/product/product.dart';
import 'package:deall/core/infrastructure/product/product_dto.dart';
import 'package:deall/core/infrastructure/firestore_failures.dart';

class ProductRepository {
  final ProductListRemoteService _productRemoteService;
  final InternetConnectionChecker _internetConnectionChecker;

  ProductRepository(
      this._productRemoteService, this._internetConnectionChecker);

  Stream<Either<FirestoreFailures, List<Product>>> getProductStream() async* {
    yield* _productRemoteService
        .getProductStream()
        .map((list) => right<FirestoreFailures, List<Product>>(
            list.map((productDTO) => productDTO.toDomain()).toList()))
        .onErrorReturnWith((error, _) {
      if (error is FirebaseException && error.code == 'not_found') {
        return left(const FirestoreFailures.objectNotFound());
      } else {
        return left(const FirestoreFailures.unknown());
      }
    });
  }

  String generateNewProductId(String uid) {
    return _productRemoteService.generateNewProductId(uid);
  }

  Future<Either<FirestoreFailures, void>> addProduct(
      Product newProduct, String uid) async {
    if (!await _internetConnectionChecker.hasConnection) {
      return left(const FirestoreFailures.noConnection());
    }
    try {
      final newProductDTO = ProductDTO.fromDomain(newProduct);
      await _productRemoteService.addProduct(newProductDTO, uid);
      return right(null);
    } on FirebaseException catch (e) {
      if (e.code ==
          FirebaseException(
                  code: 'cancelled', plugin: "The operation was cancelled.")
              .code) {
        return left(const FirestoreFailures.cancelledOperation());
      }
      return left(const FirestoreFailures.unknown());
    }
  }

  Future<Either<FirestoreFailures, Unit>> updateProduct(Product product) async {
    return _handleException(
      () => _productRemoteService.updateProduct(ProductDTO.fromDomain(product)),
    );
  }

  Future<Either<FirestoreFailures, Unit>> deleteProduct(Product product) async {
    return _handleException(
      () => _productRemoteService.deleteProduct(ProductDTO.fromDomain(product)),
    );
  }

  Future<Either<FirestoreFailures, Unit>> _handleException(
      Future<void> Function() action) async {
    if (!await _internetConnectionChecker.hasConnection) {
      return left(const FirestoreFailures.noConnection());
    }

    try {
      await action();
      return right(unit);
    } on FirebaseException catch (e) {
      if (e.code == 'not-found') {
        return left(const FirestoreFailures.objectNotFound());
      } else {
        return left(const FirestoreFailures.unknown());
      }
    }
  }
}
