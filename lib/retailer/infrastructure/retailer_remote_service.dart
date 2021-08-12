import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deall/core/infrastructure/retailer/retailer_dto.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RetailerRemoteService {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth;

  RetailerRemoteService(this._firebaseFirestore, this._firebaseAuth);

  Future<RetailerDTO> getRetailer() async {
    final userId = _firebaseAuth.currentUser!.uid;
    final documentSnapshot =
        await _firebaseFirestore.collection('retailers').doc(userId).get();
    return RetailerDTO.fromJson(documentSnapshot.data()!);
  }

  Future<void> updateRetailer(RetailerDTO retailerDTO) async {
    final userId = _firebaseAuth.currentUser!.uid;
    _firebaseFirestore
        .collection('retailers')
        .doc(userId)
        .update(retailerDTO.toJson());
  }
}
