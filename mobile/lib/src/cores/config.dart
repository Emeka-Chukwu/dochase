import 'package:flutter/material.dart';

class Responsive {
  static double screenHeight(double height, BuildContext context) {
    bool portrait = MediaQuery.of(context).orientation == Orientation.portrait;
    double viewportHeight = portrait
        ? MediaQuery.of(context).size.height
        : MediaQuery.of(context).size.width;
    return viewportHeight * (height / 100);
  }

  /// media query for width of the screen
  static double screenWidth(double width, BuildContext context) {
    bool portrait = MediaQuery.of(context).orientation == Orientation.portrait;
    double viewportWidth = portrait
        ? MediaQuery.of(context).size.width
        : MediaQuery.of(context).size.width - kToolbarHeight;
    return viewportWidth * (width / 100);
  }
}
