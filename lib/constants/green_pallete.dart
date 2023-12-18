import 'package:flutter/material.dart';
/* Pallete of Colors
*/

class Pallete {
  static const int primaryColor = 0XFF25D366;
  static const int appBarColor = 0XFF202020;
  static const int contactsColor = 0XFF080808;

  static const MaterialColor mainScreenColors = MaterialColor(
    appBarColor,
    {
      200: Color(appBarColor),
      50: Color(primaryColor),
      100: Color(contactsColor)
    },
  );
}
