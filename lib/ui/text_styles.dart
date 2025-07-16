import 'package:flutter/material.dart';

abstract class TextStyles {
  static const lineHeightRatio = 1.5;

  // bold
  static const TextStyle tittleTextBold = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold,
    fontSize: 50,
    height: lineHeightRatio,
  );

  static const TextStyle headerTextBold = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold,
    fontSize: 30,
    height: lineHeightRatio,
  );

  static const TextStyle largeTextBold = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold,
    fontSize: 20,
    height: lineHeightRatio,
  );

  static const TextStyle mediumTextBold = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold,
    fontSize: 18,
    height: lineHeightRatio,
  );

  static const TextStyle normalTextBold = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold,
    fontSize: 16,
    height: lineHeightRatio,
  );

  static const TextStyle smallTextBold = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold,
    fontSize: 14,
    height: lineHeightRatio,
  );

  static const TextStyle smallerTextBold = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold,
    fontSize: 11,
    height: lineHeightRatio, // 17
  );

  // regular
  static const TextStyle tittleTextRegular = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.normal,
    fontSize: 50,
    height: lineHeightRatio,
  );

  static const TextStyle headerTextRegular = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.normal,
    fontSize: 30,
    height: lineHeightRatio,
  );

  static const TextStyle largeTextRegular = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.normal,
    fontSize: 20,
    height: lineHeightRatio,
  );

  static const TextStyle mediumTextRegular = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.normal,
    fontSize: 18,
    height: lineHeightRatio,
  );

  static const TextStyle normalTextRegular = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.normal,
    fontSize: 16,
    height: lineHeightRatio,
  );

  static const TextStyle smallTextRegular = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.normal,
    fontSize: 14,
    height: lineHeightRatio,
  );

  static const TextStyle smallerTextRegular = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.normal,
    fontSize: 11,
    height: lineHeightRatio,
  );
}