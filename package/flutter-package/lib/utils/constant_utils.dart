import 'package:flutter/material.dart';

class ConstantUtils {
  static double getFullHeight(context) {
    double screenFullHeight = MediaQuery.of(context).size.height;

    return screenFullHeight;
  }

  static double getFullWidth(context) {
    double screenFullHeight = MediaQuery.of(context).size.width;

    return screenFullHeight;
  }
}
