import 'package:deall/core/application/retailer.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Retailer retailerData;

  const CustomCard({Key? key, required this.retailerData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        // color: Colors.grey,
        shadowColor: Colors.grey.withOpacity(0.5),
        elevation: 5,
        child: Row(
          children: [

            Expanded(
              flex: 1,
              child: Container(
                // width: 50,
                // height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 20.0,
                      // spreadRadius: 2.0
                    ),
                  ],
                  image: DecorationImage(
                    image: retailerData.image.toString() == '' ? NetworkImage("https://www.watchuseek.com/attachments/image-not-found-png.15799454/") : NetworkImage(retailerData.image),
                    fit: BoxFit.cover,
                  )
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
                  trailing: Icon(Icons.add),
                )
              )
            )

          ],
        ),
      );
  }
}