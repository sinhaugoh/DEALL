import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deall/core/infrastructure/product_dto.dart';

class ProductListRemoteService {
  final FirebaseFirestore _firestore;

  ProductListRemoteService(this._firestore);

  Future<List<ProductDTO>> getProductList(String uid) async {
    //check uid and match the retailer collection doc id
    final QuerySnapshot<Map<String, dynamic>> querySnapshot = await _firestore
        .collection('retailers')
        .doc(uid)
        .collection("products")
        .get();
    return querySnapshot.docs
        .map((doc) => ProductDTO.fromJson(doc.data()))
        .toList();
  }
}

// think if theres a need for another firestore failure such as no product found, isit no object found error or something else