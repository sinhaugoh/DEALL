import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deall/core/infrastructure/product_dto.dart';

class ProductListRemoteService{
  final FirebaseFirestore _firestore;
  
  ProductListRemoteService(this._firestore);

  Future<List<ProductDTO>> getProductList() async {
    //check uid and match the retailer collection doc id
    return <ProductDTO>[];
  }
}