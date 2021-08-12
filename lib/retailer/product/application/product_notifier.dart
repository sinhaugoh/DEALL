import 'package:deall/core/application/product/product.dart';
import 'package:deall/core/infrastructure/firestore_failures.dart';
import 'package:deall/retailer/product/infrastructure/product_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_notifier.freezed.dart';

@freezed
class ProductNotifierState with _$ProductNotifierState {
  const ProductNotifierState._();
  const factory ProductNotifierState.initial() = Initial;
  const factory ProductNotifierState.inProgress() = InProgess;
  const factory ProductNotifierState.success() = Success;
  const factory ProductNotifierState.failure(FirestoreFailures failure) =
      Failure;
}

class ProductNotifier extends StateNotifier<ProductNotifierState> {
  final ProductRepository _productRepository;

  ProductNotifier(this._productRepository)
      : super(const ProductNotifierState.initial());

  Future<void> updateProduct(Product product) async {
    state = const ProductNotifierState.inProgress();

    final failureOrUnit = await _productRepository.updateProduct(product);

    failureOrUnit.fold(
      (f) => state = ProductNotifierState.failure(f),
      (r) => state = const ProductNotifierState.success(),
    );
  }
}
