import 'package:deall/core/presentation/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';

class RetailerHomePage extends StatelessWidget {
  const RetailerHomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DEALL'),),
      //TODO: change to retailer drawer
      drawer: const ConsumerDrawer(),
      body: const Text('this is retailer home'),);
  }
}