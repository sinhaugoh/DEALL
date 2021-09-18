import 'package:deall/core/shared/providers.dart';
import 'package:deall/retailer/product/shared/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'product_list_item.dart';

class ProductListView extends ConsumerWidget {
  const ProductListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(productListNotifierProvider);
    return state.map(
        initial: (_) => Container(),
        noConnection: (_) => const Center(child: Text("No connection")),
        loading: (_) => const Center(child: CircularProgressIndicator()),
        failure: (failure) => Center(child: Text("$failure failure")),
        loaded: (loaded) {
          return ListView.builder(
            itemCount: loaded.products.length,
            itemBuilder: (context, index) => ProviderScope(
              overrides: [
                productProvider.overrideWithValue(loaded.products[index])
              ],
              // notEmpty
              child: const ProductItem(),
            ),
          );
        });
  }
}
