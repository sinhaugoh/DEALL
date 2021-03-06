// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deall/core/infrastructure/product/product_dto.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProductRemoteService {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseAuth;

  ProductRemoteService(this._firestore, this._firebaseAuth);

  Future<List<ProductDTO>> getProductList(String retailerId) async {
    return _firestore
        .collection('retailers')
        .doc(retailerId)
        .collection('products')
        .where('availability', isEqualTo: true)
        .get()
        .then((querySnapshot) => querySnapshot.docs
            .map((queryDocSnapshot) =>
                ProductDTO.fromJson(queryDocSnapshot.data()))
            .toList());
  }

  Stream<List<ProductDTO>> getProductStream() async* {
    final userId = _firebaseAuth.currentUser!.uid;
    yield* _firestore
        .collection('retailers')
        .doc(userId)
        .collection('products')
        .orderBy('name')
        .snapshots()
        .map(
          (querySnap) => querySnap.docs
              .map((documentSnap) => ProductDTO.fromJson(documentSnap.data()))
              .toList(),
        );
  }

  Future<void> addProduct(ProductDTO newProduct, String uid) async {
    await _firestore
        .collection('retailers')
        .doc(uid)
        .collection("products")
        .doc(newProduct.id)
        .set(newProduct.toJson());
  }

  Future<void> updateProduct(ProductDTO productDTO) async {
    final userId = _firebaseAuth.currentUser!.uid;
    final productId = productDTO.id;

    await _firestore
        .collection('retailers')
        .doc(userId)
        .collection('products')
        .doc(productId)
        .update(productDTO.toJson());
  }

  Future<void> deleteProduct(ProductDTO productDTO) async {
    final userId = _firebaseAuth.currentUser!.uid;
    return _firestore
        .collection('retailers')
        .doc(userId)
        .collection('products')
        .doc(productDTO.id)
        .delete();
  }

  Future<void> updateProductList(List<ProductDTO> productList) async {
    final userId = _firebaseAuth.currentUser!.uid;
    final batch = _firestore.batch();

    for (final product in productList) {
      final documentRef = _firestore
          .collection('retailers')
          .doc(userId)
          .collection('products')
          .doc(product.id);
      batch.update(documentRef, product.toJson());
    }

    return batch.commit();
  }

  String generateNewProductId(String uid) {
    final ref = _firestore
        .collection('retailers')
        .doc(uid)
        .collection('products')
        .doc();
    return ref.id;
  }
}
