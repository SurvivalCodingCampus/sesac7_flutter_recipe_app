import 'package:flutter/material.dart';

abstract class TextStyles {
  static const TextStyle normalTextBold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: 'Poppins',
    height: 1.5,
  );
  static const TextStyle smallTextRegular = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    fontFamily: 'Poppins',
    height: 1.5,
  );
  static const TextStyle smallerTextRegular = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.normal,
    fontFamily: 'Poppins',
    height: 1.5,
  );
  static const TextStyle smallerTextBold = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    fontFamily: 'Poppins',
    height: 1.5,
  );



}