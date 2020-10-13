import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    primaryColor: Palette.bgYellow,
    accentColor: Colors.green[500],
    scaffoldBackgroundColor: Palette.bgYellow,
    iconTheme: IconThemeData(
      color: Palette.mainBlack,
    ));

class Palette {
  static const Color bgYellow = Color.fromARGB(255, 255, 221, 13);
  static const Color bgYellowTransparent = Color.fromRGBO(255, 221, 13, 0);
  static const Color yellowLine = Color.fromARGB(255, 240, 209, 15);
  static const Color yellowGrey = Color.fromARGB(255, 159, 139, 12);
  static const Color yellowCitrine = Color.fromARGB(255, 228, 200, 27);
  static const Color mainBlack = Color.fromARGB(255, 44, 38, 5);
  static const Color blue = Color.fromARGB(255, 74, 144, 226);
  static const Color blueShadow = Color.fromRGBO(60, 120, 191, 0.4);
  static const Color red = Color.fromARGB(255, 220, 75, 93);
  static const Color redShadow = Color.fromRGBO(184, 118, 12, 0.73);
  static const Color brown = Color.fromARGB(255, 44, 38, 5);
  static const Color brownCafe = Color.fromARGB(255, 76, 67, 9);
  static const Color white = Colors.white;
  static const Color whiteTransparent = Color.fromRGBO(255, 255, 255, 0.0);
  static const Color greyTextColor = Color.fromRGBO(79, 86, 93, 1.0);
}
