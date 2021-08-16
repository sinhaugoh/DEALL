import 'package:deall/auth/shared/providers.dart';
import 'package:deall/consumer/favourite_retailers/application/favourite_retailer_notifier.dart';
import 'package:deall/consumer/favourite_retailers/infrastructure/favourite_retailer_remote_service.dart';
import 'package:deall/consumer/favourite_retailers/infrastructure/favourite_retailer_repository.dart';
import 'package:deall/core/shared/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favouriteRetailerRemoteServiceProvider = Provider(
    (ref) => FavouriteRetailerRemoteService(ref.watch(firestoreProvider)));

final favouriteRetailerRepositoryProvider =
    Provider((ref) => FavouriteRetailerRepository(
          ref.watch(favouriteRetailerRemoteServiceProvider),
          ref.watch(authRepositoryProvider),
          ref.watch(internetConnectionCheckerProvider),
        ));

final favouriteRetailerStateNotifierProvider =
    StateNotifierProvider<FavouriteRetailerNotifier, FavouriteRetailerState>(
        (ref) => FavouriteRetailerNotifier(
            ref.watch(favouriteRetailerRepositoryProvider)));
