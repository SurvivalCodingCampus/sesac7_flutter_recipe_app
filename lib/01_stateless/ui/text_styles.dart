import 'package:flutter/material.dart';

abstract class TextStyles {
  static const TextStyle normalTextBold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    fontFamily: 'Poppins',
    color: Color(0xFF121212),
    height: 1.5,
  );
  static const TextStyle smallTextRegular = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    fontFamily: 'Poppins',
    color: Color(0xFFA9A9A9),
    height: 1.5,
  );


}