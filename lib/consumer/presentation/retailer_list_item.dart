import 'package:deall/core/application/retailer.dart';
import 'package:flutter/material.dart';

class RetailerItem extends StatelessWidget {
  final Retailer retailerData;
  const RetailerItem({Key? key, required this.retailerData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return Container(
      color: Colors.tealAccent,
      padding: EdgeInsets.only(
        left: mq.size.width * 0.05,
        right: mq.size.width * 0.05,
        top: mq.size.width * 0.01,
      ),
      height: mq.size.height * 0.2,
      width: mq.size.width * 0.9,
      child: Card(
        color: Colors.grey,
        elevation: 2,
        child: Row(
          children: [
            const Flexible(
              flex: 3,
              //image
              child: Placeholder(),
            ),
            Flexible(
              flex: 6,
              child: Column(
                children: [
                  Flexible(
                    flex: 3,
                    child: Container(
                      color: Colors.cyan,
                      // child: Text(retailerData.name)
                    ), //shop name
                  ),
                  Flexible(
                    flex: 3,
                    child: Container(
                      color: Colors.red,
                      // child: FittedBox(
                      //   fit: BoxFit.scaleDown,
                      //   child: Text(
                      //       "543m, ${retailerData.operatingHours}"//dist and opening hours
                      //     ),
                      // ),
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    child: Container(
                      color: Colors.green,
                      // child: Text(
                      //   retailerData.description.toString(),
                      //   overflow: TextOverflow.ellipsis,
                      //   maxLines: 3,
                      // ),
                    ), //shop description
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
