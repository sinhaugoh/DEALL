import 'package:dartz/dartz.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:deall/consumer/infrastructure/firestore_failures.dart';
import 'package:deall/core/application/retailer.dart';
import 'retailer_list_remote_service.dart';

class RetailerListRepository {
  final RetailerListRemoteService _retailerRemoteService;

  RetailerListRepository(this._retailerRemoteService);

  Future<Either<FirestoreFailures, List<Retailer>>> getRetailerList() async {
    try {
      final retailerDTOList = await _retailerRemoteService.getRetailerList();
      return right(retailerDTOList
          .map((retailerDTO) => retailerDTO.toDomain())
          .toList());
    } on FirebaseException catch (e) {
      if (e.code == 'ERROR_CANCELED') {
        return left(const FirestoreFailures.cancelledOperation());
      }
      if (e.code == 'ERROR_OBJECT_NOT_FOUND') {
        return left(const FirestoreFailures.objectNotFound());
      }
      return left(const FirestoreFailures.unknown());
    }
  }
}
