import 'package:flutter/material.dart';

class SizeConfig {
  static double screenWidth = 1;
  static double screenHeight = 1;
  static double defaultSize = 10.0; // قيمة افتراضية
  static Orientation orientation = Orientation.portrait;

  void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    orientation = MediaQuery.of(context).orientation;

    defaultSize = orientation == Orientation.landscape
        ? screenHeight * 0.024
        : screenWidth * 0.024;

    print("this is the default size $defaultSize");
  }
}
