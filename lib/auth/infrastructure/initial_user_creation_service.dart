import 'package:cloud_firestore/cloud_firestore.dart';

class InitialUserCreationService {
  final FirebaseFirestore _firestore;

  InitialUserCreationService(
    this._firestore,
  );

  Future<void> createConsumer(String id) {
    return _firestore
        .collection('consumers')
        .doc(id)
        .set({
      'favourites': <String>[],
    });
  }
}
