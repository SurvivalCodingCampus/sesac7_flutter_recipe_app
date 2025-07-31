import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class TextStyles {
  static const String family = 'Poppins';
  static const FontWeight bold = FontWeight.bold;
  static const FontWeight normal = FontWeight.normal;

  static final TextStyle titleTextBold = _poppinsTextStyle(
    fontSize: 50,
    lineHeight: 75,
    fontWeight: bold,
  );

  static final TextStyle headerTextBold = _poppinsTextStyle(
    fontSize: 30,
    lineHeight: 45,
    fontWeight: bold,
  );

  static final TextStyle largeTextBold = _poppinsTextStyle(
    fontSize: 20,
    lineHeight: 30,
    fontWeight: bold,
  );

  static final TextStyle mediumTextBold = _poppinsTextStyle(
    fontSize: 18,
    lineHeight: 27,
    fontWeight: bold,
  );

  static final TextStyle normalTextBold = _poppinsTextStyle(
    fontSize: 16,
    lineHeight: 24,
    fontWeight: bold,
  );

  static final TextStyle smallTextBold = _poppinsTextStyle(
    fontSize: 14,
    lineHeight: 21,
    fontWeight: bold,
  );

  static final TextStyle smallerTextBold = _poppinsTextStyle(
    fontSize: 11,
    lineHeight: 17,
    fontWeight: bold,
  );

  static final TextStyle titleTextRegular = _poppinsTextStyle(
    fontSize: 50,
    lineHeight: 75,
    fontWeight: normal,
  );

  static final TextStyle headerTextRegular = _poppinsTextStyle(
    fontSize: 30,
    lineHeight: 45,
    fontWeight: normal,
  );

  static final TextStyle largeTextRegular = _poppinsTextStyle(
    fontSize: 20,
    lineHeight: 30,
    fontWeight: normal,
  );

  static final TextStyle mediumTextRegular = _poppinsTextStyle(
    fontSize: 18,
    lineHeight: 27,
    fontWeight: normal,
  );

  static final TextStyle normalTextRegular = _poppinsTextStyle(
    fontSize: 16,
    lineHeight: 24,
    fontWeight: normal,
  );

  static final TextStyle smallTextRegular = _poppinsTextStyle(
    fontSize: 14,
    lineHeight: 21,
    fontWeight: normal,
  );

  static final TextStyle smallerTextRegular = _poppinsTextStyle(
    fontSize: 11,
    lineHeight: 17,
    fontWeight: normal,
  );

  static TextStyle _poppinsTextStyle({
    required double fontSize,
    required double lineHeight,
    required FontWeight fontWeight,
  }) {
    return GoogleFonts.poppins().copyWith(
      fontSize: fontSize,
      height: lineHeight / fontSize,
      fontWeight: fontWeight,
      fontFamily: family,
    );
  }
}
