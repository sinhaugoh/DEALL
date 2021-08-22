import 'package:deall/core/presentation/const/themedata_swatch_color.dart';
import 'package:flutter/material.dart';
import 'package:deall/core/presentation/const/size_config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


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
    headline1: _titleLight,
    subtitle2: _subTitleLight,
    button: _buttonLight,
    bodyText2: _selectedTabLight,
  );

  static final TextStyle _titleLight = TextStyle(
    color: Colors.black,
    fontSize: 32.sp,
  );

  static final TextStyle _subTitleLight = TextStyle(
    color: subTitleTextColor,
    fontSize: 18.sp,
  );

  static final TextStyle _buttonLight = TextStyle(
    color: Colors.black,
    fontSize: 14.sp,
  );

  static final TextStyle _selectedTabLight = TextStyle(
    color: Colors.black,
    fontSize: 16.sp,
  );
} 