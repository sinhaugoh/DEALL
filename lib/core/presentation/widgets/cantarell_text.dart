

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CantarellText extends StatelessWidget {
  final String text;
  final Color? color;
  //fontweight?
  //headline

  const CantarellText(this.text, {Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:  GoogleFonts.cantarell(
        textStyle: Theme.of(context).textTheme.headline5,
        // fontSize: d,
        color: color,
        fontWeight: FontWeight.w100,
      )
    );
  }
}