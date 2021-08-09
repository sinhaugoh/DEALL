import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deall/core/infrastructure/product/product_dto.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProductListRemoteService {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseAuth;

  ProductListRemoteService(this._firestore, this._firebaseAuth);

  Stream<List<ProductDTO>> getProductStream() async* {
    final userId = _firebaseAuth.currentUser!.uid;
    yield* _firestore
        .collection('retailers')
        .doc(userId)
        .collection('products')
        .orderBy('dateModified', descending: true)
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
}
