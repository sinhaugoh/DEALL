import 'package:deall/core/application/retailer.dart';
import 'package:flutter/material.dart';

class RetailerItem extends StatelessWidget {
  final Retailer retailerData;
  const RetailerItem({Key? key, required this.retailerData}) : super(key: key);

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
                children: [
                  Flexible(
                    flex: 3,
                    child: Text(retailerData.name), //shop name
                  ),
                  Flexible(
                    flex: 3,
                    child: Text(
                        "543m, ${retailerData.operatingHours}"), //dist and opening hours
                  ),
                  Flexible(
                    flex: 5,
                    child: Text(
                      retailerData.description.toString(),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
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
