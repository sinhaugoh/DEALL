import 'dart:async';
import 'package:deall/core/application/retailer.dart';
import 'package:deall/retailer/application/retailer_failure.dart';
import 'package:deall/retailer/infrastructure/retailer_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'retailer_notifier.freezed.dart';

@freezed
class RetailerNotifierState with _$RetailerNotifierState {
  const RetailerNotifierState._();
  const factory RetailerNotifierState.initial() = Initial;
  const factory RetailerNotifierState.loading() = Loading;
  const factory RetailerNotifierState.loaded(
    Retailer retailer, {
    required bool hasConnection,
  }) = Loaded;
  const factory RetailerNotifierState.failure(RetailerFailure retailerFailure) =
      Failure;
}

class RetailerNotifier extends StateNotifier<RetailerNotifierState> {
  final RetailerRepository _retailerRepository;

  RetailerNotifier(this._retailerRepository)
      : super(const RetailerNotifierState.initial());

  // StreamSubscription<Either<RetailerFailure, Retailer>>?
  //     _retailerStreamSubscription;

  // Future<void> getRetailerStream() async {
  //   state = const RetailerNotifierState.loading();
  //   _retailerStreamSubscription =
  //       _retailerRepository.getRetailerStream().listen((failureOrRetailer) {
  //     failureOrRetailer.fold(
  //       (f) => state = RetailerNotifierState.failure(f),
  //       (retailer) => state = RetailerNotifierState.loaded(retailer),
  //     );
  //   });
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _retailerStreamSubscription?.cancel();
  // }

  Future<void> getRetailer() async {
    state = const RetailerNotifierState.loading();
    final failureOrRetailer = await _retailerRepository.getRetailer();
    failureOrRetailer.fold(
      (f) => state = RetailerNotifierState.failure(f),
      (retailer) {
        state = RetailerNotifierState.loaded(
          retailer,
          hasConnection: true,
        );
      },
    );
  }

  Future<void> toggleVisibility() async {
    state.maybeMap(
      loaded: (loadedState) async {
        final stateCopy = loadedState.copyWith();
        final retailerVisilibity = stateCopy.retailer.visibility;
        final toggledVisibilityRetailer =
            stateCopy.retailer.copyWith(visibility: !retailerVisilibity);
        final failureOrUnit =
            await _retailerRepository.updateRetailer(toggledVisibilityRetailer);

        failureOrUnit.fold(
          (retailerFailure) => retailerFailure.maybeWhen(
            noConnection: () {
              //toggle the hasConnection to display snackbar
              state = stateCopy.copyWith(hasConnection: false);
              state = stateCopy.copyWith(hasConnection: true);
            },
            orElse: () {},
          ),
          (_) =>
              state = stateCopy.copyWith(retailer: toggledVisibilityRetailer),
        );
      },
      orElse: () {},
    );
  }
}
