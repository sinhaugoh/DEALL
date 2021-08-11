import 'package:deall/core/application/retailer.dart';
import 'package:deall/core/presentation/widgets/images.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Retailer retailerData;

  const CustomCard({Key? key, required this.retailerData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

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
              // retailerData.image.toString() == '' ? 
                  // FittedBox(
                  //   clipBehavior: Clip.hardEdge,
                  //   child: Image.asset(
                  //     Images.imageNotFound, 
                  //     fit: BoxFit.cover,
                  //     // width: MediaQuery.of(context).size.width,
                  //     // height: MediaQuery.of(context).size.height,
                  //     scale: 1.1,
                  //   ),
                  // ) : Image.network(retailerData.image, fit: BoxFit.cover,

                // width: 350,
                // height: 340,
                // borderRadius: BorderRadius.circular(20.0),

                // decoration: BoxDecoration(
                //   // image: AssetImage('image-not-found.png'),
                  // borderRadius: BorderRadius.circular(20),
                //       color: Colors.blue,
                //   boxShadow: [
                //     BoxShadow(
                //       color: Colors.grey.withOpacity(0.1),
                //       blurRadius: 20.0,
                      
                //       // spreadRadius: 2.0
                //     ),
                //   ],
                //   image: DecorationImage(
                //     image: retailerData.image.toString() == '' ? FileImage(Images.imageNotFound) : NetworkImage(retailerData.image),
                //     fit: BoxFit.cover,
                //   )
                // ),

                // child: FadeInImage(
                //   width: mediaQuery.size.width,
                //   height: mediaQuery.size.height,
                //   image: NetworkImage(retailerData.image), 
                //   placeholder: AssetImage(Images.logo),
                //   fit: BoxFit.cover,
                // ),

                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: retailerData.image.toString() == '' ? 
                    Image.asset(
                      Images.imageNotFound, 
                      fit: BoxFit.cover,
                      // width: MediaQuery.of(context).size.width,
                      // height: MediaQuery.of(context).size.height,
                    ) : Image.network(retailerData.image, fit: BoxFit.cover,),
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
                    retailerData.name,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "\n${retailerData.operatingHours}",
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.grey),
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      Text(
                         "${retailerData.description.toString()}",
                        //  style: TextStyle(color: Colors.grey),
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