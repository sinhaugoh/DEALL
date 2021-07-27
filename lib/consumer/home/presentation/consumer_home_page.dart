import 'package:deall/consumer/home/shared/provider.dart';
import 'package:flutter/material.dart';
import 'package:deall/consumer/home/presentation/drawer_widget.dart';
import 'package:deall/consumer/home/presentation/retailer_listview.dart';
import 'package:deall/consumer/home/presentation/search_bar_filter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConsumerHomePage extends ConsumerStatefulWidget {
  const ConsumerHomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ConsumerHomePageState();


}

class _ConsumerHomePageState extends ConsumerState<ConsumerHomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(retailerListNotifierProvider.notifier).getRetailerList());
  }

  @override
  Widget build(BuildContext context) {
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
