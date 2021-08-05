import 'package:auto_route/auto_route.dart';
import 'package:deall/auth/shared/providers.dart';
import 'package:deall/core/presentation/routes/app_router.gr.dart';
import 'package:deall/core/shared/providers.dart';
import 'package:deall/retailer/presentation/product_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:deall/core/presentation/widgets/retailer_drawer_widget.dart';

class RetailerHomePage extends ConsumerStatefulWidget {
  const RetailerHomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RetailerHomePageState();
}

class _RetailerHomePageState extends ConsumerState<RetailerHomePage> {
  @override
  void initState() {
    super.initState();
    retrieveUserIDAndGetPageInfo(ref);
  }

  Future<void> retrieveUserIDAndGetPageInfo(WidgetRef ref) async {
    final String uid = await Future.microtask(
        () => ref.read(firebaseAuthServiceProvider).getUserId());
    Future.microtask(() =>
        ref.read(productListNotifierProvider.notifier).getProductList(uid));
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return Scaffold(
      appBar: shopNameAppBar(),
      drawer: const RetailerDrawer(),
      body: retailerHomePageBody(mq, context),
    );
  }
}

AppBar shopNameAppBar() {
  return AppBar(
    title: const Text("shop name"), // get shop name
  );
}

Widget retailerHomePageBody(MediaQueryData mq, BuildContext context) {
  return SizedBox(
    height: mq.size.height * 0.9,
    child: Column(
      children: [
        const Flexible(
          flex: 2,
          child: SizedBox(), // visibility text and switch button
        ),
        Flexible(
          // add product, show all, hide all button
          child: TextButton(
            onPressed: () {
              AutoRouter.of(context).push(const AddProductRoute());
            },
            child: const ListTile(
              leading: Icon(Icons.add_circle),
              trailing: Text("Add Product"),
            ),
          ),
        ),
        const Flexible(
          flex: 14,
          child: ProductListView(),
        ),
      ],
    ),
  );
}
