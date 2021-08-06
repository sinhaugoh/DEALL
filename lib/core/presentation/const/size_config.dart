import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class SizeConfig{
  static double _screenWidth = 0;
  static double _screenHeight = 0;
  static double _blockSizeHorizontal = 0;
  static double _blockSizeVertical = 0;

  static double textMultiplier = 0;
  static double imageMultiplier = 0;
  static double heightMultiplier = 0;

  void init(BoxConstraints constraints, Orientation orientation){
  
    // if(orientation == Orientation.portrait){
    //   _screenWidth = constraints.maxWidth;
    //   _screenHeight = constraints.maxHeight;
    // }
    // else{
    //   _screenWidth = constraints.maxHeight;
    //   _screenHeight = constraints.maxWidth;
    // }

    _screenWidth = constraints.maxWidth;
    _screenHeight = constraints.maxHeight;

    _blockSizeHorizontal = _screenWidth/100;
    _blockSizeVertical = _screenHeight/100;

    heightMultiplier = textMultiplier = _blockSizeVertical;
    imageMultiplier = _blockSizeHorizontal;

    print('horizontal: ');
    print(_blockSizeHorizontal);
    print(_blockSizeVertical);
  }

}