import 'package:dartz/dartz.dart';
import 'package:deall/consumer/home/infrastructure/retailer_list_remote_service.dart';
import 'package:deall/core/application/retailer.dart';

class RetailerListRepository {
  final RetailerListRemoteService _remoteService;

  RetailerListRepository(this._remoteService);

  //chg unit to failure
  Future<Either<Unit, List<Retailer>>> getRetailerList() async {
    try {
      final retailerDTOList = await _remoteService.getRetailerList();

      return right(retailerDTOList
          .map((retailerDTO) => retailerDTO.toDomain())
          .toList());
    } catch (e) {
      return left(unit);
    }
  }
}
