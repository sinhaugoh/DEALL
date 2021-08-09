import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:deall/core/application/product/product.dart';
import 'package:deall/core/infrastructure/firestore_failures.dart';
import 'package:deall/retailer/product/infrastructure/product_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'product_list_state.dart';

class ProductListNotifier extends StateNotifier<ProductListState> {
  final ProductRepository _repo;

  ProductListNotifier(this._repo) : super(const ProductListState.initial());

  StreamSubscription<Either<FirestoreFailures, List<Product>>>?
      _productListStreamSubscription;

  void getProductStream() {
    state = const ProductListState.loading();
    _productListStreamSubscription =
        _repo.getProductStream().listen((failureOrProductList) {
      failureOrProductList.fold(
        (f) => state = const ProductListState.failure('Unexpected error. Please contact support'),
        (productList) => state = ProductListState.loaded(productList),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _productListStreamSubscription?.cancel();
  }
}
