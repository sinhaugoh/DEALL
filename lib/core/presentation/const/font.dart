import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


// deallAppFont =
TextStyle deallAppFont(BuildContext context, Color c){
  return GoogleFonts.cantarell(
    textStyle: Theme.of(context).textTheme.headline5,
    // fontSize: d,
    color: c,
    fontWeight: FontWeight.w100,
  );
}