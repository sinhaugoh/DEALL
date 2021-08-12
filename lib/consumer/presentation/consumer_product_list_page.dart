import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:deall/consumer/presentation/widgets/consumer_product_item.dart';
import 'package:deall/consumer/shared/providers.dart';
import 'package:deall/core/application/product/product.dart';
import 'package:deall/core/application/product/product_list_state.dart';
import 'package:deall/core/application/retailer/retailer.dart';
import 'package:deall/core/shared/providers.dart';
import 'package:deall/retailer/product/shared/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConsumerProductListPage extends ConsumerStatefulWidget {
  final Retailer retailerData;
  const ConsumerProductListPage(this.retailerData, {Key? key})
      : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      ConsumerProductListPageState();
}

class ConsumerProductListPageState
    extends ConsumerState<ConsumerProductListPage> {
  StreamSubscription<ConnectivityResult>? _connectivityStreamSubscription;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref
          .read(productNotifierProvider.notifier)
          .getProductList(widget.retailerData.uen);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _connectivityStreamSubscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(productNotifierProvider);
    ref.listen<ProductListState>(
      productListNotifierProvider,
      (state) {
        state.maybeWhen(
          noConnection: () {
            _connectivityStreamSubscription = ref
                .read(connectivityProvider)
                .onConnectivityChanged
                .listen((result) {
              if (result != ConnectivityResult.none) {
                ref
                    .read(productNotifierProvider.notifier)
                    .getProductList(widget.retailerData.uen);
                _connectivityStreamSubscription?.cancel();
              }
            });
          },
          failure: (firestoreFailures) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('An unexpected error occurred.'),
              duration: Duration(seconds: 5),
              behavior: SnackBarBehavior.floating,
            ));
          },
          orElse: () {},
        );
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.retailerData.name),
      ),
      body: state.map(
        initial: (_) => const Center(),
        loading: (_) => const Center(
          child: CircularProgressIndicator(),
        ),
        noConnection: (noConnection) =>
            const Center(child: Text("No connection")),
        failure: (failure) => Center(child: Text("$failure failure")),
        loaded: (loaded) =>
            loadedBody(loaded.products, context, widget.retailerData),
      ),
    );
  }
}

Widget loadedBody(
    List<Product> productList, BuildContext context, Retailer retailerData) {
  return Column(
    children: [
      Expanded(
        child: upperPortionOfPage(context, retailerData),
      ),
      Expanded(
        child: ListView.builder(
          itemCount: productList.length,
          itemBuilder: (context, index) => ProviderScope(
            overrides: [
              currentProductItem.overrideWithValue(productList[index])
            ],
            child: const ConsumerProductItem(),
          ),
        ),
      ),
    ],
  );
}

Widget upperPortionOfPage(BuildContext context, Retailer retailerData) {
  final mq = MediaQuery.of(context);
  return SizedBox(
    height: mq.size.height * 0.5,
    child: Column(
      children: [
        Flexible(
          flex: 6,
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 2),
              ),
            ),
            child: Column(
              children: const [
                Flexible(
                  flex: 7,
                  child: Padding(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Placeholder(),
                  ),
                ),
                Flexible(
                  child: Text("Show Details"),
                ),
              ],
            ),
          ),
        ),
        Flexible(
          child: retailerData.visibility
              ? const Text("Deals Available")
              : const Text("Deals Unavailable"),
        ),
      ],
    ),
  );
}
