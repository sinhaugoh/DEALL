import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:deall/consumer/shared/providers.dart';
import 'package:deall/retailer/product/shared/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RetailerDetailPage extends ConsumerStatefulWidget {
  const RetailerDetailPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      RetailerDetailPageState();
}

class RetailerDetailPageState extends ConsumerState<RetailerDetailPage> {
  StreamSubscription<ConnectivityResult>? _connectivityStreamSubscription;

  @override
  void initState() {
    super.initState();
    final index = ref.watch(currentRetailerItemIndex);
    final retailerData = retailerList[index];
    Future.microtask(() {
      ref
          .read(productListNotifierProvider.notifier)
          .getProductList(retailerData.uen);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _connectivityStreamSubscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final index = ref.watch(currentRetailerItemIndex);
    final retailerData = retailerList[index];
    return Scaffold(
      appBar: AppBar(
        title: Text(retailerData.name),
      ),
      body: Container(),
    );
  }
}
