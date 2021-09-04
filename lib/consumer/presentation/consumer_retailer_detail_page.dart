import 'package:deall/core/application/retailer/retailer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:deall/core/presentation/widgets/images.dart';

class ConsumerRetailerDetailPage extends StatelessWidget {
  final Retailer retailerData;
  const ConsumerRetailerDetailPage(this.retailerData, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(retailerData.name),
      ),
      body: retailerData == null
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
                  SizedBox(
                    height: 30.h,
                  ),

                  SizedBox(
                    height: 200.h,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0.w),
                      child: retailerData.image == ''
                          ? Image.asset(
                              Images.imageNotFound,
                              fit: BoxFit.fitHeight,
                              // width: MediaQuery.of(context).size.width,
                              // height: MediaQuery.of(context).size.height,
                            )
                          : Image.network(
                              retailerData.image,
                              fit: BoxFit.fitHeight,
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
                            if (retailerData.description.isEmpty != true)
                              TextSpan(
                                  text: retailerData.description,
                                  style: TextStyle(color: Colors.grey))
                            else
                              const TextSpan(
                                  text: 'No content has been found',
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
                            if (retailerData.operatingHours.isEmpty != true)
                              TextSpan(
                                  text: retailerData.operatingHours,
                                  style: TextStyle(color: Colors.grey))
                            else
                              const TextSpan(
                                  text: 'No content has been found',
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
                            if (retailerData.addressLine().isEmpty != true)
                              TextSpan(
                                  text: retailerData.addressLine(),
                                  style: TextStyle(color: Colors.grey))
                            else
                              const TextSpan(
                                  text: 'No content has been found',
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
