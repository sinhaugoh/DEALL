import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deall/core/infrastructure/product/product_dto.dart';

class ProductListRemoteService {
  final FirebaseFirestore _firestore;

  ProductListRemoteService(this._firestore);

  Future<List<ProductDTO>> getProductList(String uid) async {
    final QuerySnapshot<Map<String, dynamic>> querySnapshot = await _firestore
        .collection('retailers')
        .doc(uid)
        .collection("products")
        .get();
    return querySnapshot.docs
        .map((doc) => ProductDTO.fromJson(doc.data()))
        .toList();
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