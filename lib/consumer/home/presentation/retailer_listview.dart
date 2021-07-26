import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:deall/consumer/home/presentation/retailer_list_item.dart';

// final currentProductIndex = ScopedProvider<int>((_) => throw UnimplementedError());
// this one need the version of flutter_riverpod: 0.13.0-nullsafety.1
// the purpose of this is so that each RetailerItem can be const so that the items doesn't keep
// getting rebuilt but do we really need it to be const? what scenarios will cause it to rebuilt etc?

class RetailerListView extends StatelessWidget {
  const RetailerListView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
    // replace with future builder next time?
    itemBuilder: (context, index) {
      return ProviderScope(
        // overrides: [], 
        child: RetailerItem(index), // retailer item
      );
    },
  );
  }
}