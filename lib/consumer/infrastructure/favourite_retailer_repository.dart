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
}
