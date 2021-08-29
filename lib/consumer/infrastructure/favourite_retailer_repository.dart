import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:deall/auth/infrastructure/auth_repository.dart';
import 'package:deall/consumer/infrastructure/favourite_retailer_remote_service.dart';
import 'package:deall/core/application/retailer/retailer.dart';
import 'package:deall/core/infrastructure/firestore_failures.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class FavouriteRetailerRepository {
  final FavouriteRetailerRemoteService _favouriteListRemoteService;
  final AuthRepository _authRepository;
  final InternetConnectionChecker _internetConnectionChecker;

  FavouriteRetailerRepository(this._favouriteListRemoteService,
      this._authRepository, this._internetConnectionChecker);

  /// get the list of favourite [Retailer] from remote service
  /// 
  /// return a list of favourite [Retailer] if successful
  /// 
  /// return [FirestoreFailures.objectNotFound] if database cannot find specific document
  /// 
  /// return [FirestoreFailures.unknown] if unknown database exception thrown
  Future<Either<FirestoreFailures, List<Retailer>>>
      getFavouriteRetailers() async {
    if (!await _internetConnectionChecker.hasConnection) {
      return const Left(FirestoreFailures.noConnection());
    }

    try {
      final retailerDTOList = await _favouriteListRemoteService
          .getFavouriteRetailers(_authRepository.getUserId());

      return right(
        retailerDTOList.map((retailerDTO) => retailerDTO.toDomain()).toList(),
      );
    } on FirebaseException catch (e) {
      if (e.code == 'not-found') {
        return left(const FirestoreFailures.objectNotFound());
      } else {
        return left(const FirestoreFailures.unknown());
      }
    }
  }

  /// update the list of [Retailer] to database
  /// 
  /// return [unit] if successful
  /// 
  /// return [FirestoreFailures.objectNotFound] if database cannot find specific document
  /// to update
  /// 
  /// return [FirestoreFailures.unknown] if unknown database exception thrown
  Future<Either<FirestoreFailures, Unit>> updateFavouriteRetailerList(
      List<Retailer> retailerList) async {
    if (!await _internetConnectionChecker.hasConnection) {
      return const Left(FirestoreFailures.noConnection());
    }
    final retailerIdList = retailerList.map((retailer) => retailer.id).toList();

    try {
      await _favouriteListRemoteService.updateFavouriteRetailerList(
        retailerIdList: retailerIdList,
        userId: _authRepository.getUserId(),
      );
      return right(unit);
    } on FirebaseException catch (e) {
      if (e.code == 'not-found') {
        return left(const FirestoreFailures.objectNotFound());
      } else {
        return left(const FirestoreFailures.unknown());
      }
    }
  }
}
