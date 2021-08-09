import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deall/core/infrastructure/retailer_dto.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RetailerRemoteService {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth;

  RetailerRemoteService(this._firebaseFirestore, this._firebaseAuth);

  // Stream<RetailerDTO> getRetailerStream() async* {
  //   final userId = _firebaseAuth.currentUser!.uid;
  //   final documentSnapshotStream =
  //        _firebaseFirestore.collection('retailers').doc(userId).snapshots();
  //   yield* documentSnapshotStream.map((snap) => RetailerDTO.fromJson(snap.data()!));
  //   // yeild RetailerDTO.fromJson(documentSnapshot.data()!);
  // }

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
