import 'package:deall/core/application/product/product.dart';
import 'package:deall/core/application/retailer/retailer.dart';
import 'package:deall/core/presentation/widgets/images.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCard extends StatelessWidget {
  final Retailer? retailerData;

  const CustomCard({
    Key? key,
    this.retailerData,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final image = retailerData?.image;
    final name = retailerData?.name;
    final middleRowText = retailerData?.operatingHours;
    final lastRowText = retailerData?.description.toString();
    
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.w)),
        // color: Colors.grey,
        shadowColor: Colors.grey.withOpacity(0.5),
        elevation: 2,
        child: Row(
          children: [

            Expanded(
              flex: 1,
              child: Container(
                width: mediaQuery.size.width,
                height: mediaQuery.size.height,

                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0.w),
                  child: image! == '' ? 
                    Image.asset(
                      Images.imageNotFound, 
                      fit: BoxFit.cover,
                    // ) : Image.network('${retailerData?.image}', fit: BoxFit.cover,),
                    ) : Image.network(image, fit: BoxFit.cover,),
                ),
              ),
            ),
          // ),
          Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(8.0.w),
                child: ListTile(
                  // tileColor: Colors.red,
                  isThreeLine: true,
                  title: Text(
                    // '${retailerData?.name}',
                    name!,
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
                      SizedBox(height: 5.h,),
                      Text(
                        // "${retailerData?.operatingHours}",
                        middleRowText!,
                        maxLines: 3,
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
                      SizedBox(height: 5.h,),
                      Text(
                        // "${retailerData?.description.toString()}",
                        lastRowText!,
                        // maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.cantarell(
                          // textStyle: Theme.of(context).textTheme.headline4,
                          fontSize: 12.sp,
                          color: Colors.grey
                          // fontWeight: FontWeight.w700,
                          // fontStyle: FontStyle.italic,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          retailerData?.description.toString() ?? '',
                          // maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.cantarell(
                              // textStyle: Theme.of(context).textTheme.headline4,
                              fontSize: 12.sp,
                              color: Colors.grey
                              // fontWeight: FontWeight.w700,
                              // fontStyle: FontStyle.italic,
                          ),
                          // Divider(
                          //   thickness: 1,
                          // ),
                        ),
                      ],
                    ),
                    // trailing: Icon(Icons.add),
                  )))
        ],
      ),
    );
  }
}
