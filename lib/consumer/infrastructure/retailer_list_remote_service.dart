import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deall/core/infrastructure/retailer/retailer_dto.dart';

class RetailerListRemoteService {
  final FirebaseFirestore _firestore;

  RetailerListRemoteService(this._firestore);

  Future<List<RetailerDTO>> getRetailerList() async {
    final QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await _firestore.collection('retailers').get();
    return querySnapshot.docs
        .map((doc) => RetailerDTO.fromJson(doc.data()))
        .toList();
  }
}
