import 'package:deall/retailer/home/application/retailer.dart';
import 'package:flutter/material.dart';

class RetailerItem extends StatelessWidget {
  const RetailerItem(Retailer retailerData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return Container(
      padding: EdgeInsets.only(
        left: mq.size.width * 0.05,
        right: mq.size.width * 0.05,
        top: mq.size.width * 0.05,
      ),
      height: mq.size.height * 0.2,
      width: mq.size.width * 0.9,
      child: Card(
        elevation: 2,
        child: Row(
          children: [
            const Flexible(
              flex: 3,
              child: Placeholder(),
            ),
            Flexible(
              flex: 6,
              child: Column(
                children: const [
                  Flexible(
                    flex: 2,
                    child: Text(""), //shop name
                  ),
                  Flexible(
                    child: SizedBox(), //dist and opening hours
                  ),
                  Flexible(
                    flex: 2,
                    child: SizedBox(), //shop description
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
