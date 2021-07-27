import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deall/core/infrastructure/retailer_dto.dart';

class RetailerListRemoteService {
  final FirebaseFirestore _firestore;

  RetailerListRemoteService(this._firestore);
  
  Future<List<RetailerDTO>> getRetailerList() async {
    //do something here, then u will get a list of json from firestore
    // convert them into a list of retailerDTO and return
    return <RetailerDTO>[];
  }
}