import 'package:flutter/material.dart';

abstract class ThemeText {
  static const TextStyle text = TextStyle(
      color: Colors.white,
      letterSpacing: 3,
      fontSize: 28,
      fontWeight: FontWeight.w400);

  static const TextStyle textHome = TextStyle(
      color: Colors.white,
      fontSize: 64,
      letterSpacing: 3,
      fontWeight: FontWeight.w600);
  static const TextStyle textWins = TextStyle(
      color: Colors.white,
      fontSize: 20,
      letterSpacing: 3,
      fontWeight: FontWeight.w600);
}
