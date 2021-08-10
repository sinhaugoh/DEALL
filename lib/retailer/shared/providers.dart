import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:deall/auth/shared/providers.dart';
import 'package:deall/core/shared/providers.dart';
import 'package:deall/retailer/application/retailer_edit_profile_form_notifier.dart';
import 'package:deall/retailer/application/retailer_notifier.dart';
import 'package:deall/retailer/infrastructure/retailer_remote_service.dart';
import 'package:deall/retailer/infrastructure/retailer_repository.dart';


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

final retailerNotifierProvider =
    StateNotifierProvider.autoDispose<RetailerNotifier, RetailerNotifierState>(
  (ref) => RetailerNotifier(
    ref.watch(retailerRepositoryProvider),
  ),
);

final retailerEditProfileNotifierProvider = StateNotifierProvider.autoDispose<
    RetailerEditProfileFormNotifier, RetailerEditProfileFormNotifierState>(
  (ref) => RetailerEditProfileFormNotifier(
    ref.watch(imagePickingRepositoryProvider),
    ref.watch(authRepositoryProvider),
    ref.watch(retailerRepositoryProvider),
  ),
);
// final retailerLocalStateProvider = StateProvider<Retailer>((ref) => Retailer.initial());


