import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:deall/core/presentation/widgets/images.dart';
import 'package:deall/core/application/retailer/retailer.dart';
import 'package:deall/core/presentation/routes/app_router.gr.dart';
import 'package:deall/core/presentation/widgets/retailer_drawer_widget.dart';
import 'package:deall/core/presentation/widgets/form_text_field.dart';
import 'package:deall/retailer/shared/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RetailerProfilePage extends ConsumerWidget {
  const RetailerProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final retailer = ref
        .watch(retailerNotifierProvider)
        .maybeMap(loaded: (loadedState) => loadedState.retailer, orElse: () {});

    return Scaffold(
      appBar: AppBar(
        title: Text(retailer?.name ?? ''),
        actions: [
          IconButton(
            onPressed: retailer == null
                ? () {}
                : () {
                    AutoRouter.of(context)
                        .push(EditProfileRoute(retailer: retailer));
                  },
            icon: const Icon(Icons.edit),
          )
        ],
      ),
      drawer: const RetailerDrawer(),
      body: retailer == null
          ? const Center(
              //TODO: implement no connection page
              child: Text('No connection!'),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  // if (retailer.image != '')
                  //   CachedNetworkImage(
                  //     imageUrl: retailer.image,
                  //     placeholder: (context, url) =>
                  //         const CircularProgressIndicator(),
                  //   ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0.w),
                    child: retailer.image == ''
                        ? Image.asset(
                            Images.imageNotFound,
                            fit: BoxFit.fitHeight,
                            // width: MediaQuery.of(context).size.width,
                            // height: MediaQuery.of(context).size.height,
                          )
                        : Image.network(
                            retailer.image,
                            fit: BoxFit.fitHeight,
                          ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20.0.w),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(retailer.operatingHours),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20.0.w),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(retailer.addressLine()),
                    ),
                  ),

                  // Padding(
                  //   padding: const EdgeInsets.all(16.0),
                  //   child: Text(retailer.description),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(16.0),
                  //   child: Text(retailer.operatingHours),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(16.0),
                  //   child: Text(retailer.addressLine()),
                  // ),
                  //Text(retailer.description),
                  //Text(retailer.operatingHours),
                  //Text(retailer.addressLine()),
                ],
              ),
            ),
    );
  }
}
