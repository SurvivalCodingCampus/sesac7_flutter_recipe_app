import 'dart:ui';

import 'package:flutter_recipe_app/core/enum/font_family_type.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';

abstract class TextStyles {
  static final TextStyle smallButtonTitle = TextStyle(
    color: AppColors.white,
    fontSize: 11,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle mediumButtonTitle = TextStyle(
    color: AppColors.white,
    fontSize: 16,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle bigButtonTitle = TextStyle(
    color: AppColors.white,
    fontSize: 16,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w600,
  );
}
