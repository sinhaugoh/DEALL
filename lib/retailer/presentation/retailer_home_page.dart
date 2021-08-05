import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:connectivity/connectivity.dart';

import 'package:deall/auth/shared/providers.dart';
import 'package:deall/core/presentation/routes/app_router.gr.dart';
import 'package:deall/core/presentation/widgets/retailer_drawer_widget.dart';
import 'package:deall/core/shared/providers.dart';
import 'package:deall/retailer/application/retailer_notifier.dart';
import 'package:deall/retailer/presentation/product_listview.dart';
import 'package:deall/retailer/shared/providers.dart';

class RetailerHomePage extends ConsumerStatefulWidget {
  const RetailerHomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RetailerHomePageState();
}

class _RetailerHomePageState extends ConsumerState<RetailerHomePage> {
  StreamSubscription<ConnectivityResult>? _connectivityStreamSubscription;

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => ref
          .read(retailerInitialisationNotifierProvider.notifier)
          .getRetailer(),
    );
    retrieveUserIDAndGetPageInfo(ref);
  }

  @override
  void dispose() {
    super.dispose();
    _connectivityStreamSubscription?.cancel();
  }

  Future<void> retrieveUserIDAndGetPageInfo(WidgetRef ref) async {
    final String uid = await Future.microtask(
        () => ref.read(firebaseAuthServiceProvider).getUserId());
    Future.microtask(() =>
        ref.read(productListNotifierProvider.notifier).getProductList(uid));
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<RetailerNotifierState>(
      retailerInitialisationNotifierProvider,
      (state) {
        state.when(
          initial: () {},
          loading: () {},
          loaded: (retailer, hasConnection) {
            if (!hasConnection) {
              //TODO: use theme snackbar instead
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('No connection'),
                duration: Duration(seconds: 5),
                behavior: SnackBarBehavior.floating,
              ));
            }
          },
          failure: (retailerFailure) => retailerFailure.maybeWhen(
            noConnection: () {
              _connectivityStreamSubscription = ref
                  .read(connectivityProvider)
                  .onConnectivityChanged
                  .listen((result) {
                if (result != ConnectivityResult.none) {
                  ref
                      .read(retailerInitialisationNotifierProvider.notifier)
                      .getRetailer();
                  _connectivityStreamSubscription?.cancel();
                }
              });
            },
            orElse: () {},
          ),
        );
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('DEALL'),
      ),
      //TODO: change to retailer drawer
      drawer: const RetailerDrawer(),
      body: ref.watch(retailerInitialisationNotifierProvider).when(
        initial: () {
          return Container();
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        loaded: (retailer, hasConnection) {
          return Column(
            children: [
              Switch(
                onChanged: (value) {
                  ref
                      .read(retailerInitialisationNotifierProvider.notifier)
                      .toggleVisibility();
                },
                value: retailer.visibility,
              ),
              TextButton(
                onPressed: () {
                  AutoRouter.of(context).push(const AddProductRoute());
                },
                child: const ListTile(
                  leading: Icon(Icons.add_circle),
                  trailing: Text("Add Product"),
                ),
              ),
              const Expanded(
                child: ProductListView(),
              ),
            ],
          );
        },
        //TODO: implement no connection page
        failure: (retailerFailure) {
          return Center(
            child: Text(
              retailerFailure.when(
                  noConnection: () => 'No Connection!',
                  unexpected: (_) =>
                      'Unexpected error occured. Please contact admin for more information.',
                  notFound: () =>
                      'User not found in the database. Please contact admin for more information.',
                  authentication: (_) =>
                      'You are not authenticated. Please contact admin for more information.'),
            ),
          );
        },
      ),
    );
  }
}
