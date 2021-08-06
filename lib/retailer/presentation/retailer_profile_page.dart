import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:deall/core/presentation/widgets/retailer_drawer_widget.dart';
import 'package:deall/retailer/shared/providers.dart';

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
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.edit))],
      ),
      drawer: const RetailerDrawer(),
      body: retailer == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  if (retailer.image != '')
                    CachedNetworkImage(
                      imageUrl: retailer.image,
                      placeholder: (context, url) => const CircularProgressIndicator(),
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
