import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'product_list_item.dart';

class ProductListView extends ConsumerWidget {
  const ProductListView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // state.map()
    return ListView.builder( 
      itemCount: 1,
      itemBuilder: (context, index) => const ProductItem(/* pass data */),
    );
  }
}