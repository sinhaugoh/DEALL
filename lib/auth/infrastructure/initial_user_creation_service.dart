import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deall/core/infrastructure/retailer/retailer_dto.dart';

class InitialUserCreationService {
  final FirebaseFirestore _firestore;

  InitialUserCreationService(
    this._firestore,
  );

  Future<void> createConsumer(String id) {
    return _firestore.collection('consumers').doc(id).set({
      'favourites': <String>[],
    });
  }

  Future<void> createRetailer(String id, RetailerDTO retailerDTO) {
    return _firestore.collection('retailers').doc(id).set(retailerDTO.toJson());
  }
}
