import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:connectivity/connectivity.dart';
import 'package:deall/consumer/application/favourite_retailer_notifier.dart';
import 'package:deall/consumer/presentation/widgets/consumer_product_item.dart';
import 'package:deall/consumer/shared/providers.dart';
import 'package:deall/core/application/product/product_list_state.dart';
import 'package:deall/core/application/retailer/retailer.dart';
import 'package:deall/core/presentation/routes/app_router.gr.dart';
import 'package:deall/core/presentation/widgets/images.dart';
import 'package:deall/core/shared/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConsumerProductListPage extends ConsumerStatefulWidget {
  final Retailer retailerData;
  const ConsumerProductListPage(this.retailerData, {Key? key})
      : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      ConsumerProductListPageState();
}

class ConsumerProductListPageState
    extends ConsumerState<ConsumerProductListPage> {
  StreamSubscription<ConnectivityResult>? _connectivityStreamSubscription;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref
          .read(productNotifierProvider.notifier)
          .getProductList(widget.retailerData.id);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _connectivityStreamSubscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(productNotifierProvider);
    ref.listen<FavouriteRetailerState>(favouriteRetailerStateNotifierProvider,
        (state) {
      state.maybeWhen(
        loaded: (_, hasConnection) {
          if (!hasConnection) {
            //TODO: use theme snackbar instead
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('No connection'),
              duration: Duration(seconds: 5),
              behavior: SnackBarBehavior.floating,
            ));
          }
        },
        orElse: () {},
      );
    });

    ref.listen<ProductListState>(
      productNotifierProvider,
      (state) {
        state.when(
          initial: () {},
          loading: () {},
          loaded: (_, hasConnection, hasFirebaseFailure) {},
          noConnection: () {
            //TODO: use theme snackbar instead
            _connectivityStreamSubscription = ref
                .read(connectivityProvider)
                .onConnectivityChanged
                .listen((result) {
              if (result != ConnectivityResult.none) {
                ref
                    .read(productNotifierProvider.notifier)
                    .getProductList(widget.retailerData.id);
                _connectivityStreamSubscription?.cancel();
              }
            });
          },
          failure: (failure) {
            //TODO: use theme snackbar instead
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Unexpected error. Please contact support.'),
              duration: Duration(seconds: 5),
              behavior: SnackBarBehavior.floating,
            ));
          },
        );
      },
    );

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120.h,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(350.w, 40.h),
          ),
        ),
        title: Center(child: Text(
            widget.retailerData.name,
            //style
          )
        ),
        actions: [
          IconButton(onPressed: (){
            if (AutoRouter.of(context).current.name != FavouriteRetailerRoute.name) {
                    AutoRouter.of(context).popAndPush(const FavouriteRetailerRoute());
                  } else {
                    AutoRouter.of(context).pop();
                  }
          }, icon: const Icon(Icons.star)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: upperPortionOfPage(context, widget.retailerData, ref),
          ),
          Expanded(
            flex: 3,
            child: state.map(
              initial: (_) => const Center(),
              loading: (_) => const Center(
                child: CircularProgressIndicator(),
              ),
              noConnection: (noConnection) => const Center(
                  child: Text("Please check your device's connection.")),
              failure: (failure) => Center(child: Text("$failure failure")),
              loaded: (loaded) => RefreshIndicator(
                onRefresh: () async {
                  await ref
                      .read(productNotifierProvider.notifier)
                      .getProductList(widget.retailerData.id);
                },
                child: loaded.products.isNotEmpty ? ListView.builder(
                  itemCount: loaded.products.length,
                  itemBuilder: (context, index) => ProviderScope(
                    overrides: [
                      currentProductItem
                          .overrideWithValue(loaded.products[index])
                    ],
                    child: const ConsumerProductItem(),
                  ),
                ) : Padding(
                  padding: EdgeInsets.only(top: 100.h),
                  child: const Text('No products available.'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget upperPortionOfPage(
    BuildContext context, Retailer retailerData, WidgetRef ref) {
  final mq = MediaQuery.of(context);
  return SizedBox(
    height: mq.size.height * 0.2,
    child: Column(
      children: [
        Expanded(
          flex: 6,
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                // bottom: BorderSide(width: 2),
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 7,
                  child: Padding(
                    padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 20.h),
                    // child: Placeholder(),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 175.w, maxHeight: 175.h),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0.w),
                        child: retailerData.image.toString() == ''
                          ? Image.asset(
                              Images.imageNotFound,
                              fit: BoxFit.cover,
                              // width: MediaQuery.of(context).size.width,
                              // height: MediaQuery.of(context).size.height,
                            )
                          : Image.network(
                              retailerData.image,
                              fit: BoxFit.cover,
                            ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: GestureDetector(
                      onTap: () {
                        AutoRouter.of(context).push(ConsumerRetailerDetailRoute(
                            retailerData: retailerData));
                      },
                      child: const Text(
                        "Show Details",
                        style: TextStyle(decoration: TextDecoration.underline)
                      )
                    ),
                  ),
                ),
                
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 30.w, right: 30.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                retailerData.visibility
                    ? const Text("Available Deals")
                    : const Text("Deals Unavailable"),
                IconButton(
                  onPressed: () {
                    ref
                        .read(favouriteRetailerStateNotifierProvider.notifier)
                        .toggleFavouriteRetailer(retailerData);
                  },
                  icon: ref
                      .watch(favouriteRetailerStateNotifierProvider)
                      .maybeWhen(
                        loaded: (retailerList, _) {
                          if (retailerList.contains(retailerData)) {
                            return const Icon(Icons.favorite);
                          } else {
                            return const Icon(Icons.favorite_border_outlined);
                          }
                        },
                        orElse: () => const Icon(
                          Icons.favorite_border_outlined,
                        ),
                      ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
