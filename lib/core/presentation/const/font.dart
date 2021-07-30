import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// font size (use values only)
// font put in core/presentation/widget

// deallAppFont =
TextStyle deallAppFont(BuildContext context, Color c){
  return GoogleFonts.cantarell(
    textStyle: Theme.of(context).textTheme.headline5,
    // fontSize: d,
    color: c,
    fontWeight: FontWeight.w100,
  );
}