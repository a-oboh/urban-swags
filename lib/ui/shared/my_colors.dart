import 'package:flutter/material.dart';

class UrbanAttireColors {
  static const int yellowPrimaryValue = 0xFFEFE6BF;
  static const int darkGreyValue = 0xFF33475B;

  static const MaterialColor yellow = MaterialColor(
    yellowPrimaryValue,
    <int, Color>{
      500: Color(yellowPrimaryValue),
      // 600: Color(0xff1d212f),
    },
  );

  static const MaterialColor darkGrey = MaterialColor(
    darkGreyValue,
    <int, Color>{
      500: Color(darkGreyValue),
    },
  );
}
