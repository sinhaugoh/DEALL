import 'package:deall/consumer/favourite_retailers/infrastructure/favourite_retailer_repository.dart';
import 'package:deall/core/infrastructure/firestore_failures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:deall/core/application/retailer/retailer.dart';

part 'favourite_retailer_notifier.freezed.dart';

@freezed
class FavouriteRetailerState with _$FavouriteRetailerState {
  const FavouriteRetailerState._();
  const factory FavouriteRetailerState.initial() = Initial;
  const factory FavouriteRetailerState.loading() = Loading;
  const factory FavouriteRetailerState.loaded(List<Retailer> retailerList) =
      Loaded;
  const factory FavouriteRetailerState.failure(FirestoreFailures failure) =
      Failure;
}

class FavouriteRetailerNotifier extends StateNotifier<FavouriteRetailerState> {
  final FavouriteRetailerRepository _favouriteListRepository;
  FavouriteRetailerNotifier(this._favouriteListRepository)
      : super(const FavouriteRetailerState.initial());

  Future<void> getRetailerList() async {
    state = const FavouriteRetailerState.loading();
    final failureOrSuccess =
        await _favouriteListRepository.getFavouriteRetailers();
    failureOrSuccess.fold(
      (f) => state = FavouriteRetailerState.failure(f),
      (retailerList) => state = FavouriteRetailerState.loaded(retailerList),
    );
  }
}
