import 'package:deall/consumer/presentation/widgets/custom_retailer_card.dart';
import 'package:deall/core/shared/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductItem extends ConsumerWidget {
  const ProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref.watch(productProvider);
    // print(product);
    final mq = MediaQuery.of(context);
    return Container(
      padding: EdgeInsets.only(
        left: mq.size.width * 0.05,
        right: mq.size.width * 0.05,
        bottom: mq.size.height*0.015,
      ),
      height: mq.size.height * 0.2,
      width: mq.size.width * 0.9,
      // child: product.availability ? CustomRetailerCard(product: product) : 
      //   Align(
      //     alignment: Alignment.center,
      //     child: Text(
      //       'No products available.'
      //     ),
      //   ) 
      child: CustomRetailerCard(product: product)
    );
  }
}
