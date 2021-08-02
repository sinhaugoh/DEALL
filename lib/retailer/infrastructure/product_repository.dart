import 'package:dartz/dartz.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:deall/core/application/product/product.dart';
import 'package:deall/core/infrastructure/product/product_dto.dart';
import 'package:deall/core/infrastructure/firestore_failures.dart';
import 'package:deall/retailer/infrastructure/product_remote_service.dart';

class ProductListRepository {
  final ProductListRemoteService _productRemoteService;

  ProductListRepository(this._productRemoteService);

  Future<Either<FirestoreFailures, List<Product>>> getProductList(String uid) async {
    try {
      final productDTOList = await _productRemoteService.getProductList(uid);
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

  Future<Either<FirestoreFailures, void>> addProduct(Product newProduct) async{
    try{
      final newProductDTO = ProductDTO.fromDomain(newProduct);
      await _productRemoteService.addProduct(newProductDTO);
      return right(null);
    }
    on FirebaseException catch(e) {
      if(e.code == 
      FirebaseException(
                  code: 'cancelled', plugin: "The operation was cancelled.")
              .code) {
        return left(const FirestoreFailures.cancelledOperation());
      }
      return left(const FirestoreFailures.unknown());
    }
  }
}
