import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:deall/consumer/home/infrastructure/firestore_failure.dart';
import 'package:deall/consumer/home/infrastructure/retailer_list_remote_service.dart';
import 'package:deall/core/application/retailer.dart';

class RetailerListRepository {
  final RetailerListRemoteService _remoteService;

  RetailerListRepository(this._remoteService);

  Future<Either<FirestoreFailure, List<Retailer>>> getRetailerList() async {
    try {
      final retailerDTOList = await _remoteService.getRetailerList();

      return right(retailerDTOList
          .map((retailerDTO) => retailerDTO.toDomain())
          .toList());
    }
     on FirebaseException catch (e) {
      if(e.code == 'no-connedction') {
        return left(const FirestoreFailure.noConnection());
      } else {
        return left(const FirestoreFailure.unknown());
      }
    }
  }
}
