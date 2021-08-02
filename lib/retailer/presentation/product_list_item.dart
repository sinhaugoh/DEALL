import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  // final Product productData;
  // const ProductItem({Key? key, required this.retailerData}) : super(key: key);
  const ProductItem({Key? key}) : super(key: key);

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
                children:  [
                  const Flexible(
                    flex: 3,
                    child: Text("product name"),
                  ),
                  const Flexible(
                    flex: 5,
                    child: Text(
                      "product description",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: Wrap(
                      children: const [
                        Text('\$15.99',
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        Text('\$9.99',
                        ),
                      ],
                    ),
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
