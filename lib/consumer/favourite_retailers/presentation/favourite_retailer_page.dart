import 'package:deall/consumer/shared/providers.dart';
import 'package:deall/core/presentation/widgets/consumer_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavouriteRetailerPage extends ConsumerWidget {
  const FavouriteRetailerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite'),
      ),
      drawer: const ConsumerDrawer(),
      body: RefreshIndicator(
        onRefresh: () async {
          ref
              .read(favouriteRetailerStateNotifierProvider.notifier)
              .getRetailerList();
        },
        child: ref.watch(favouriteRetailerStateNotifierProvider).when(
          initial: () {
            return Container();
          },
          loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          loaded: (retailerList, _) {
            return ListView.builder(
                itemCount: retailerList.length,
                itemBuilder: (context, index) {
                  return Text(retailerList[index].toString());
                });
          },
          failure: (firestoreFailure) {
            return firestoreFailure.maybeWhen(
                noConnection: () => const Center(
                      child: Text('No connection'),
                    ),
                orElse: () {
                  return const Center(
                    child: Text('Unexpected error. Please contact support.'),
                  );
                });
          },
        ),
      ),
    );
  }
}
