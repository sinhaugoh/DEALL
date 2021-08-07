import 'package:deall/core/application/retailer.dart';
import 'package:deall/core/presentation/widgets/images.dart';
import 'package:flutter/material.dart';

class RetailerItem extends StatelessWidget {
  final Retailer retailerData;
  const RetailerItem({Key? key, required this.retailerData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return Container(
      // color: Colors.tealAccent,
      padding: EdgeInsets.only(
        left: mq.size.width * 0.05,
        right: mq.size.width * 0.05,
        top: mq.size.width * 0.01,
      ),
      height: mq.size.height * 0.2,
      width: mq.size.width * 0.9,
      child: Card(
        // color: Colors.grey,
        elevation: 2,
        child: Row(
          children: [
            Flexible(
              flex: 3,
              //image
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Placeholder(),
              ),
            ),
            Flexible(
              flex: 6,
              child: Column(
                children: [
                  Flexible(
                    flex: 3,
                    child: Container(
                      color: Colors.cyan,
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ConstrainedBox(
                          //adjust constraints
                          constraints: BoxConstraints(maxHeight: 50),
                          child: Text(
                            retailerData.name,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      )
                    ), //shop name
                  ),
                  Flexible(
                    flex: 3,
                    child: Container(
                      color: Colors.red,
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ConstrainedBox(
                          //adjust constraints
                          constraints: BoxConstraints(maxHeight: 100),
                          child: Text(
                              "54class SearchBarWithFilterButton extends StatelessWidget3m, ${retailerData.operatingHours}",
                              overflow: TextOverflow.ellipsis,//dist and opening hours
                            ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    child: Container(
                      color: Colors.green,
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(maxHeight: 100),
                          child: Text(
                            retailerData.description.toString(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                        ),
                      ),
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
