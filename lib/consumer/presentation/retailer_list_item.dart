import 'package:deall/consumer/presentation/widgets/custom_card.dart';
import 'package:deall/core/application/retailer.dart';
import 'package:deall/core/presentation/widgets/images.dart';
import 'package:flutter/material.dart';

class RetailerItem extends StatelessWidget {
  final Retailer retailerData;
  const RetailerItem({Key? key, required this.retailerData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return Container(
      // color: Colors.tealAccent,
      padding: EdgeInsets.only(
        left: mq.size.width * 0.05,
        right: mq.size.width * 0.05,
        top: mq.size.width * 0.03,
      ),
      height: mq.size.height * 0.2,
      width: mq.size.width * 0.9,
      child: CustomCard(retailerData: retailerData)
    );
  }
}

// ListTile(
//               isThreeLine: true,
//               leading: ClipRRect(
//                 borderRadius: BorderRadius.circular(20.0),//or 15.0
//                 child: Container(
//                   // height: 200.0, //doesnt work
//                   // width: 100.0,
//                   color: Color(0xffFF0E58),
//                   child: Image.asset(Images.logoIconNoBorder),
//                 ),
//               ),
//               title: Text(retailerData.name),
//               subtitle: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Divider(),
//                   Text(
//                     "${retailerData.operatingHours} \n ${retailerData.description.toString()}",
//                     maxLines: 5,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ],
//               ),
//               // subtitle: Column(
//               //   crossAxisAlignment: CrossAxisAlignment.start,
//               //   children: [
//               //     Text('${retailerData.operatingHours}'),
//               //     // Divider(),
//               //     Text(retailerData.description.toString())
//               //   ],
//               // ),
//               trailing: Icon(Icons.add),
//             ),
