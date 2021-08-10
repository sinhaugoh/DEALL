import 'package:deall/consumer/shared/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class RetailerItem extends ConsumerWidget {
  const RetailerItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(currentRetailerItemIndex);
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
                    child: Text(retailerList[index].name), //shop name
                  ),
                  Flexible(
                    flex: 3,
                    child: Text(
                        "543m, ${retailerList[index].operatingHours}"), //dist and opening hours
                  ),
                  Flexible(
                    flex: 5,
                    child: Text(
                      retailerList[index].description.toString(),
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
