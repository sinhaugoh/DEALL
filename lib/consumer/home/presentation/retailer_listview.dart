import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:deall/consumer/home/presentation/retailer_list_item.dart';
import 'package:deall/core/shared/retailer_provider.dart';
import 'package:deall/core/application/retailer.dart';

class RetailerListView extends ConsumerWidget {
  const RetailerListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<List<Retailer>?>(
      future: RetailerProvider().getRetailerList(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const CircularProgressIndicator();
          default:
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) => ProviderScope(
                  child: RetailerItem(
                    retailerData: snapshot.data![index],
                  ),
                ),
              );
            }
        }
      },
    );
  }
}
