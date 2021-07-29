import 'package:deall/core/presentation/const/font.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//LOGO
class Logo extends StatelessWidget{
  // final double d;
  final double w;
  final double h;
  

  const Logo(this.w, this.h);

  @override
  Widget build(BuildContext context){
    final mq = MediaQuery.of(context);

    return Container(
      width: mq.size.width * w,
      height: mq.size.height * h,
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: RichText(
          text: TextSpan(
            text: 'DEAL',
            style: deallAppFont(context, Colors.black),
            children:  <TextSpan>[
              TextSpan(
                text: 'L', 
                style: deallAppFont(context, Colors.red)
              ),
            ],
          ),
        ),
      ),
    );
  }
} 