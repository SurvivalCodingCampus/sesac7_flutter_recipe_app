import 'package:flutter/material.dart';

abstract class TextStyles {
  static const String poppins = 'Poppins';
  static const FontWeight bold = FontWeight.bold;
  static const FontWeight normal = FontWeight.normal;

  static const TextStyle titleTextBold = TextStyle(
    fontSize: 50,
    height: 75 / 50,
    fontWeight: bold,
    fontFamily: poppins,
  );

  static const TextStyle headerTextBold = TextStyle(
    fontSize: 30,
    height: 45 / 30,
    fontWeight: bold,
    fontFamily: poppins,
  );

  static const TextStyle largeTextBold = TextStyle(
    fontSize: 20,
    height: 30 / 20,
    fontWeight: bold,
    fontFamily: poppins,
  );

  static const TextStyle mediumTextBold = TextStyle(
    fontSize: 18,
    height: 27 / 18,
    fontWeight: bold,
    fontFamily: poppins,
  );

  static const TextStyle normalTextBold = TextStyle(
    fontSize: 16,
    height: 24 / 16,
    fontWeight: bold,
    fontFamily: poppins,
  );

  static const TextStyle smallTextBold = TextStyle(
    fontSize: 14,
    height: 21 / 14,
    fontWeight: bold,
    fontFamily: poppins,
  );

  static const TextStyle smallerTextBold = TextStyle(
    fontSize: 11,
    height: 17 / 11,
    fontWeight: bold,
    fontFamily: poppins,
  );

  static const TextStyle titleTextRegular = TextStyle(
    fontSize: 50,
    height: 75 / 50,
    fontWeight: normal,
    fontFamily: poppins,
  );

  static const TextStyle headerTextRegular = TextStyle(
    fontSize: 30,
    height: 45 / 30,
    fontWeight: normal,
    fontFamily: poppins,
  );

  static const TextStyle largeTextRegular = TextStyle(
    fontSize: 20,
    height: 30 / 20,
    fontWeight: normal,
    fontFamily: poppins,
  );

  static const TextStyle mediumTextRegular = TextStyle(
    fontSize: 18,
    height: 27 / 18,
    fontWeight: normal,
    fontFamily: poppins,
  );

  static const TextStyle normalTextRegular = TextStyle(
    fontSize: 16,
    height: 24 / 16,
    fontWeight: normal,
    fontFamily: poppins,
  );

  static const TextStyle smallTextRegular = TextStyle(
    fontSize: 14,
    height: 21 / 14,
    fontWeight: normal,
    fontFamily: poppins,
  );

  static const TextStyle smallerTextRegular = TextStyle(
    fontSize: 11,
    height: 27 / 11,
    fontWeight: normal,
    fontFamily: poppins,
  );
}
