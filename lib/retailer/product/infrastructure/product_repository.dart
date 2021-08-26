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
  final ProductRemoteService _productRemoteService;
  final InternetConnectionChecker _internetConnectionChecker;

  ProductRepository(
      this._productRemoteService, this._internetConnectionChecker);

  /// Get List\<Product> for retailer with the provided [retailerId].
  /// 
  /// If device has no internet connection, [FirestoreFailures.noConnection()] will be returned.
  /// 
  /// If no product list data is found, [FirebaseException] will be thrown and 
  /// [FirestoreFailures.objectNotFound()] will be returned.
  /// 
  /// If other errors are found, [FirebaseException] will be thrown and
  /// [FirestoreFailures.unknown()] will be returned.
  Future<Either<FirestoreFailures, List<Product>>> getProductList(
      String retailerId) async {
    try {
      if(! await _internetConnectionChecker.hasConnection) {
      return left(const FirestoreFailures.noConnection());
    }
      return _productRemoteService.getProductList(retailerId).then((list) =>
          right<FirestoreFailures, List<Product>>(
              list.map((productDTO) => productDTO.toDomain()).toList()));
    } on FirebaseException catch (e) {
      if (e.code ==
          FirebaseException(code: 'not-found', plugin: "No object found.")
              .code) {
        return left(const FirestoreFailures.objectNotFound());
      }
      return left(const FirestoreFailures.unknown());
    }
  }

  /// Get List\<Product> for current retailer user.
  /// 
  /// If no product list data is found, [FirebaseException] will be thrown and 
  /// [FirestoreFailures.objectNotFound()] will be returned.
  /// 
  /// If other errors are found, [FirebaseException] will be thrown and
  /// [FirestoreFailures.unknown()] will be returned.
  Stream<Either<FirestoreFailures, List<Product>>> getProductStream() async* {
    yield* _productRemoteService
        .getProductStream()
        .map((list) => right<FirestoreFailures, List<Product>>(
            list.map((productDTO) => productDTO.toDomain()).toList()))
        .onErrorReturnWith((error, _) {
      if (error is FirebaseException && error.code == 'not-found') {
        return left(const FirestoreFailures.objectNotFound());
      } else {
        return left(const FirestoreFailures.unknown());
      }
    });
  }

  /// Returns the newly generated product doc id.
  String generateNewProductId(String uid) {
    return _productRemoteService.generateNewProductId(uid);
  }

  /// Adds [newProduct] to doc with an id of [uid] 
  /// 
  /// If device has no internet connection, [FirestoreFailures.noConnection()] will be returned.
  /// 
  /// If user cancels the operation before it is completed, [FirebaseException] will be thrown and 
  /// [FirestoreFailures.cancelledOperation()] will be returned.
  /// 
  /// If other errors are found, [FirebaseException] will be thrown and
  /// [FirestoreFailures.unknown()] will be returned.
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

  /// Updates product info by passing updateProduct function to _handleException()
  /// with the [product] data provided.
  /// 
  /// Ultimately returns the result of the operation.
  Future<Either<FirestoreFailures, Unit>> updateProduct(Product product) async {
    return _handleException(
      () => _productRemoteService.updateProduct(ProductDTO.fromDomain(product)),
    );
  }

  /// Delete the provided [product] info by passing deleteProduct function to _handleException().
  /// 
  /// Ultimately returns the result of the operation.
  Future<Either<FirestoreFailures, Unit>> deleteProduct(Product product) async {
    return _handleException(
      () => _productRemoteService.deleteProduct(ProductDTO.fromDomain(product)),
    );
  }

  /// Updates the provided [List\<Product>] info by passing updateProductList function to 
  /// _handleException(). 
  /// 
  /// Ultimately returns the result of the operation.
  Future<Either<FirestoreFailures, Unit>> updateProductList(
      List<Product> productList) async {
    return _handleException(
      () => _productRemoteService.updateProductList(productList
          .map((product) => ProductDTO.fromDomain(product))
          .toList()),
    );
  }

  /// Performs the [action] function and returns [FirestoreFailures] if any exceptions were caught.
  ///
  /// If device has no internet connection, [FirestoreFailures.noConnection()] will be returned.
  /// 
  /// If no object data is found, [FirebaseException] will be thrown and 
  /// [FirestoreFailures.objectNotFound()] will be returned.
  /// 
  /// If other errors are found, [FirebaseException] will be thrown and
  /// [FirestoreFailures.unknown()] will be returned.
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
