import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:deall/consumer/home/presentation/drawer_widget.dart';
import 'package:deall/consumer/home/presentation/retailer_listview.dart';
import 'package:deall/consumer/home/presentation/search_bar_filter.dart';

class ConsumerHomePage extends ConsumerWidget {
  const ConsumerHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
