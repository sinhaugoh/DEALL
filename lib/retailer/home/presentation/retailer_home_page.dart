import 'package:deall/core/presentation/widgets/retailer_drawer_widget.dart';
import 'package:flutter/material.dart';

class RetailerHomePage extends StatelessWidget {
  const RetailerHomePage({ Key? key }) : super(key: key);

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