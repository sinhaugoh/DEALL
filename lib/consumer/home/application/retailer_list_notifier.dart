import 'package:deall/consumer/home/infrastructure/retailer_list_repo.dart';
import 'package:deall/core/application/retailer.dart';
import 'package:flutter/cupertino.dart';
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

class RetailerListNotifier extends StateNotifier<RetailerListState> {
  final RetailerListRepository _repo;

  RetailerListNotifier(this._repo) : super(const RetailerListState.initial());

  Future<void> getRetailerList() async {
    print('method called');
    state = const RetailerListState.loading();

    final successOrFailure = await _repo.getRetailerList();

    successOrFailure.fold((firestoreFailure) {
      firestoreFailure.maybeMap(
        noConnection: (_) {
          state = const RetailerListState.failure('No connection');
        },
        unknown: (_) {
          state = const RetailerListState.failure('Unknow error');
        },
        orElse: () {},
      );
    }, (retailers) {
      state = RetailerListState.loaded(retailers);
    });
  }
}


class RetailerListNotifier1 extends ChangeNotifier {
  RetailerListState state = const RetailerListState.initial();

  final RetailerListRepository _repo;
  RetailerListNotifier1(this._repo);


    Future<void> getRetailerList() async {
    state = const RetailerListState.loading();

    final successOrFailure = await _repo.getRetailerList();

    successOrFailure.fold((firestoreFailure) {
      firestoreFailure.maybeMap(
        noConnection: (_) {
          state = const RetailerListState.failure('No connection');
        },
        unknown: (_) {
          state = const RetailerListState.failure('Unknow error');
        },
        orElse: () {},
      );
      state = const RetailerListState.failure('bla bal');
    }, (retailers) {
      state = RetailerListState.loaded(retailers);
    });

    notifyListeners();
  }
}
