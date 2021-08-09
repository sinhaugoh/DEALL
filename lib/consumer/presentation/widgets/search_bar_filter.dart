import 'package:flutter/material.dart';

class SearchBarWithFilterButton extends StatelessWidget {
  const SearchBarWithFilterButton({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return Container(
      // color: Colors.yellow,
      alignment: Alignment.center,
      height: mq.size.height * 0.1,
      // child: Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
      //   child: IconButton(
      //     onPressed: (){}, 
      //     icon: Icon(Icons.filter_alt_outlined),
      //     color: Colors.grey,
      //   ),
      // )

      child: Padding(
        padding: const EdgeInsets.fromLTRB(50, 8, 50, 8),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            fillColor: Colors.grey.withOpacity(0.1),
            filled: true,
            contentPadding: EdgeInsets.fromLTRB(2, 5, 2, 5),
            suffixIcon: IconButton(onPressed: (){
              //filter menu
            }, 
            icon: Icon(Icons.filter_alt_outlined))
          ),
        ),
      ),
    );
  }
}