import 'dart:async';
import 'package:deall/retailer/application/retailer_failure.dart';
import 'package:deall/retailer/infrastructure/retailer_repository.dart';
import 'package:deall/retailer/shared/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'retailer_initialisation_notifier.freezed.dart';

@freezed
class RetailerInitialisationNotifierState with _$RetailerInitialisationNotifierState {
  const RetailerInitialisationNotifierState._();
  const factory RetailerInitialisationNotifierState.initial() = Initial;
  const factory RetailerInitialisationNotifierState.loading() = Loading;
  const factory RetailerInitialisationNotifierState.success() = Success;
  const factory RetailerInitialisationNotifierState.failure(
      RetailerFailure retailerFailure) = Failure;
}

class RetailerInitialisationNotifier extends StateNotifier<RetailerInitialisationNotifierState> {
  final RetailerRepository _retailerRepository;
  final Reader _reader;

  RetailerInitialisationNotifier(this._retailerRepository, this._reader)
      : super(const RetailerInitialisationNotifierState.initial());

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
    state = const RetailerInitialisationNotifierState.loading();
    final failureOrRetailer = await _retailerRepository.getRetailer();
    failureOrRetailer.fold(
      (f) => state = RetailerInitialisationNotifierState.failure(f),
      (retailer) {
        _reader.call(retailerLocalStateProvider).state = retailer;
        state = const RetailerInitialisationNotifierState.success();
      },
    );
  }

  // Future<void> toggleVisibility() async {
  //   final updatedRetailer = state.copyWith(visibility: !state.visibility);
  //   await _retailerRepository.updateRetailer(updatedRetailer);
  //   state = updatedRetailer;
  // }
}
