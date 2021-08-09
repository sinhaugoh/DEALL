import 'dart:async';

import 'package:deall/consumer/application/retailer_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:connectivity/connectivity.dart';

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
  // ignore: cancel_subscriptions
  StreamSubscription<ConnectivityResult>? subscription;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(retailerListNotifierProvider.notifier).getRetailerList();
    });
  }

  @override
  void dispose() {
    super.dispose();
    subscription!.cancel();
  }

  Future<void> checkConnectivityAndGetRetailerList() async {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      if (result != ConnectivityResult.none) {
        Future.microtask(() =>
            ref.read(retailerListNotifierProvider.notifier).getRetailerList());
        subscription?.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<RetailerListState>(retailerListNotifierProvider, (state) { 
      if(state == const RetailerListState.noConnection()) {
        checkConnectivityAndGetRetailerList();
      }
    });

    final mq = MediaQuery.of(context);
    return Scaffold(
      appBar: enterLocationAppBar(),
      drawer: const ConsumerDrawer(),
      body: RefreshIndicator(
          onRefresh: () async {
            ref.read(retailerListNotifierProvider.notifier).getRetailerList();
          },
          child: consumerHomePageBody(mq)),
    );
  }
}

AppBar enterLocationAppBar() {
  return AppBar(
    title: Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.fromLTRB(2, 5, 2, 5),
          suffixIcon: IconButton(onPressed: (){

          }, icon: Icon(Icons.arrow_forward))
        ),
      ),
    ),
    actions: [
      IconButton(onPressed: (){}, icon: Icon(Icons.filter_alt)),
      // IconButton(onPressed: (){}, icon: Icon(Icons.person)),
    ],
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
        // Divider(height: 15),
        Flexible(
          flex: 10,
          child: RetailerListView(), // retailer list
        ),
      ],
    ),
  );
}
