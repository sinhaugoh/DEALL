import 'package:deall/core/presentation/const/themedata_swatch_color.dart';
import 'package:flutter/material.dart';
import 'package:deall/core/presentation/const/size_config.dart';
import 'package:google_fonts/google_fonts.dart';

class StyleTheme{
  StyleTheme._();

  static const Color appBackgroundColor = Color(0xFFFFF7EC);
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
    headline6: _titleLight,
    subtitle2: _subTitleLight,
    button: _buttonLight,
    headline4: _greetingLight,
    headline3: _searchLight,
    bodyText1: _selectedTabLight,
    bodyText2: _unSelectedTabLight,  
  );

  static final TextStyle _titleLight = TextStyle(
    color: Colors.black,
    fontSize: 8.0 * SizeConfig.textMultiplier,
    fontWeight: FontWeight.w500
  );

  static final TextStyle _subTitleLight = TextStyle(
    color: subTitleTextColor,
    fontSize: 2.5 * SizeConfig.textMultiplier,
    // height: 1.5,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w200
  );

  static final TextStyle _buttonLight = TextStyle(
    color: Colors.black,
    fontSize: 2.5 * SizeConfig.textMultiplier,
  );

  static final TextStyle _greetingLight = TextStyle(
    color: Colors.black,
    fontSize: 2.0 * SizeConfig.textMultiplier,
  );

  static final TextStyle _searchLight = TextStyle(
    color: Colors.red,
    fontSize: 2.3 * SizeConfig.textMultiplier,
  );

  static final TextStyle _selectedTabLight = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 2 * SizeConfig.textMultiplier,
  );

  static final TextStyle _unSelectedTabLight = TextStyle(
    color: Colors.grey,
    fontSize: 2 * SizeConfig.textMultiplier,
  );
}