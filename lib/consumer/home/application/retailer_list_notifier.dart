import 'package:deall/consumer/home/infrastructure/retailer_list_repo.dart';
import 'package:deall/core/application/retailer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'retailer_list_notifier.freezed.dart';

@freezed
class RetailerListState with _$RetailerListState {
  const RetailerListState._();
  const factory RetailerListState.initial() = Initial;
  const factory RetailerListState.loading() = Loading;
  const factory RetailerListState.loaded(List<Retailer> retailers) = Loaded;
  const factory RetailerListState.failure(String message) = Failure;
}

class RetailerListNotifier extends StateNotifier<RetailerListState>{
  final RetailerListRepository _repo;

  RetailerListNotifier(this._repo) : super(const RetailerListState.initial());

  Future<void> getRetailerList() async {
    state = const RetailerListState.loading();

    final successOrFailure = await _repo.getRetailerList();

    successOrFailure.fold((f) {
      //if failure
      state = const RetailerListState.failure('bla bal');
    }, (retailers) {
      state = RetailerListState.loaded(retailers);
    });
  }
}