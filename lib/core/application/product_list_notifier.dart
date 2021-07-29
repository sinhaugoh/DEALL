import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:deall/core/infrastructure/product_list_repository.dart';
import 'product_list_state.dart';

class ProductListNotifier extends StateNotifier<ProductListState> {
  final ProductListRepository _repo;
  ProductListNotifier(this._repo) : super(const ProductListState.initial());

  Future<void> getProductList(String uid) async {
    state = const ProductListState.loading();
    final getListResult = await _repo.getProductList(uid);
    getListResult.fold((failure) {
      failure.maybeMap(
        objectNotFound: (_) {
          state = const ProductListState.failure("Object not found.");
        },
        cancelledOperation: (_) {
          state = const ProductListState.failure("Operation cancelled.");
        },
        orElse: () {
          state = const ProductListState.failure("Unknown error.");
        },
      );
    }, (productList) => state = ProductListState.loaded(productList));
  }
}
