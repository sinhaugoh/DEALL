import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:deall/core/application/product.dart';

part 'product_list_state.freezed.dart';

@freezed
class ProductListState with _$ProductListState {
  const ProductListState._();
  const factory ProductListState.initial() = Initial;
  const factory ProductListState.loading() = Loading;
  const factory ProductListState.loaded(List<Product> products) = Loaded;
  const factory ProductListState.failure(String message) = Failure;
}