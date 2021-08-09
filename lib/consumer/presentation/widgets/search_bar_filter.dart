import 'package:flutter/material.dart';

class SearchBarWithFilterButton extends StatelessWidget {
  const SearchBarWithFilterButton({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return Container(
      // color: Colors.yellow,
      alignment: Alignment.centerRight,
      height: mq.size.height * 0.1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: IconButton(
          onPressed: (){}, 
          icon: Icon(Icons.filter_alt_outlined),
          color: Colors.grey,
        ),
      )
    );
  }
}