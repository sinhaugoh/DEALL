import 'package:deall/auth/shared/providers.dart';
import 'package:deall/core/application/product/product_list_notifier.dart';
import 'package:deall/core/application/product/product_list_state.dart';
import 'package:deall/core/shared/providers.dart';
import 'package:deall/retailer/product/application/add_product_form_notifier.dart';
import 'package:deall/retailer/product/application/add_product_form_state.dart';
import 'package:deall/retailer/product/application/product_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addProductFormNotifierProvider = StateNotifierProvider.autoDispose<
    AddProductFormNotifier, AddProductFormState>(
  (ref) => AddProductFormNotifier(
    ref.watch(productListRepoProvider),
    ref.watch(imagePickingRepositoryProvider),
    ref.watch(authRepositoryProvider),
  ),
);

final productListNotifierProvider =
    StateNotifierProvider<ProductListNotifier, ProductListState>(
        (ref) => ProductListNotifier(ref.watch(productListRepoProvider)));

final productStateNotifierProvider =
    StateNotifierProvider<ProductNotifier, ProductNotifierState>(
        (ref) => ProductNotifier(ref.watch(productListRepoProvider)));
