import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deall/core/infrastructure/retailer/retailer_dto.dart';

class FavouriteRetailerRemoteService {
  final FirebaseFirestore _firebaseFirestore;

  FavouriteRetailerRemoteService(this._firebaseFirestore);

  Future<List<RetailerDTO>> getFavouriteRetailers(String userId) async {
    final documentSnap =
        await _firebaseFirestore.collection('consumers').doc(userId).get();
    final data = documentSnap.data();
    final retailerList = <RetailerDTO>[];

    if (data != null) {
      final retailerIdList = (data['favourites'] as List)
          .map((retailerId) => retailerId as String);

      for (final retailerId in retailerIdList) {
        final retailerDoc = await _firebaseFirestore
            .collection('retailers')
            .doc(retailerId)
            .get();

        final json = retailerDoc.data()!;
        json['id'] = retailerDoc.id;
        retailerList.add(RetailerDTO.fromJson(json));
      }
    }

    return retailerList;
  }

  Future<void> updateFavouriteRetailerList({
    required List<String> retailerIdList,
    required String userId,
  }) {
    return _firebaseFirestore.collection('consumers').doc(userId).update({
      'favourites': retailerIdList,
    });
  }
}
