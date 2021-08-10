import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:deall/core/presentation/routes/app_router.gr.dart';
import 'package:deall/core/presentation/widgets/consumer_drawer_widget.dart';
import 'package:deall/retailer/shared/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      drawer: const ConsumerDrawer(),
      body: retailer == null
          ? const Center(
              //TODO: implement no connection page
              child: Text('No connection!'),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  if (retailer.image != '')
                    CachedNetworkImage(
                      imageUrl: retailer.image,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                    ),
                  Text(retailer.description),
                  Text(retailer.operatingHours),
                  Text(retailer.addressLine()),
                ],
              ),
            ),
    );
  }
}
