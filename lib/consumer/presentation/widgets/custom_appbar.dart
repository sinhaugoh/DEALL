import 'package:deall/core/presentation/widgets/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget{
  // final IconButton? iconbtn;

  @override
  final Size preferredSize;

  // CustomAppBar(this.iconbtn, {Key? key}) : preferredSize = Size.fromHeight(140.h),
  CustomAppBar({Key? key}) : preferredSize = Size.fromHeight(140.h),
        
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        toolbarHeight: 140.h,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(350.w, 50.h),
          ),
        ),
        title: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 35.h),
          child: Image.asset(Images.logoTextWhite)
        ),
        // actions: [
        //   // iconbtn!,
        // ],
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.white
        ),
        centerTitle: true,
    );
  }
}