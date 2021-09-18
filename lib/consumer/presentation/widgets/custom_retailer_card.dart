import 'package:auto_route/auto_route.dart';
import 'package:deall/core/application/product/product.dart';
import 'package:deall/core/application/retailer/retailer.dart';
import 'package:deall/core/presentation/routes/app_router.gr.dart';
import 'package:deall/core/presentation/widgets/images.dart';
import 'package:deall/core/shared/providers.dart';
import 'package:deall/retailer/product/shared/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRetailerCard extends ConsumerWidget {
  final Product? product;

  const CustomRetailerCard({
    Key? key,
    this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref.watch(productProvider);

    final mediaQuery = MediaQuery.of(context);
    final image = product.image;
    final name = product.name;
    final middleRowText = product.description.toString();
    final lastRowText = product.discountedPrice.toStringAsFixed(2);

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.w)),
      // color: Colors.grey,
      shadowColor: Colors.grey.withOpacity(0.5),
      elevation: 2,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: mediaQuery.size.width,
              height: mediaQuery.size.height,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0.w),
                child: image == ''
                    ? Image.asset(
                        Images.imageNotFound,
                        fit: BoxFit.cover,
                        // ) : Image.network('${retailerData?.image}', fit: BoxFit.cover,),
                      )
                    : Image.network(
                        image,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
          ),
          Expanded(
              flex: 3,
              child: Padding(
                  padding: EdgeInsets.all(8.0.w),
                  child: ListTile(
                    // tileColor: Colors.red,
                    isThreeLine: true,
                    title: Text(
                      // '${retailerData?.name}',
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      //remove
                      style: GoogleFonts.averiaSansLibre(
                        // textStyle: Theme.of(context).textTheme.headline4,
                        fontSize: 20.sp,
                        // fontWeight: FontWeight.w700,
                        // fontStyle: FontStyle.italic,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          // "${retailerData?.operatingHours}",
                          middleRowText,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.cantarell(
                            // textStyle: Theme.of(context).textTheme.headline4,
                            fontSize: 13.sp,
                            // fontWeight: FontWeight.w700,
                            // fontStyle: FontStyle.italic,
                          ),
                        ),
                        // Divider(
                        //   thickness: 1,
                        // ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          children: [
                            Text(
                              product.usualPrice.toStringAsFixed(2),
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.cantarell(
                                  decoration: TextDecoration.lineThrough,
                                  // textStyle: Theme.of(context).textTheme.headline4,
                                  fontSize: 12.sp,
                                  color: Colors.grey
                                  // fontWeight: FontWeight.w700,
                                  // fontStyle: FontStyle.italic,
                                  ),
                                  
                            ),
                            SizedBox(width: 2.w),
                            Wrap(
                            children: product.discountedPrice != 0
                                ? [
                                    // Text(
                                    //   "\$${retailerData?.description.toString()}",
                                    //   style: const TextStyle(
                                    //     decoration: TextDecoration.lineThrough,
                                    //   ),
                                    // ),
                                    SizedBox(width: 7.w),
                                    Text(
                                      "\$${product.discountedPrice.toStringAsFixed(2)}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.sp,
                                      ),
                                    ),
                                  ]
                                : [
                                    Text("\$${product.usualPrice.toStringAsFixed(2)}"),
                                  ]),
                            // Text(
                            //   // "${retailerData?.description.toString()}",
                            //   lastRowText,
                            //   maxLines: 2,
                            //   overflow: TextOverflow.ellipsis,
                            //   style: GoogleFonts.cantarell(
                            //       // textStyle: Theme.of(context).textTheme.headline4,
                            //       fontSize: 14.sp,
                            //       color: Colors.grey
                            //       // fontWeight: FontWeight.w700,
                            //       // fontStyle: FontStyle.italic,
                            //       ),
                            // ),
                          ],
                        )
                      ],
                    ),
                    // trailing: Column(
                    //   children: [
                    //     Flexible(
                    //       child: IconButton(
                    //         onPressed: () {
                    //           AutoRouter.of(context).push(EditProductRoute(product: product));
                    //         },
                    //         icon: const Icon(Icons.edit),
                    //       ),
                    //     ),
                    //     // SizedBox(height: 50.h,),
                    //     Flexible(
                    //       child: Switch(
                    //         value: product.availability,
                    //         onChanged: (value) {
                    //           ref
                    //             .read(productStateNotifierProvider.notifier)
                    //             .updateProduct(product.copyWith(
                    //                 availability: !product.availability));
                    //         },
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ))),
          Flexible(
            child: Column(children: [
              Flexible(
                child: IconButton(
                  onPressed: () {
                    AutoRouter.of(context)
                        .push(EditProductRoute(product: product));
                  },
                  icon: const Icon(Icons.edit),
                ),
              ),
              // SizedBox(height: 50.h,),
              Flexible(
                child: Switch(
                  value: product.availability,
                  onChanged: (value) {
                    ref
                        .read(productStateNotifierProvider.notifier)
                        .updateProduct(product.copyWith(
                            availability: !product.availability));
                  },
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
