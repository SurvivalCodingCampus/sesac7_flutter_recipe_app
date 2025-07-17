import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/enum/font_family_type.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';

abstract class TextStyles {
  /* Button Component START */
  static final TextStyle smallButtonTitle = TextStyle(
    color: AppColors.white,
    fontSize: 11.0,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w600,
    overflow: TextOverflow.ellipsis,
  );

  static final TextStyle mediumButtonTitle = TextStyle(
    color: AppColors.white,
    fontSize: 16.0,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w600,
    overflow: TextOverflow.ellipsis,
  );

  static final TextStyle bigButtonTitle = TextStyle(
    color: AppColors.white,
    fontSize: 16.0,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w600,
    overflow: TextOverflow.ellipsis,
  );

  /* Button Component END */

  /* InputField START */
  static final TextStyle inputFiledLabel = TextStyle(
    color: AppColors.labelColor,
    fontSize: 14.0,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w400,
    overflow: TextOverflow.ellipsis,
  );

  static final TextStyle inputFiledHint = TextStyle(
    color: AppColors.gray4,
    fontSize: 11.0,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w400,
    overflow: TextOverflow.ellipsis,
  );

  /* InputField END */

  /* Tabs Label START */
  static final TextStyle tabsSelectedLabelTitle = TextStyle(
    color: AppColors.white,
    fontSize: 11.0,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w600,
    overflow: TextOverflow.ellipsis,
  );

  static final TextStyle tabsUnSelectedLabelTitle = TextStyle(
    color: AppColors.primary80,
    fontSize: 11.0,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w600,
    overflow: TextOverflow.ellipsis,
  );

  /* Label END */

  /* FilterButton Start */
  static final TextStyle selectedFilterTitle = TextStyle(
    color: AppColors.white,
    fontSize: 11.0,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w400,
    overflow: TextOverflow.ellipsis,
    height: 17 / 11,
  );

  static final TextStyle unSelectedFilterTitle = TextStyle(
    color: AppColors.primary80,
    fontSize: 11.0,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w400,
    overflow: TextOverflow.ellipsis,
    height: 17 / 11,
  );

  /* FilterButton Start */

  /* RatingButton Start */
  static final TextStyle selectedRatingTitle = TextStyle(
    color: AppColors.white,
    fontSize: 11.0,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w400,
    overflow: TextOverflow.ellipsis,
    height: 17 / 11,
  );

  static final TextStyle unSelectedRatingTitle = TextStyle(
    color: AppColors.primary80,
    fontSize: 11.0,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w400,
    overflow: TextOverflow.ellipsis,
    height: 17 / 11,
  );

  /* RatingButton End */

  /* RatingDialog Start */
  static final TextStyle ratingDialogTitle = TextStyle(
    color: AppColors.labelColor,
    fontSize: 11.0,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w400,
    overflow: TextOverflow.ellipsis,
    height: 17 / 11,
  );

  static final TextStyle ratingDialogButtonTitle = TextStyle(
    color: AppColors.white,
    fontSize: 8.0,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w400,
    overflow: TextOverflow.ellipsis,
    height: 12 / 8,
  );

  /* RatingDialog End */

  /* RecipeCard Start */
  static final TextStyle recipeCardRatingValue = TextStyle(
    color: AppColors.black,
    fontSize: 8.0,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w400,
    overflow: TextOverflow.ellipsis,
    height: 12 / 8,
  );

  static final TextStyle recipeCardTitle = TextStyle(
    color: AppColors.white,
    fontSize: 14.0,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w600,
    overflow: TextOverflow.ellipsis,
    height: 21 / 14
  );

  static final TextStyle recipeCardChef = TextStyle(
    color: AppColors.gray4,
    fontSize: 8.0,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w400,
    overflow: TextOverflow.ellipsis,
    height: 12 / 8
  );

  static final TextStyle recipeCardTime = TextStyle(
    color: AppColors.gray4,
    fontSize: 11.0,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w400,
    overflow: TextOverflow.ellipsis,
    height: 17 / 11
  );

  /* RecipeCard End */

  /* SavedRecipeScreen Start */
  static final TextStyle savedRecipeScreenTitle = TextStyle(
    color: AppColors.labelColor,
    fontSize: 18.0,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w600,
    overflow: TextOverflow.ellipsis,
    height: 27 / 18
  );
  /* SavedRecipeScreen End */

  /* SplashScreen Start */
  static final TextStyle splashScreenLogoTitle = TextStyle(
    color: AppColors.white,
    fontSize: 18.0,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w600,
    height: 27 / 18
  );

  static final TextStyle splashScreenLogoSubtitle = TextStyle(
    color: AppColors.white,
    fontSize: 50.0,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w600,
    height: 60 / 50
  );
}
