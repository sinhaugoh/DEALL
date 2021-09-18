import 'package:deall/auth/shared/providers.dart';
import 'package:deall/consumer/application/favourite_retailer_notifier.dart';
import 'package:deall/consumer/application/retailer_list_notifier.dart';
import 'package:deall/consumer/application/retailer_list_state.dart';
import 'package:deall/consumer/infrastructure/favourite_retailer_remote_service.dart';
import 'package:deall/consumer/infrastructure/favourite_retailer_repository.dart';
import 'package:deall/consumer/infrastructure/retailer_list_remote_service.dart';
import 'package:deall/consumer/infrastructure/retailer_list_repository.dart';
import 'package:deall/core/application/product/product.dart';
import 'package:deall/core/application/retailer/retailer.dart';
import 'package:deall/core/shared/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final retailerListRemoteServiceProvider =
    Provider((ref) => RetailerListRemoteService(ref.watch(firestoreProvider)));

final retailerListRepoProvider = Provider((ref) => RetailerListRepository(
      ref.watch(retailerListRemoteServiceProvider),
      ref.watch(internetConnectionCheckerProvider),
    ));

final retailerListNotifierProvider =
    StateNotifierProvider.autoDispose<RetailerListNotifier, RetailerListState>(
        (ref) => RetailerListNotifier(ref.watch(retailerListRepoProvider)));

final currentRetailerItem = Provider.autoDispose<Retailer>((ref) => throw UnimplementedError());

final currentProductItem = Provider.autoDispose<Product>((ref) => throw UnimplementedError());

//favourite retailer list
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