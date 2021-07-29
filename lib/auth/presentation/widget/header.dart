import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Header{

  //Top Bar
  AppBar HeaderBar(BuildContext context){
    return AppBar(
      iconTheme: IconThemeData(
        color: Colors.black, //change your color here
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      title: DeallLogo(16),
      centerTitle: true,
    );
  }
  
  //Font type
  TextStyle Font(BuildContext context, double d){
    return GoogleFonts.cantarell(
      textStyle: Theme.of(context).textTheme.headline5,
      fontSize: d,
      fontWeight: FontWeight.w100,
    );
  }

}

//LOGO
class DeallLogo extends StatelessWidget{
  final double d;

  DeallLogo(this.d);

  @override
  Widget build(BuildContext context){
    return RichText(
      text: TextSpan(
        text: 'DEAL',
        style: Header().Font(context, d),
        children:  <TextSpan>[
          TextSpan(
            text: 'L', 
            style: GoogleFonts.cantarell(
              textStyle: Theme.of(context).textTheme.headline5,
              fontSize: d,
              fontWeight: FontWeight.w200,
              color: Colors.red
            ),
          ),
        ],
      ),
    );
  }
}