import 'package:deall/core/presentation/widgets/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:deall/consumer/shared/providers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConsumerProductItem extends ConsumerWidget {
  const ConsumerProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref.watch(currentProductItem);
    final mediaQuery = MediaQuery.of(context);
    return Container(
      padding: EdgeInsets.only(
        left: mediaQuery.size.width * 0.05,
        right: mediaQuery.size.width * 0.05,
        top: mediaQuery.size.width * 0.035,
      ),
      height: mediaQuery.size.height * 0.2,
      width: mediaQuery.size.width * 0.9,

      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.w)),
        // color: Colors.grey,
        shadowColor: Colors.grey.withOpacity(0.5),
        elevation: 2,
        child: Row(
          children: [
            Expanded(
              // child: Container(
              //   width: mediaQuery.size.width,
              //   height: mediaQuery.size.height,
              //   child: ClipRRect(
              //         borderRadius: BorderRadius.circular(20.0.w),
              //         clipBehavior: Clip.hardEdge,
              //         child: Stack(
              //       children: [
              //         FadeInImage.assetNetwork(
              //           placeholder: "resources/your_placeholder_image.png",
              //           image: product.image,
              //           fit: BoxFit.cover,
              //           width: 120.0,
              //           height: 120.0,
              //         ),
              //         Positioned.fill(
              //           child: Material(
              //               color: Colors.transparent,
              //               child: InkWell(
              //                   splashColor: Colors.lightGreenAccent, onTap: () {})),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              child: Container(
                width: mediaQuery.size.width,
                height: mediaQuery.size.height,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0.w),
                  clipBehavior: Clip.hardEdge,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: product.image.toString() == ''
                        ? Image.asset(
                            Images.imageNotFound,
                          )
                        : Image.network(
                            product.image,
                          ),
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Padding(
                    padding: EdgeInsets.all(8.0.w),
                    child: ListTile(
                      // tileColor: Colors.red,
                      isThreeLine: true,
                      title: Text(
                        product.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        //remove
                        style: GoogleFonts.averiaSansLibre(
                          // textStyle: Theme.of(context).textTheme.headline4,
                          fontSize: 19.sp,
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
                            product.description.toString(),                            
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
                          Wrap(
                            children: product.discountedPrice != 0
                                ? [
                                    Text(
                                      "\$${product.usualPrice.toStringAsFixed(2)}",
                                      style: const TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
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
                          //   product.description.toString(),
                          //   // maxLines: 2,
                          //   overflow: TextOverflow.ellipsis,
                          //   style: GoogleFonts.cantarell(
                          //       // textStyle: Theme.of(context).textTheme.headline4,
                          //       fontSize: 12.sp,
                          //       color: Colors.grey
                          //       // fontWeight: FontWeight.w700,
                          //       // fontStyle: FontStyle.italic,
                          //       ),
                          //   // Divider(
                          //   //   thickness: 1,
                          //   // ),
                          // ),
                        ],
                      ),
                      // trailing: Icon(Icons.add),
                    )))
          ],
        ),
      )


      // child: Card(
      //   elevation: 2,
      //   child: Row(
      //     children: [
      //       const Flexible(
      //         flex: 3,
      //         child: Placeholder(),
      //       ),
      //       Flexible(
      //         flex: 6,
      //         child: Column(
      //           children: [
      //             Flexible(
      //               flex: 3,
      //               child: Text(product.name),
      //             ),
      //             const Flexible(
      //               flex: 5,
      //               child: Text(
      //                 "product description",
      //                 overflow: TextOverflow.ellipsis,
      //                 maxLines: 3,
      //               ),
      //             ),
      //             Flexible(
      //               flex: 3,
      //               child: Wrap(
      //                   children: product.discountedPrice != 0
      //                       ? [
      //                           Text(
      //                             product.usualPrice.toString(),
      //                             style: const TextStyle(
      //                               decoration: TextDecoration.lineThrough,
      //                             ),
      //                           ),
      //                           Text(
      //                             product.discountedPrice.toString(),
      //                           ),
      //                         ]
      //                       : [
      //                           Text(product.usualPrice.toString()),
      //                         ]),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}