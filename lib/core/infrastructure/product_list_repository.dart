import 'package:dartz/dartz.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:deall/core/application/product.dart';
import 'package:deall/core/infrastructure/product_remote_service.dart';
import 'package:deall/consumer/infrastructure/firestore_failures.dart';

class ProductListRepository {
  final ProductListRemoteService _productListRemoteService;

  ProductListRepository(this._productListRemoteService);

  Future<Either<FirestoreFailures, List<Product>>> getProductList(String uid) async {
    try {
      final productDTOList = await _productListRemoteService.getProductList(uid);
      return right(
          productDTOList.map((productDTO) => productDTO.toDomain()).toList());
    } on FirebaseException catch (e) {
      // TODO: check connectivity
      if (e.code ==
          FirebaseException(
                  code: 'cancelled', plugin: "The operation was cancelled.")
              .code) {
        return left(const FirestoreFailures.cancelledOperation());
      }
      if (e.code ==
          FirebaseException(
                  code: 'not-found',
                  plugin: "Some requested document was not found.")
              .code) {
        return left(const FirestoreFailures.objectNotFound());
      }
      return left(const FirestoreFailures.unknown());
    }
  }
}
