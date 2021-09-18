import 'package:deall/consumer/shared/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      padding: EdgeInsets.fromLTRB(50.w, 8.h, 50.w, 8.h),
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
              borderRadius: BorderRadius.circular(10.w),
              borderSide: BorderSide.none,
            ),
            fillColor: Colors.grey.withOpacity(0.1),
            filled: true,
            contentPadding: EdgeInsets.fromLTRB(2.w, 5.h, 2.w, 5.h),
          ),
        ),
      ),
        ],),
      )
    ),
        );
  }
}