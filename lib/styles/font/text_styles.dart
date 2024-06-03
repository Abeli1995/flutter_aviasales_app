import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CustomTextStyle {
  static TextStyle title1 =
      const TextStyle(fontSize: 22, fontFamily: 'SF-Pro-Display-Semibold');
  static TextStyle title2 =
      const TextStyle(fontSize: 20, fontFamily: 'SF-Pro-Display-Semibold');
  static TextStyle title3 =
      const TextStyle(fontSize: 16, fontFamily: 'SF-Pro-Display-Medium');
  static TextStyle title4 =
      const TextStyle(fontSize: 14, fontFamily: 'SF-Pro-Display-Regular');
  static TextStyle text1 =
      const TextStyle(fontSize: 16, fontFamily: 'SF-Pro-Display-Regular');
  static TextStyle text2 =
      const TextStyle(fontSize: 14, fontFamily: 'SF-Pro-Display-Semibold');
  static TextStyle buttonText1 =
      const TextStyle(fontSize: 16, fontFamily: 'SF-Pro-Display-Regular');
  static TextStyle tabText =
      const TextStyle(fontSize: 10, fontFamily: 'SF-Pro-Display-Regular');

  //не было в макете, пришлось создать собственные
  static TextStyle? textSearch = const TextStyle(
      fontSize: 16,
      fontFamily: 'SF-Pro-Display-Semibold',
      fontWeight: FontWeight.w600);
}
