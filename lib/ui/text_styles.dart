import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/enum/font_family_type.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';

abstract class TextStyles {
  /* Button Component START */
  static final TextStyle smallButtonTitle = TextStyle(
    color: AppColors.white,
    fontSize: 11,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w600,
    overflow: TextOverflow.ellipsis,
  );

  static final TextStyle mediumButtonTitle = TextStyle(
    color: AppColors.white,
    fontSize: 16,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w600,
    overflow: TextOverflow.ellipsis,
  );

  static final TextStyle bigButtonTitle = TextStyle(
    color: AppColors.white,
    fontSize: 16,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w600,
    overflow: TextOverflow.ellipsis,
  );

  /* Button Component END */

  /* InputField START */
  static final TextStyle inputFiledLabel = TextStyle(
    color: AppColors.labelColor,
    fontSize: 14,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w400,
    overflow: TextOverflow.ellipsis,
  );

  static final TextStyle inputFiledHint = TextStyle(
    color: AppColors.gray4,
    fontSize: 11,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w400,
    overflow: TextOverflow.ellipsis,
  );
}
