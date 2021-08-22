import 'package:deall/core/application/retailer/retailer.dart';
import 'package:flutter/material.dart';

class ConsumerRetailerDetailPage extends StatelessWidget {
  final Retailer retailerData;
  const ConsumerRetailerDetailPage(this.retailerData, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(retailerData.name),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          SizedBox(
            height: mq.size.height * 0.4,
            child: const Placeholder(),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 2),
              ),
              child: Text(retailerData.description),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 2),
              ),
              child: Column(
                children: [
                  const Text("Operating Hours", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(retailerData.operatingHours),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 2),
              ),
              child: Column(
                children: [
                  const Text("Address", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(retailerData.addressLine()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
