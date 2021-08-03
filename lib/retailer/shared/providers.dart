import 'package:deall/auth/shared/providers.dart';
import 'package:deall/core/application/retailer.dart';
import 'package:deall/core/shared/providers.dart';
import 'package:deall/retailer/application/retailer_initialisation_notifier.dart';
import 'package:deall/retailer/infrastructure/retailer_remote_service.dart';
import 'package:deall/retailer/infrastructure/retailer_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final retailerRemoteServiceProvider = Provider(
  (ref) => RetailerRemoteService(
    ref.watch(firestoreProvider),
    ref.watch(firebaseAuthProvider),
  ),
);

final retailerRepositoryProvider = Provider(
  (ref) => RetailerRepository(
    ref.watch(retailerRemoteServiceProvider),
    ref.watch(internetConnectionCheckerProvider),
  ),
);

final retailerInitialisationNotifierProvider = StateNotifierProvider.autoDispose<RetailerInitialisationNotifier, RetailerInitialisationNotifierState>(
  (ref) => RetailerInitialisationNotifier(
    ref.watch(retailerRepositoryProvider),
    ref.read,
  ),
);

final retailerLocalStateProvider = StateProvider<Retailer>((ref) => Retailer.initial());
