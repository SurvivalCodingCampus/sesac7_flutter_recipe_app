import 'package:flutter/material.dart';

abstract class TextStyles {
  static const TextStyle tittleTextBold = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold,
    fontSize: 50,
    height: 1.5, // 75 / 50 -> 줄 높이 = 50 * 1.5 = 75px
  );

  static const TextStyle headerTextBold = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold,
    fontSize: 30,
    height: 1.5, // 45 / 30
  );

  static const TextStyle largeTextBold = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold,
    fontSize: 20,
    height: 1.5, // 30 / 20
  );

  static const TextStyle mediumTextBold = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold,
    fontSize: 18,
    height: 1.5, // 27 / 18
  );

  static const TextStyle normalTextBold = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold,
    fontSize: 16,
    height: 1.5, // 24 / 16
  );

  static const TextStyle smallTextBold = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold,
    fontSize: 14,
    height: 1.5, // 21 / 14
  );

  static const TextStyle smallerTextBold = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold,
    fontSize: 11,
    height: 1.545, // 17 / 11
  );

  // Regular 스타일
  static const TextStyle tittleTextRegular = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.normal,
    fontSize: 50,
    height: 1.5, // 75 / 50
  );

  static const TextStyle headerTextRegular = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.normal,
    fontSize: 30,
    height: 1.5, // 45 / 30
  );

  static const TextStyle largeTextRegular = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.normal,
    fontSize: 20,
    height: 1.5, // 30 / 20
  );

  static const TextStyle mediumTextRegular = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.normal,
    fontSize: 18,
    height: 1.5, // 27 / 18
  );

  static const TextStyle normalTextRegular = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.normal,
    fontSize: 16,
    height: 1.5, // 24 / 16
  );

  static const TextStyle smallTextRegular = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.normal,
    fontSize: 14,
    height: 1.5, // 21 / 14
  );

  static const TextStyle smallerTextRegular = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.normal,
    fontSize: 11,
    height: 2.45, // 27 / 11
  );
}
