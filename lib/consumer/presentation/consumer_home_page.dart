import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:connectivity/connectivity.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:deall/core/presentation/widgets/drawer_widget.dart';
import 'package:deall/consumer/shared/providers.dart';
import 'package:deall/consumer/presentation/retailer_listview.dart';
import 'package:deall/consumer/presentation/widgets/search_bar_filter.dart';

class ConsumerHomePage extends ConsumerStatefulWidget {
  const ConsumerHomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ConsumerHomePageState();
}

class _ConsumerHomePageState extends ConsumerState<ConsumerHomePage> {
  StreamSubscription<ConnectivityResult>? subscription;

  @override
  void initState() {
    super.initState();

    Future.microtask(() =>
        ref.read(retailerListNotifierProvider.notifier).getRetailerList());
  }

  @override
  void dispose() {
    super.dispose();
    subscription!.cancel();
  }

  void connectivityChecker() {
    // ignore: cancel_subscriptions
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      if (result == ConnectivityResult.none) {
        // if (!await InternetConnectionChecker().hasConnection) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("No connection"),
            ),
          );
        // }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    connectivityChecker();
    final mq = MediaQuery.of(context);
    return Scaffold(
      appBar: enterLocationAppBar(),
      drawer: const ConsumerDrawer(),
      body: consumerHomePageBody(mq),
    );
  }
}

AppBar enterLocationAppBar() {
  return AppBar(
    title: const TextField(),
  );
}

Widget consumerHomePageBody(MediaQueryData mq) {
  return SizedBox(
    height: mq.size.height * 0.9,
    child: Column(
      children: const [
        Flexible(
          child: SearchBarWithFilterButton(), //search bar + filter icon
        ),
        Flexible(
          flex: 10,
          child: RetailerListView(), // retailer list
        ),
      ],
    ),
  );
}
