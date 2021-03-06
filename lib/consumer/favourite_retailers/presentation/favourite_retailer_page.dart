import 'package:deall/consumer/presentation/retailer_list_item.dart';
import 'package:deall/consumer/shared/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouriteRetailerPage extends ConsumerWidget {
  const FavouriteRetailerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 140.h,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(350.w, 50.h),
          ),
        ),
        title: Text('Favourites', style: Theme.of(context).textTheme.headline2,),
            //style
        // actions: [
        //   // iconbtn!,
        // ],
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.white
        ),
        centerTitle: true,
      ),
      // drawer: const ConsumerDrawer(),
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
                  return ProviderScope(overrides: [
                    currentRetailerItem.overrideWithValue(retailerList[index]),
                  ], child: const RetailerItem());
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
