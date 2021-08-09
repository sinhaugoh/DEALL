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
        top: mq.size.width * 0.01,
      ),
      height: mq.size.height * 0.2,
      width: mq.size.width * 0.9,
      child: Card(
        color: Colors.grey,
        elevation: 2,
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),//or 15.0
            child: Container(
              height: 200.0, //doesnt work
              width: 100.0,
              color: Color(0xffFF0E58),
              // child: Icon(Icons.volume_up, color: Colors.white, size: 50.0),
            ),
          ),
          title: Text(retailerData.name),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${retailerData.operatingHours}'),
              Divider(),
              Text(retailerData.description.toString())
            ],
          ),
          trailing: Text('trail'),
        ),
        // child: Row(
        //   children: [
        //     Flexible(
        //       flex: 3,
        //       //image
        //       child: Padding(
        //         padding: EdgeInsets.all(8.0),
        //         child: Placeholder(),
        //       ),
        //     ),
        //     Flexible(
        //       flex: 6,
        //       child: Card(
        //         child: Column(
        //           children: <Widget>[
        //             ListTile(
        //               leading: Icon(Icons.album)
        //             )
        //           ],
        //         )
        //       )
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
