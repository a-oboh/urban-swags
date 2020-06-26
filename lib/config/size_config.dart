import 'package:flutter/material.dart';

//A custom class for handling text size, margin szie and other responsiveness related issues
class SizeConfig {
  // static keyword included so you can call this method without instantiating an object of it like so :
  // SizeConfig.height(context, 2)
  static double height(BuildContext context, double height) {
    double screenHeight = MediaQuery.of(context).size.height / 100;
    return height * screenHeight;
  }

  static double width(BuildContext context, double width) {
    double screenWidth = MediaQuery.of(context).size.width / 100;
    return width * screenWidth;
  }

  static double textSize(BuildContext context, double textSize) {
    double screenWidth = MediaQuery.of(context).size.width / 100;
    return textSize * screenWidth;
  }
}
