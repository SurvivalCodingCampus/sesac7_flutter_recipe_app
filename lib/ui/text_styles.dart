import 'package:flutter/material.dart';

abstract class TextStyles {
  static const String _fontFamily = 'Poppins';
  static const Color _defaultColor = Colors.white;

  static TextStyle _baseStyle(double fontSize, FontWeight fontWeight) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontFamily: _fontFamily,
      color: _defaultColor,
    );
  }

  // Bold styles
  static final TextStyle titleTextBold = _baseStyle(50, FontWeight.bold);
  static final TextStyle headerTextBold = _baseStyle(30, FontWeight.bold);
  static final TextStyle largeTextBold = _baseStyle(20, FontWeight.bold);
  static final TextStyle mediumTextBold = _baseStyle(18, FontWeight.bold);
  static final TextStyle normalTextBold = _baseStyle(16, FontWeight.bold);
  static final TextStyle smallTextBold = _baseStyle(14, FontWeight.bold);
  static final TextStyle smallerTextBold = _baseStyle(11, FontWeight.bold);

  // Regular styles
  static final TextStyle titleTextRegular = _baseStyle(50, FontWeight.normal);
  static final TextStyle headerTextRegular = _baseStyle(30, FontWeight.normal);
  static final TextStyle largeTextRegular = _baseStyle(20, FontWeight.normal);
  static final TextStyle mediumTextRegular = _baseStyle(18, FontWeight.normal);
  static final TextStyle normalTextRegular = _baseStyle(16, FontWeight.normal);
  static final TextStyle smallTextRegular = _baseStyle(14, FontWeight.normal);
  static final TextStyle smallerTextRegular = _baseStyle(11, FontWeight.normal);
}
