import 'package:dartz/dartz.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:deall/consumer/infrastructure/firestore_failures.dart';
import 'package:deall/core/application/retailer.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'retailer_list_remote_service.dart';

class RetailerListRepository {
  final RetailerListRemoteService _retailerListRemoteService;

  RetailerListRepository(this._retailerListRemoteService);

  Future<Either<FirestoreFailures, List<Retailer>>> getRetailerList() async {
    try {
      final retailerDTOList = await _retailerListRemoteService.getRetailerList();
      return right(retailerDTOList
          .map((retailerDTO) => retailerDTO.toDomain())
          .toList());
    } on FirebaseException catch (e) {
      if(!await InternetConnectionChecker().hasConnection){
        return left(const FirestoreFailures.noConnection());
      }
      if (e.code == FirebaseException(code: 'cancelled', plugin: "The operation was cancelled.").code) {
        return left(const FirestoreFailures.cancelledOperation());
      }
      if (e.code == FirebaseException(code: 'not-found', plugin: "Some requested document was not found.").code) {
        return left(const FirestoreFailures.objectNotFound());
      }
      return left(const FirestoreFailures.unknown());
    }
  }
}
