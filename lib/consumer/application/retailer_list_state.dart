import 'package:deall/core/application/retailer/retailer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'retailer_list_state.freezed.dart';

@freezed
class RetailerListState with _$RetailerListState {
  const RetailerListState._();
  const factory RetailerListState.initial() = Initial;
  const factory RetailerListState.noConnection() = NoConnection;
  const factory RetailerListState.loading() = Loading;
  const factory RetailerListState.loaded(
    List<Retailer> retailers,
    List<Retailer> filteredRetailers,
  ) = Loaded;
  const factory RetailerListState.failure(String message) = Failure;
}
