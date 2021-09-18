import 'package:deall/core/presentation/const/themedata_swatch_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class StyleTheme{
  StyleTheme._();

  // static const Color appBackgroundColor = Color(0xFFFFF7EC);
  static const Color appBackgroundColor = Colors.white;
  static const Color appBarBackgroundColor = Color(0xFFF86B6B);
  // static const Color selectedTabBackgroundColor = Color();
  // static const Color unselectedTabBackgroundColor = Color(0xFFF86B6B);
  static const Color subTitleTextColor = Color(0xFF9F988F);

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: StyleTheme.appBackgroundColor,
    brightness: Brightness.light,
    textTheme: lightTextTheme,
    primarySwatch: MaterialColor(0xFFF86B6B, deallAppColor),
  );

  static final TextTheme lightTextTheme = TextTheme(
    // headline1: _headline1,
    headline2: _headline2,
    headline3: _headline3,
    headline4: _headline4,
    headline5: _headline5,
    headline6: _headline6,

    subtitle1: _subtitle1,
    // caption: _caption,
    // button: _buttonLight,

    bodyText1: _bodyText1,  
    bodyText2: _bodyText2,
  );

  // static final TextStyle _headline1 = TextStyle(
  //   color: Colors.black,
  //   fontSize: 32.sp,
  // );

  static final TextStyle _headline2 = GoogleFonts.cantarell(
    color: Colors.white,
    fontSize: 32.sp,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle _headline3 = GoogleFonts.averiaSansLibre(
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle _headline4 = GoogleFonts.averiaSansLibre(
    color: Colors.grey,
    fontSize: 18.sp,
  );

  static final TextStyle _headline5 = GoogleFonts.cantarell(
    color: Colors.black54,
    fontSize: 14.sp,
  );

  static final TextStyle _headline6 = GoogleFonts.cantarell(
    color: Colors.black54,
    fontSize: 13.sp,
  );

  // static final TextStyle _caption = GoogleFonts.cantarell(
  //   // color: appBarBackgroundColor,
  //   fontSize: 10.sp,
  //   // fontWeight: FontWeight.w700,
  //   // fontStyle: FontStyle.italic,
  // );

    static final TextStyle _subtitle1 = TextStyle(
    // color: appBarBackgroundColor,
    fontSize: 16.sp,
  );

  static final TextStyle _bodyText1 = TextStyle(
    color: Colors.grey,
    fontSize: 16.sp,
  );

  static final TextStyle _bodyText2 = TextStyle(
    color: Colors.black87,
    fontSize: 16.sp,
  );
} 