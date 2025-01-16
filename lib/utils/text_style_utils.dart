import 'package:flutter/material.dart';

class TextStyleUtils {
  static TextStyle generalPoppinMediumTextStyle(double fontsize, Color? color) {
    return TextStyle(fontFamily: "Poppins-Medium", fontSize: fontsize, color: color ?? Colors.black);
  }

  static TextStyle generalPoppinBoldTextStyle(double fontsize, Color? color) {
    return TextStyle(fontFamily: "Poppins-Bold", fontSize: fontsize, color: color ?? Colors.black);
  }

  static TextStyle generalPoppinRegularTextStyle(double fontsize, Color? color) {
    return TextStyle(fontFamily: "Poppins-Regular", fontSize: fontsize, color: color ?? Colors.black);
  }

  static TextStyle generalPoppinLightTextStyle(double fontsize, Color? color) {
    return TextStyle(fontFamily: "Poppins-Light", fontSize: fontsize, color: color ?? Colors.black);
  }

  static TextStyle generalPoppinSemiBoldTextStyle(double fontsize, Color? color) {
    return TextStyle(fontFamily: "Poppins-SemiBold", fontSize: fontsize, color: color ?? Colors.black);
  }
}
