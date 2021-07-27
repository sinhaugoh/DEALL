import 'package:deall/consumer/home/shared/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:deall/consumer/home/presentation/retailer_list_item.dart';
import 'package:deall/core/shared/retailer_provider.dart';
import 'package:deall/core/application/retailer.dart';

class RetailerListView extends ConsumerWidget {
  const RetailerListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(retailerListNotifierProvider);

    return state.map(
      initial: (_) {
        print('initial');
        return Container();
      },
      loading: (_) {
        print('loading');
        return Center(
          child: CircularProgressIndicator(),
        );
      },
      loaded: (loaded) {
        print('loaded');
        final retailerList = loaded.retailers;
        return ListView.builder(
            itemCount: retailerList.length,
            itemBuilder: (context, index) {
              return RetailerItem(retailerData: retailerList[index]);
            });
      },
      failure: (failure) {
        print('failure');
        return Center(
          child: Text(
            failure.message,
            style: TextStyle(color: Colors.red),
          ),
        );
      },
    );

    // return FutureBuilder<List<Retailer>?>(
    //   future: RetailerProvider().getRetailerList(),
    //   builder: (context, snapshot) {
    //     switch (snapshot.connectionState) {
    //       case ConnectionState.waiting:
    //         return const CircularProgressIndicator();
    //       default:
    //         if (snapshot.hasError) {
    //           return Text('Error: ${snapshot.error}');
    //         } else {
    //           return ListView.builder(
    //             itemCount: snapshot.data!.length,
    //             itemBuilder: (context, index) => ProviderScope(
    //               child: RetailerItem(
    //                 retailerData: snapshot.data![index],
    //               ),
    //             ),
    //           );
    //         }
    //     }
    //   },
    // );
  }
}
