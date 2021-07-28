import 'package:flutter/material.dart';

class SearchBarWithFilterButton extends StatelessWidget {
  const SearchBarWithFilterButton({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return Container(
      height: mq.size.height * 0.1,
    );
  }
}