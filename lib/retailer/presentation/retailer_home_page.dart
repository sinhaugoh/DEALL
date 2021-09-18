import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:deall/consumer/presentation/widgets/custom_appbar.dart';
import 'package:deall/core/application/product/product.dart';
import 'package:deall/core/application/product/product_list_state.dart';
import 'package:deall/core/presentation/widgets/images.dart';
import 'package:deall/retailer/product/application/product_notifier.dart';
import 'package:deall/retailer/product/presentation/widgets/product_listview.dart';
import 'package:deall/retailer/product/shared/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:connectivity/connectivity.dart';

import 'package:deall/core/presentation/routes/app_router.gr.dart';
import 'package:deall/core/presentation/widgets/retailer_drawer_widget.dart';
import 'package:deall/core/shared/providers.dart';
import 'package:deall/retailer/application/retailer_notifier.dart';
import 'package:deall/retailer/shared/providers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path/path.dart';

class RetailerHomePage extends ConsumerStatefulWidget {
  const RetailerHomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RetailerHomePageState();
}

class _RetailerHomePageState extends ConsumerState<RetailerHomePage> {
  StreamSubscription<ConnectivityResult>? _connectivityStreamSubscription;


  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(retailerNotifierProvider.notifier).getRetailer();
      ref.read(productListNotifierProvider.notifier).getProductStream();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _connectivityStreamSubscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<RetailerNotifierState>(
      retailerNotifierProvider,
      (state) {
        state.when(
          initial: () {},
          loading: () {},
          loaded: (retailer, hasConnection) {
            if (!hasConnection) {
              //TODO: use theme snackbar instead
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('No connection'),
                duration: Duration(seconds: 5),
                behavior: SnackBarBehavior.floating,
              ));
            }
          },
          failure: (retailerFailure) => retailerFailure.maybeWhen(
            noConnection: () {
              _connectivityStreamSubscription = ref
                  .read(connectivityProvider)
                  .onConnectivityChanged
                  .listen((result) {
                if (result != ConnectivityResult.none) {
                  ref.read(retailerNotifierProvider.notifier).getRetailer();
                  _connectivityStreamSubscription?.cancel();
                }
              });
            },
            orElse: () {},
          ),
        );
      },
    );

    ref.listen<ProductNotifierState>(productStateNotifierProvider, (state) {
      state.maybeWhen(
          failure: (firestoreFailures) => firestoreFailures.when(
                cancelledOperation: () {},
                objectNotFound: () {},
                unknown: () {
                  //TODO: use theme snackbar instead
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Unexpected error. Please contact support.'),
                    duration: Duration(seconds: 5),
                    behavior: SnackBarBehavior.floating,
                  ));
                },
                noConnection: () {
                  //TODO: use theme snackbar instead
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('No connection'),
                    duration: Duration(seconds: 5),
                    behavior: SnackBarBehavior.floating,
                  ));
                },
              ),
          orElse: () {});
    });

    ref.listen<ProductListState>(productListNotifierProvider, (state) {
      state.when(
        initial: () {},
        loading: () {},
        loaded: (_, hasConnection, hasFirebaseFailure) {
          if (!hasConnection) {
            //TODO: use theme snackbar instead
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('No connection'),
              duration: Duration(seconds: 5),
              behavior: SnackBarBehavior.floating,
            ));
          }

          if (hasFirebaseFailure) {
            //TODO: use theme snackbar instead
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Unexpected error. Please contact support.'),
              duration: Duration(seconds: 5),
              behavior: SnackBarBehavior.floating,
            ));
          }
        },
        noConnection: () {},
        failure: (_) {},
      );
    });

    return Scaffold(
      //reused code from consumerhome
      appBar: CustomAppBar(
        IconButton(onPressed: (){
            if (AutoRouter.of(context).current.name !=
                  RetailerProfileRoute.name) {
                AutoRouter.of(context).popAndPush(const RetailerProfileRoute());
              } else {
                AutoRouter.of(context).pop();
              }
          }, icon: const Icon(Icons.person)
        ),
      ),


      drawer: const RetailerDrawer(),
      body: ref.watch(retailerNotifierProvider).when(
        initial: () {
          return Container();
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        loaded: (retailer, hasConnection) {
          return Column(
            children: [
              Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Enable retailer's visibility.",
                    style: Theme.of(context).textTheme.bodyText1, 
                  ),
                  Switch(
                    onChanged: (value) {
                      ref
                          .read(retailerNotifierProvider.notifier)
                          .toggleVisibility();
                    },
                    value: retailer.visibility,
                  ),
                ],
              ),
              // Container(
              //   width: 1.sw,
              //   height: 0.18.sh,
              //   padding: EdgeInsets.only(
              //     left: 20.w,
              //     right: 20.h,
              //     // bottom: 20.h
              //   ),
              //   child: OutlinedButton(
              //     style: OutlinedButton.styleFrom(
              //       // padding: EdgeInsets.all(56.0.w),
              //       // textStyle: const TextStyle(fontSize: 20),
              //       side: BorderSide(color: Colors.black26),
              //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.w))
              //     ),
              //     onPressed: () {
              //       AutoRouter.of(context).push(const AddProductRoute());
              //     },
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: <Widget>[
              //         Text("Add Product"),
              //         Icon(Icons.add_circle)
              //       ],
              //     )
              //   ),
              // ),
              Container(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.w,right: 25.w,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.add_circle_outline
                        ),
                      iconSize: 30.h,
                      color: Colors.black45,
                        onPressed: () {
                          AutoRouter.of(context).push(const AddProductRoute());
                        },
                      ),
                      Text(
                        "Add Product",
                        style: Theme.of(context).textTheme.bodyText1, 
                      ),
                      SizedBox(width: 10.w),
                      
                      // // CHECKBOX?
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              ref
                                .read(productListNotifierProvider.notifier)
                                .toggleAllOn();
                            },
                            style: ButtonStyle(
                              // backgroundColor: MaterialStateProperty.resolveWith<Color>((states) => Theme.of(context).colorScheme.primary.withOpacity(0.1)),
                              shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
                                return RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.w));
                              }),
                              // side: MaterialStateProperty.resolveWith<BorderSide>((states) => BorderSide(color: Colors.black26)),
                            ),
                            child: const Text(
                              'Show All',
                              textScaleFactor: 0.9,
                            ),
                          ),
                          SizedBox(width: 2.w), 
                          ElevatedButton(
                            onPressed: () {
                              ref
                                  .read(productListNotifierProvider.notifier)
                                  .toggleAllOff();
                            },
                            style: ButtonStyle(
                              // backgroundColor: MaterialStateProperty.resolveWith<Color>((states) => Theme.of(context).colorScheme.primary.withOpacity(0.1)),
                              shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
                                return RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.w));
                              }),
                              // side: MaterialStateProperty.resolveWith<BorderSide>((states) => BorderSide(color: Colors.black26)),
                            ),
                            child: const Text(
                              'Hide All',
                              textScaleFactor: 0.9,
                            ),
                          ),
                        ],
                      ),
                      
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(25.w, 8.h, 25.w, 8.h),
              ),
              const Expanded(
                child: ProductListView()
              ),
            ],
          );
        },
        //TODO: implement no connection page
        failure: (retailerFailure) {
          return Center(
            child: Text(
              retailerFailure.when(
                  noConnection: () => 'No Connection!',
                  unexpected: (_) =>
                      'Unexpected error occured. Please contact admin for more information.',
                  notFound: () =>
                      'User not found in the database. Please contact admin for more information.',
                  authentication: (_) =>
                      'You are not authenticated. Please contact admin for more information.'),
            ),
          );
        },
      ),
    );
  }
}
