import 'package:deall/core/application/product/product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_list_state.freezed.dart';

@freezed
class ProductListState with _$ProductListState {
  const ProductListState._();
  const factory ProductListState.initial() = Initial;
  const factory ProductListState.loading() = Loading;
  const factory ProductListState.loaded(
    List<Product> products, {
    @Default(true) bool hasConnection,
    @Default(false) bool hasFirebaseFailure,
  }) = Loaded;

  const factory ProductListState.noConnection() = NoConnection;
  const factory ProductListState.failure(String message) = Failure;
}
