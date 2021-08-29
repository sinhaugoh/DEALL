import 'package:dartz/dartz.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:deall/core/infrastructure/firestore_failures.dart';
import 'package:deall/core/application/retailer/retailer.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'retailer_list_remote_service.dart';

class RetailerListRepository {
  final RetailerListRemoteService _retailerListRemoteService;
  final InternetConnectionChecker _internetConnectionChecker;

  RetailerListRepository(this._retailerListRemoteService, this._internetConnectionChecker);

  /// get the entire list of [Retailer] from remote service
  /// 
  /// return a list of [Retailer] if successful
  /// 
  /// return [FirestoreFailures.cancelledOperation] if operation cancelled
  /// 
  /// return [FirestoreFailures.objectNotFound] if database cannot find specific document
  /// 
  /// return [FirestoreFailures.unknown] if unknown database exception thrown
  Future<Either<FirestoreFailures, List<Retailer>>> getRetailerList() async {
    if(! await _internetConnectionChecker.hasConnection) {
      return left(const FirestoreFailures.noConnection());
    }

    try {
      final retailerDTOList = await _retailerListRemoteService.getRetailerList();
      return right(retailerDTOList
          .map((retailerDTO) => retailerDTO.toDomain())
          .toList());
    } on FirebaseException catch (e) {
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
