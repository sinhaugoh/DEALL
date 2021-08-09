import 'package:dartz/dartz.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

import 'package:deall/core/application/product/product.dart';
import 'package:deall/core/infrastructure/product/product_dto.dart';
import 'package:deall/core/infrastructure/firestore_failures.dart';
import 'package:deall/retailer/infrastructure/product_remote_service.dart';

class ProductListRepository {
  final ProductListRemoteService _productRemoteService;
  final FirebaseFirestore _firestore;

  ProductListRepository(this._productRemoteService, this._firestore);

  Stream<Either<FirestoreFailures, List<Product>>> getProductStream() async* {
    yield* _productRemoteService.getProductStream().map((list) =>
        right<FirestoreFailures, List<Product>>(list.map((productDTO) => productDTO.toDomain()).toList()))
    .onErrorReturnWith((error, _) {
      if(error is FirebaseException && error.code == 'not_found') {
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
}
