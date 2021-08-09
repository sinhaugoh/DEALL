import 'package:dartz/dartz.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:deall/core/application/product/product.dart';
import 'package:deall/core/infrastructure/product/product_dto.dart';
import 'package:deall/core/infrastructure/firestore_failures.dart';
import 'package:deall/retailer/infrastructure/product_remote_service.dart';

class ProductListRepository {
  final ProductListRemoteService _productRemoteService;
  final FirebaseFirestore _firestore;

  ProductListRepository(this._productRemoteService, this._firestore);

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
      return left(const FirestoreFailures.unknown());
    }
  }

  String generateNewProductId(String uid){
    final ref = _firestore.collection('retailers').doc(uid).collection('products').doc();
    return ref.id;
  }

  Future<Either<FirestoreFailures, void>> addProduct(Product newProduct, String uid) async{
    try{
      final newProductDTO = ProductDTO.fromDomain(newProduct);
      await _productRemoteService.addProduct(newProductDTO, uid);
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
