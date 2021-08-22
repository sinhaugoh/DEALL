import 'package:deall/consumer/shared/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchBarWithFilterButton extends ConsumerWidget {
  final TextEditingController textEditingController;
  const SearchBarWithFilterButton({
    Key? key,
    required this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mq = MediaQuery.of(context);
    return Container(
    // color: Colors.yellow,
    alignment: Alignment.center,
    height: mq.size.height * 0.1,

    child: Padding(
      padding: const EdgeInsets.fromLTRB(50, 8, 50, 8),
      child: IntrinsicHeight(
        child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      // #1
      // Expanded(child: SearchBar()), 
      Expanded(
        child: TextField(
          controller: textEditingController,
          onSubmitted:
              ref.read(retailerListNotifierProvider.notifier).searchWithTerm,
          decoration: InputDecoration(
            
            hintText: 'Search',
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            fillColor: Colors.grey.withOpacity(0.1),
            filled: true,
            contentPadding: const EdgeInsets.fromLTRB(2, 5, 2, 5),
            suffixIcon: IconButton(onPressed: (){
              //filter menu
            }, 
            icon: const Icon(Icons.arrow_forward)),
          // child: TextField(
          //   controller: textEditingController,
          //   onSubmitted:
          //       ref.read(retailerListNotifierProvider.notifier).searchWithTerm,
          // ),
          ),
        ),
      ),
      // #2
      Align(
        alignment: Alignment.centerRight,
        child: IconButton(
          color: Colors.grey,
          onPressed: (){
          
          }, 
          icon: const Icon(
            Icons.filter_alt_outlined)
          ),
      ),
        ],),
      )
    ),
        );
  }
}

// class SearchBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: textEditingController,
//       onSubmitted:
//           ref.read(retailerListNotifierProvider.notifier).searchWithTerm,
//       decoration: InputDecoration(
        
//         hintText: 'Search',
//         prefixIcon: Icon(Icons.search),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: BorderSide.none,
//         ),
//         fillColor: Colors.grey.withOpacity(0.1),
//         filled: true,
//         contentPadding: EdgeInsets.fromLTRB(2, 5, 2, 5),
//         suffixIcon: IconButton(onPressed: (){
//           //filter menu
//         }, 
//         icon: Icon(Icons.arrow_forward)),
//       // child: TextField(
//       //   controller: textEditingController,
//       //   onSubmitted:
//       //       ref.read(retailerListNotifierProvider.notifier).searchWithTerm,
//       // ),
//       ),
//     );
//   }
// }
