import 'package:auto_route/auto_route.dart';
import 'package:deall/core/presentation/routes/app_router.gr.dart';
import 'package:deall/core/shared/providers.dart';
import 'package:deall/retailer/product/shared/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductItem extends ConsumerWidget {
  const ProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref.watch(productProvider);
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
                    child: Text(product.name),
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
                        children: product.discountedPrice != 0
                            ? [
                                Text(
                                  product.usualPrice.toString(),
                                  style: const TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                                Text(
                                  product.discountedPrice.toString(),
                                ),
                              ]
                            : [
                                Text(product.usualPrice.toString()),
                              ]),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                IconButton(
                  onPressed: () {
                    AutoRouter.of(context).push(EditProductRoute(product: product));
                  },
                  icon: const Icon(Icons.edit),
                ),
                Switch(
                  value: product.availability,
                  onChanged: (value) {
                    ref
                      .read(productStateNotifierProvider.notifier)
                      .updateProduct(product.copyWith(
                          availability: !product.availability));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
