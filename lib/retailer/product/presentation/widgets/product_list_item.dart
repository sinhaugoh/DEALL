import 'package:auto_route/auto_route.dart';
import 'package:deall/consumer/presentation/widgets/custom_card.dart';
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
        bottom: mq.size.height*0.015,
      ),
      height: mq.size.height * 0.2,
      width: mq.size.width * 0.9,
      child: CustomCard(product: product)
    );
  }
}
