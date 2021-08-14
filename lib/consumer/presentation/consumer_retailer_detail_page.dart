import 'package:deall/core/application/retailer/retailer.dart';
import 'package:flutter/material.dart';

class ConsumerRetailerDetailPage extends StatelessWidget {
  final Retailer retailerData;
  const ConsumerRetailerDetailPage(this.retailerData, { Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(retailerData.name),
      ),
      body: Container(),
    );
  }
}