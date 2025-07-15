import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class TextStyles {
  static const String family = 'Poppins';
  static const FontWeight bold = FontWeight.bold;
  static const FontWeight normal = FontWeight.normal;

  static final poppins = GoogleFonts.poppins();

  static final TextStyle titleTextBold = poppins.copyWith(
    fontSize: 50,
    height: 75 / 50,
    fontWeight: bold,
    fontFamily: family,
  );

  static final TextStyle headerTextBold = poppins.copyWith(
    fontSize: 30,
    height: 45 / 30,
    fontWeight: bold,
    fontFamily: family,
  );

  static final TextStyle largeTextBold = poppins.copyWith(
    fontSize: 20,
    height: 30 / 20,
    fontWeight: bold,
    fontFamily: family,
  );

  static final TextStyle mediumTextBold = poppins.copyWith(
    fontSize: 18,
    height: 27 / 18,
    fontWeight: bold,
    fontFamily: family,
  );

  static final TextStyle normalTextBold = poppins.copyWith(
    fontSize: 16,
    height: 24 / 16,
    fontWeight: bold,
    fontFamily: family,
  );

  static final TextStyle smallTextBold = poppins.copyWith(
    fontSize: 14,
    height: 21 / 14,
    fontWeight: bold,
    fontFamily: family,
  );

  static final TextStyle smallerTextBold = poppins.copyWith(
    fontSize: 11,
    height: 17 / 11,
    fontWeight: bold,
    fontFamily: family,
  );

  static final TextStyle titleTextRegular = poppins.copyWith(
    fontSize: 50,
    height: 75 / 50,
    fontWeight: normal,
    fontFamily: family,
  );

  static final TextStyle headerTextRegular = poppins.copyWith(
    fontSize: 30,
    height: 45 / 30,
    fontWeight: normal,
    fontFamily: family,
  );

  static final TextStyle largeTextRegular = poppins.copyWith(
    fontSize: 20,
    height: 30 / 20,
    fontWeight: normal,
    fontFamily: family,
  );

  static final TextStyle mediumTextRegular = poppins.copyWith(
    fontSize: 18,
    height: 27 / 18,
    fontWeight: normal,
    fontFamily: family,
  );

  static final TextStyle normalTextRegular = poppins.copyWith(
    fontSize: 16,
    height: 24 / 16,
    fontWeight: normal,
    fontFamily: family,
  );

  static final TextStyle smallTextRegular = poppins.copyWith(
    fontSize: 14,
    height: 21 / 14,
    fontWeight: normal,
    fontFamily: family,
  );

  static final TextStyle smallerTextRegular = poppins.copyWith(
    fontSize: 11,
    height: 27 / 11,
    fontWeight: normal,
    fontFamily: family,
  );
}
