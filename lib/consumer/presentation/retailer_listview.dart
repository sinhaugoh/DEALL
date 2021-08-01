import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:deall/consumer/shared/providers.dart';

import 'package:deall/consumer/presentation/retailer_list_item.dart';

class RetailerListView extends ConsumerWidget {
  const RetailerListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(retailerListNotifierProvider);

    return state.map(
      initial: (_) => const Center(child: Text("initial")),
      noConnection: (_) => const Center(child: Text("No connection")),
      loading: (_) => const Center(child: CircularProgressIndicator()),
      failure: (failure) => Center(child: Text("$failure failure")),
      loaded: (loaded) => ListView.builder(
        itemCount: loaded.retailers.length,
        itemBuilder: (context, index) => RetailerItem(
          retailerData: loaded.retailers[index],
        ),
      ),
    );
  }
}
