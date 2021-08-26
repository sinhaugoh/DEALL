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

  /// Get [Retailer] data of current user
  /// 
  /// If device has no internet connection, [RetailerFailure.noConnection()] will be returned.
  /// 
  /// If user is not authenticated, [FirebaseAuthException] will be thrown and
  /// [RetailerFailure.authentication(errorMessage)] will be returned.
  /// 
  /// If no retailer data is found, [FirebaseException] will be thrown and 
  /// [RetailerFailure.notFound()] will be returned.
  /// 
  /// If other errors are found, [FirebaseException] will be thrown and
  /// [RetailerFailure.unexpected(errorMessage)] will be returned.
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

  /// Updates retailer data with the provided [retailer] data
  /// 
  /// If device has no internet connection, [RetailerFailure.noConnection()] will be returned.
  /// 
  /// If user is not authenticated, [FirebaseAuthException] will be thrown and
  /// [RetailerFailure.authentication(errorMessage)] will be returned.
  /// 
  /// If no existing retailer with the provided id is found, [FirebaseException] will be thrown  
  /// and [RetailerFailure.notFound()] will be returned.
  /// 
  /// If other errors are found, [FirebaseException] will be thrown and
  /// [RetailerFailure.unexpected(errorMessage)] will be returned.
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
