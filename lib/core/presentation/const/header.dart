import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Header{

  //Top Bar
  AppBar headerBar(BuildContext context){
    return AppBar(
      iconTheme: IconThemeData(
        color: Colors.black, //change your color here
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      title: const DeallLogo(0.125,0.02),
      centerTitle: true,
    );
  }

  //Font type
  TextStyle deallFont(BuildContext context, Color c){
    return GoogleFonts.cantarell(
      textStyle: Theme.of(context).textTheme.headline5,
      // fontSize: d,
      color: c,
      fontWeight: FontWeight.w100,
    );
  }

}

//LOGO
class DeallLogo extends StatelessWidget{
  // final double d;
  final double w;
  final double h;
  

  const DeallLogo(this.w, this.h);
  // const DeallLogo(this.d, this.w, this.h);

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
            style: Header().deallFont(context, Colors.black),
            children:  <TextSpan>[
              TextSpan(
                text: 'L', 
                style: Header().deallFont(context, Colors.red)
              ),
            ],
          ),
        ),
      ),
    );
  }
} 