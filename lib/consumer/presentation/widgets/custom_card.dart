import 'package:deall/core/application/retailer/retailer.dart';
import 'package:deall/core/presentation/widgets/images.dart';
import 'package:flutter/material.dart';
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
        shadowColor: Colors.grey.withOpacity(0.5),
        elevation: 2,
        child: Row(
          children: [

            Expanded(
              child: SizedBox(
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
                  isThreeLine: true,
                  title: Text(
                    name!,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5.h,),
                      Text(
                        middleRowText!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      // Divider(
                      //   thickness: 1,
                      // ),
                      SizedBox(height: 2.h,),
                      Text(
                        lastRowText!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline5,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                      ],
                    ),
                  )))
        ],
      ),
    );
  }
}
