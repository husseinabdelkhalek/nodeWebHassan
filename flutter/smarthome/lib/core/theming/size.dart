import 'package:flutter/material.dart';


extension Router on BuildContext{
 
  //  height using MediaQuery
  double height(double heightsize) =>
      MediaQuery.of(this).size.height * heightsize;
  // width using MediaQuery
  double width(double widthsize) => MediaQuery.of(this).size.width * widthsize;

  SizedBox height_box(double height) =>
      SizedBox(height: MediaQuery.of(this).size.height * height);
  SizedBox width_box(double width) =>
      SizedBox(width: MediaQuery.of(this).size.width * width);

  double fontSize(double fontsize) {
    double fontFactor = scaleFactor();
    double responsiveFont = fontsize * fontFactor;
    double lowerlimit = fontsize * .8  , upperlimit = fontsize * 1.2;
    return responsiveFont.clamp(lowerlimit, upperlimit);
  }

  double scaleFactor() {
    double width = MediaQuery.of(this).size.width;
    if (width < 600) {
      return width / 400;
    } else if (width < 900) {
      return width / 700;
    } else {
      return width / 1000;
    }
  }

}