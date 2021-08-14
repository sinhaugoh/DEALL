import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:deall/consumer/favourite_retailers/shared/providers.dart';
import 'package:deall/core/presentation/widgets/consumer_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavouriteRetailerPage extends ConsumerStatefulWidget {
  const FavouriteRetailerPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FavouriteRetailerPageState();
}

class _FavouriteRetailerPageState extends ConsumerState<FavouriteRetailerPage> {
  StreamSubscription<ConnectivityResult>? _subscription;

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => ref
          .read(favouriteRetailerStateNotifierProvider.notifier)
          .getRetailerList(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _subscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite'),
      ),
      drawer: const ConsumerDrawer(),
      body: RefreshIndicator(
        onRefresh: () async {
          ref
              .read(favouriteRetailerStateNotifierProvider.notifier)
              .getRetailerList();
        },
        child: ref.watch(favouriteRetailerStateNotifierProvider).when(
          initial: () {
            return Container();
          },
          loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          loaded: (retailerList) {
            return ListView.builder(
                itemCount: retailerList.length,
                itemBuilder: (context, index) {
                  return Text(retailerList[index].toString());
                });
          },
          failure: (firestoreFailure) {
            return firestoreFailure.maybeWhen(noConnection: () {
              _subscription = Connectivity()
                  .onConnectivityChanged
                  .listen((ConnectivityResult result) async {
                if (result != ConnectivityResult.none) {
                  Future.microtask(() async {
                    ref
                        .read(favouriteRetailerStateNotifierProvider.notifier)
                        .getRetailerList();
                  });
                  _subscription?.cancel();
                }
              });

              return const Center(
                child: Text('No connection'),
              );
            }, orElse: () {
              return const Center(
                child: Text('Unexpected error. Please contact support.'),
              );
            });
          },
        ),
      ),
    );
  }
}
