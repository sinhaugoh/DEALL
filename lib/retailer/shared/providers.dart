import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:deall/core/shared/providers.dart';
import 'package:deall/retailer/application/add_product_form_notifier.dart';
import 'package:deall/retailer/application/add_product_form_state.dart';

final addProductFormNotifierProvider = StateNotifierProvider.autoDispose<
        AddProductFormNotifier, AddProductFormState>(
    (ref) => AddProductFormNotifier(
          ref.watch(productListRepoProvider),
          ref.watch(imagePickingRepositoryProvider),
        ));
