import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:connectivity/connectivity.dart';
import 'package:deall/consumer/presentation/widgets/consumer_product_item.dart';
import 'package:deall/consumer/shared/providers.dart';
import 'package:deall/consumer/presentation/consumer_retailer_detail_page.dart';
import 'package:deall/core/application/product/product.dart';
import 'package:deall/core/application/product/product_list_state.dart';
import 'package:deall/core/application/retailer/retailer.dart';
import 'package:deall/core/presentation/routes/app_router.gr.dart';
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

    Future<void> checkConnectivityAndGetProductList() async {
      _connectivityStreamSubscription = Connectivity()
          .onConnectivityChanged
          .listen((ConnectivityResult result) async {
        if (result != ConnectivityResult.none) {
          Future.microtask(() async {
            await ref
                .read(productListNotifierProvider.notifier)
                .getProductList(widget.retailerData.uen);
          });
          _connectivityStreamSubscription?.cancel();
        }
      });
    }

    ref.listen<ProductListState>(
      productListNotifierProvider,
      (state) {
        if (state == const ProductListState.noConnection()) {
          checkConnectivityAndGetProductList();
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.retailerData.name),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await ref
              .read(productListNotifierProvider.notifier)
              .getProductList(widget.retailerData.uen);
        },
        child: state.map(
          initial: (_) => const Center(),
          loading: (_) => const Center(
            child: CircularProgressIndicator(),
          ),
          noConnection: (noConnection) =>
              const Center(child: Text("No connection")),
          failure: (failure) => Center(child: Text("$failure failure")),
          loaded: (loaded) => Column(
            children: [
              Expanded(
                child: upperPortionOfPage(context, widget.retailerData),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: loaded.products.length,
                  itemBuilder: (context, index) => ProviderScope(
                    overrides: [
                      currentProductItem
                          .overrideWithValue(loaded.products[index])
                    ],
                    child: const ConsumerProductItem(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
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
              children: [
                const Flexible(
                  flex: 7,
                  child: Padding(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Placeholder(),
                  ),
                ),
                Flexible(
                  child: GestureDetector(
                      onTap: () {
                        AutoRouter.of(context).push(ConsumerRetailerDetailRoute(
                            retailerData: retailerData));
                      },
                      child: const Text("Show Details")),
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
