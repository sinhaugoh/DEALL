import 'package:deall/consumer/infrastructure/favourite_retailer_repository.dart';
import 'package:deall/core/application/retailer/retailer.dart';
import 'package:deall/core/infrastructure/firestore_failures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favourite_retailer_notifier.freezed.dart';

@freezed
class FavouriteRetailerState with _$FavouriteRetailerState {
  const FavouriteRetailerState._();
  const factory FavouriteRetailerState.initial() = Initial;
  const factory FavouriteRetailerState.loading() = Loading;
  const factory FavouriteRetailerState.loaded(
    List<Retailer> retailerList, {
    @Default(true) bool hasConnection,
  }) = Loaded;
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

  Future<void> toggleFavouriteRetailer(Retailer retailer) async {
    state.maybeMap(
      loaded: (loadedState) async {
        final loadedStateCopy = loadedState.copyWith(
          retailerList: List.of(loadedState.retailerList),
          hasConnection: true,
        );

        if (loadedStateCopy.retailerList.contains(retailer)) {
          loadedStateCopy.retailerList.remove(retailer);
        } else {
          loadedStateCopy.retailerList.add(retailer);
        }

        final successOrUnit = await _favouriteListRepository
            .updateFavouriteRetailerList(loadedStateCopy.retailerList);
        successOrUnit.fold(
          (l) => state = loadedState.copyWith(hasConnection: false),
          (r) => state = loadedStateCopy,
        );
      },
      orElse: () {},
    );
  }
}
