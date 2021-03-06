import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:connectivity/connectivity.dart';
import 'package:deall/consumer/application/retailer_list_state.dart';
import 'package:deall/consumer/presentation/retailer_listview.dart';
import 'package:deall/consumer/presentation/widgets/custom_appbar.dart';
import 'package:deall/consumer/presentation/widgets/search_bar_filter.dart';
import 'package:deall/consumer/shared/providers.dart';
import 'package:deall/core/presentation/routes/app_router.gr.dart';
import 'package:deall/core/presentation/widgets/consumer_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConsumerHomePage extends ConsumerStatefulWidget {
  const ConsumerHomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ConsumerHomePageState();
}

class _ConsumerHomePageState extends ConsumerState<ConsumerHomePage> {
  // ignore: cancel_subscriptions
  StreamSubscription<ConnectivityResult>? subscription;
  final _textEditingController = TextEditingController(text: '');

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await ref.read(retailerListNotifierProvider.notifier).getRetailerList();
      ref.read(retailerListNotifierProvider.notifier).searchWithTerm('');
      ref
          .read(favouriteRetailerStateNotifierProvider.notifier)
          .getRetailerList();
    });
  }

  @override
  void dispose() {
    super.dispose();
    subscription?.cancel();
    _textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<RetailerListState>(retailerListNotifierProvider, (state) {
      if (state == const RetailerListState.noConnection()) {
        checkConnectivityAndGetRetailerList();
      }
    });

    final mq = MediaQuery.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false, //prevent searchbar resize
      appBar : CustomAppBar(
        IconButton(
            onPressed: () {
              if (AutoRouter.of(context).current.name !=
                  FavouriteRetailerRoute.name) {
                AutoRouter.of(context)
                    .popAndPush(const FavouriteRetailerRoute());
              } else {
                AutoRouter.of(context).pop();
              }
            },
          icon: const Icon(Icons.favorite)
        ),
      ),
      drawer: const ConsumerDrawer(),
      body: RefreshIndicator(
          onRefresh: () async {
            await ref
                .read(retailerListNotifierProvider.notifier)
                .getRetailerList();
            ref
                .read(retailerListNotifierProvider.notifier)
                .searchWithTerm(_textEditingController.text);
          },
          child: consumerHomePageBody(mq, _textEditingController)),
    );
  }

  Future<void> checkConnectivityAndGetRetailerList() async {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      if (result != ConnectivityResult.none) {
        Future.microtask(() async {
          await ref
              .read(retailerListNotifierProvider.notifier)
              .getRetailerList();
          ref
              .read(retailerListNotifierProvider.notifier)
              .searchWithTerm(_textEditingController.text);
        });
        subscription?.cancel();
      }
    });
  }

  Widget consumerHomePageBody(
      MediaQueryData mq, TextEditingController controller) {
    return SizedBox(
      height: mq.size.height * 0.9,
      child: Column(
        children: [
          SizedBox(height: 12.h),
          Flexible(
            child: SearchBarWithFilterButton(
              textEditingController: controller,
            ), //search bar + filter icon
          ),
          SizedBox(height: 5.h),
          const Flexible(
            flex: 10,
            child: RetailerListView(), // retailer list
          ),
        ],
      ),
    );
  }
} //class end