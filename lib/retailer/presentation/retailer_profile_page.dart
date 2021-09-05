import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:deall/core/presentation/widgets/images.dart';
import 'package:deall/core/presentation/routes/app_router.gr.dart';
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
      // drawer: const RetailerDrawer(),
      body: retailer == null
          ? const Center(
              //TODO: implement no connection page
              child: Text('No connection!'),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  if (retailer.image != '')
                    SizedBox(
                      height: 200.h,
                      width: 200.w,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0.w),
                        child: CachedNetworkImage(
                          imageUrl: retailer.image,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Transform.scale(
                            scale: 0.2.h,
                            child: const CircularProgressIndicator(),
                          ),
                        ),
                      ),
                    ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20.0.w),
                      ),
                      padding: const EdgeInsets.all(12.0),
                      margin: const EdgeInsets.only(left: 30.0, right: 30.0),
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Description\n',
                                style: TextStyle(
                                    color: Colors.grey.shade700,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold)),
                            if (retailer.description.isNotEmpty)
                              TextSpan(
                                  text: retailer.description,
                                  style: TextStyle(color: Colors.grey))
                            else
                              const TextSpan(
                                  text:
                                      'The retailer has not provided information yet',
                                  style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      color: Colors.grey)),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: 16.h,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20.0.w),
                      ),
                      padding: const EdgeInsets.all(12.0),
                      margin: const EdgeInsets.only(left: 30.0, right: 30.0),
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Operating Hours\n',
                                style: TextStyle(
                                    color: Colors.grey.shade700,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold)),
                            if (retailer.operatingHours.isNotEmpty)
                              TextSpan(
                                  text: retailer.operatingHours,
                                  style: TextStyle(color: Colors.grey))
                            else
                              const TextSpan(
                                  text:
                                      'The retailer has not provided information yet',
                                  style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      color: Colors.grey)),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: 16.h,
                  ),
                  Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20.0.w),
                      ),
                      padding: const EdgeInsets.all(12.0),
                      margin: const EdgeInsets.only(left: 30.0, right: 30.0),
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Address\n',
                                style: TextStyle(
                                    color: Colors.grey.shade700,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold)),
                            if (retailer.addressLine().isNotEmpty)
                              TextSpan(
                                  text: retailer.addressLine(),
                                  style: TextStyle(color: Colors.grey))
                            else
                              const TextSpan(
                                  text:
                                      'The retailer has not provided information yet',
                                  style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      color: Colors.grey)),
                          ],
                        ),
                      )),
                ],
              ),
            ),
    );
  }
}
