import 'package:deall/auth/shared/providers.dart';
import 'package:deall/core/shared/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:deall/core/presentation/widgets/retailer_drawer_widget.dart';

class RetailerHomePage extends ConsumerStatefulWidget {
  const RetailerHomePage({ Key? key }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RetailerHomePageState();
}

class _RetailerHomePageState extends ConsumerState<RetailerHomePage> {
  
  @override
  void initState() {
    super.initState();
    retrieveUserUIDAndGetProductList(ref);
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return Scaffold(
      appBar: shopNameAppBar(),
      drawer: const RetailerDrawer(),
      body: retailerHomePageBody(mq),
    );
  }
}


Future<void> retrieveUserUIDAndGetProductList(WidgetRef ref) async {
  final String uid = await Future.microtask(() => ref.read(firebaseAuthServiceProvider).getUserId());
  Future.microtask(() => ref.read(productListNotifierProvider.notifier).getProductList(uid));
}

AppBar shopNameAppBar() {
  return AppBar(
    title: const Text("shop name"), // get shop name
  );
}

Widget retailerHomePageBody(MediaQueryData mq) {
  return SizedBox(
    height: mq.size.height * 0.9,
    child: Column(
      children: const [
        Flexible(
          flex: 2,
          child: SizedBox(), // visibility text and switch button
        ),
        Flexible(
          child: SizedBox(), // add product, show all, hide all button
        ),
        Flexible(
          flex: 14,
          child: SizedBox(), // product list
        ),
      ],
    ),
  );
}