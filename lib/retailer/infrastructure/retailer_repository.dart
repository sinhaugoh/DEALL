import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:deall/core/application/retailer/retailer.dart';
import 'package:deall/core/infrastructure/retailer/retailer_dto.dart';
import 'package:deall/retailer/application/retailer_failure.dart';
import 'package:deall/retailer/infrastructure/retailer_remote_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class RetailerRepository {
  final RetailerRemoteService _retailerRemoteService;
  final InternetConnectionChecker _internetConnectionChecker;

  RetailerRepository(
      this._retailerRemoteService, this._internetConnectionChecker);

  Future<Either<RetailerFailure, Retailer>> getRetailer() async {
    if(! await _internetConnectionChecker.hasConnection) {
      return left(const RetailerFailure.noConnection());
    }

    try {
      final retailerDTO = await _retailerRemoteService.getRetailer();
      return right(retailerDTO.toDomain());
    } on FirebaseAuthException catch (e) {
      return left(RetailerFailure.authentication('${e.code}: ${e.message}'));
    } on FirebaseException catch (e) {
      if (e.code == 'not-found') {
        return left(const RetailerFailure.notFound());
      } else {
        return left(RetailerFailure.unexpected('${e.code}: ${e.message}'));
      }
    }
  }

  Future<Either<RetailerFailure, Unit>> updateRetailer(
      Retailer retailer) async {
    if (!await _internetConnectionChecker.hasConnection) {
      return left(const RetailerFailure.noConnection());
    }
    try {
      await _retailerRemoteService
          .updateRetailer(RetailerDTO.fromDomain(retailer));
      return right(unit);
    } on FirebaseAuthException catch (e) {
      return left(RetailerFailure.authentication('${e.code}: ${e.message}'));
    } on FirebaseException catch (e) {
      if (e.code == 'not-found') {
        return left(const RetailerFailure.notFound());
      } else {
        return left(RetailerFailure.unexpected('${e.code}: ${e.message}'));
      }
    }
  }
}
