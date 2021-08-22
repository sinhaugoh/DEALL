import 'package:deall/core/application/product/product.dart';
import 'package:deall/core/application/retailer/retailer.dart';
import 'package:deall/core/presentation/widgets/images.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCard extends StatelessWidget {
  final Retailer? retailerData;
  final Product? product;

  const CustomCard({
    Key? key, 
    this.retailerData,
    this.product,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    var first = retailerData?.image ?? product?.image;
    var second = retailerData?.name ?? product?.name;
    var third = retailerData?.operatingHours ?? product?.description.toString();
    var fourth = retailerData?.description.toString() ?? product?.discountedPrice.toString();
    
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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
                  borderRadius: BorderRadius.circular(20.0),
                  child: retailerData?.image.toString() == '' ? 
                    Image.asset(
                      Images.imageNotFound, 
                      fit: BoxFit.cover,
                    // ) : Image.network('${retailerData?.image}', fit: BoxFit.cover,),
                    ) : Image.network(first!, fit: BoxFit.cover,),
                ),
              ),
            ),

            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  // tileColor: Colors.red,
                  isThreeLine: true,
                  title: Text(
                    // '${retailerData?.name}',
                    second!,
                    //remove
                    style: GoogleFonts.averiaSansLibre(
                      // textStyle: Theme.of(context).textTheme.headline4,
                      fontSize: 19,
                      // fontWeight: FontWeight.w700,
                      // fontStyle: FontStyle.italic,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5,),
                      Text(
                        // "${retailerData?.operatingHours}",
                        third!,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.cantarell(
                          // textStyle: Theme.of(context).textTheme.headline4,
                          fontSize: 13,
                          // fontWeight: FontWeight.w700,
                          // fontStyle: FontStyle.italic,
                        ),
                      ),
                      // Divider(
                      //   thickness: 1,
                      // ),
                      const SizedBox(height: 5,),
                      Text(
                        // "${retailerData?.description.toString()}",
                        fourth!,
                        // maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.cantarell(
                          // textStyle: Theme.of(context).textTheme.headline4,
                          fontSize: 12,
                          color: Colors.grey
                          // fontWeight: FontWeight.w700,
                          // fontStyle: FontStyle.italic,
                        ),
                      )
                    ],
                  ),
                  // trailing: Icon(Icons.add),
                )
              )
            )

          ],
        ),
      );
  }
}