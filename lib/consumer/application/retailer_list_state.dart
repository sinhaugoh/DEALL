import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:deall/core/application/retailer.dart';

part 'retailer_list_state.freezed.dart';

@freezed
class RetailerListState with _$RetailerListState {
  const RetailerListState._();
  const factory RetailerListState.initial() = Initial;
  const factory RetailerListState.loading() = Loading;
  const factory RetailerListState.loaded(List<Retailer> retailers) = Loaded;
  const factory RetailerListState.failure(String message) = Failure;
}