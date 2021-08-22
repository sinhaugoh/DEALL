import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:deall/consumer/infrastructure/retailer_list_repository.dart';
import 'retailer_list_state.dart';

class RetailerListNotifier extends StateNotifier<RetailerListState> {
  final RetailerListRepository _repo;
  RetailerListNotifier(this._repo) : super(const RetailerListState.initial());

  Future<void> getRetailerList() async {
    state = const RetailerListState.loading();

    final getListResult = await _repo.getRetailerList();
    getListResult.fold((failure) {
      failure.maybeMap(
        objectNotFound: (_) {
          state = const RetailerListState.failure("Object not found.");
        },
        cancelledOperation: (_) {
          state = const RetailerListState.failure("Operation cancelled.");
        },
        noConnection: (_) {
          state = const RetailerListState.noConnection();
        },
        orElse: () {
          state = const RetailerListState.failure("Unknown error.");
        },
      );
    }, (retailerList) => state = RetailerListState.loaded(retailerList, retailerList));
  }

  void searchWithTerm(String? searchTerm) {
    final formattedSearchTerm = searchTerm?.toLowerCase().trim();
    state.maybeMap(
      loaded: (loadedState) {
        var loadedStateCopy = loadedState.copyWith();

        if (formattedSearchTerm == null ||formattedSearchTerm.isEmpty) {
          loadedStateCopy = loadedStateCopy.copyWith(
              filteredRetailers: loadedStateCopy.retailers
                  .where((retailer) => retailer.visibility == true)
                  .toList());
        } else {
          loadedStateCopy = loadedStateCopy.copyWith(
              filteredRetailers: loadedStateCopy.retailers
                  .where((retailer) => retailer.name.toLowerCase().contains(formattedSearchTerm))
                  .toList());
        }

        state = loadedStateCopy;
      },
      orElse: () {},
    );
  }
}
