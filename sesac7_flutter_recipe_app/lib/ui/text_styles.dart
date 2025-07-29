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

  /* CategoryButton Start */
  static final TextStyle selectedCategoryTitle = TextStyle(
    color: AppColors.white,
    fontSize: 11.0,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w600,
    overflow: TextOverflow.ellipsis,
    height: 17 / 11,
  );

  static final TextStyle unSelectedCategoryTitle = TextStyle(
    color: AppColors.primary80,
    fontSize: 11.0,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w600,
    overflow: TextOverflow.ellipsis,
    height: 17 / 11,
  );

  /* CategoryButton End */

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

  /* NetworkErrorDialog Start*/
  static final TextStyle networkErrorDialogTitle = TextStyle(
    color: AppColors.labelColor,
    fontSize: 11.0,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w400,
    overflow: TextOverflow.ellipsis,
    height: 17 / 11,
  );

  static final TextStyle networkErrorDialogButtonTitle = TextStyle(
    color: AppColors.white,
    fontSize: 8.0,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w400,
    overflow: TextOverflow.ellipsis,
    height: 12 / 8,
  );

  /* NetworkErrorDialog End */

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
    height: 21 / 14,
  );

  static final TextStyle recipeCardChef = TextStyle(
    color: AppColors.gray4,
    fontSize: 8.0,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w400,
    overflow: TextOverflow.ellipsis,
    height: 12 / 8,
  );

  static final TextStyle recipeCardTime = TextStyle(
    color: AppColors.gray4,
    fontSize: 11.0,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w400,
    overflow: TextOverflow.ellipsis,
    height: 17 / 11,
  );

  /* RecipeCard End */

  /* SearchRecipeCard Start */
  static final TextStyle searchRecipeCardRatingValue = TextStyle(
    color: AppColors.black,
    fontSize: 8.0,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w400,
    overflow: TextOverflow.ellipsis,
    height: 12 / 8,
  );

  static final TextStyle searchRecipeCardTitle = TextStyle(
    color: AppColors.white,
    fontSize: 11.0,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w600,
    overflow: TextOverflow.ellipsis,
    height: 17 / 11,
  );

  static final TextStyle searchRecipeCardChef = TextStyle(
    color: AppColors.gray3,
    fontSize: 8.0,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w400,
    overflow: TextOverflow.ellipsis,
    height: 12 / 8,
  );

  /* SearchRecipeCard End */

  /* IngredientCard Start */
  static final ingredientCardTitle = TextStyle(
    color: AppColors.labelColor,
    fontSize: 16.0,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w600,
    overflow: TextOverflow.ellipsis,
    height: 24 / 16,
  );

  static final ingredientCardAmount = TextStyle(
    color: AppColors.gray3,
    fontSize: 14.0,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w400,
    overflow: TextOverflow.ellipsis,
    height: 21 / 14,
  );

  /* DishCard Start */
  static final TextStyle dishCardTitle = TextStyle(
    color: AppColors.gray1,
    fontSize: 14.0,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w600,
    overflow: TextOverflow.ellipsis,
    height: 21 / 14,
  );

  static final TextStyle dishCardTimeTitle = TextStyle(
    color: AppColors.gray3,
    fontSize: 11.0,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w400,
    overflow: TextOverflow.ellipsis,
    height: 17 / 11,
  );

  static final TextStyle dishCardTime = TextStyle(
    color: AppColors.gray1,
    fontSize: 11.0,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w600,
    overflow: TextOverflow.ellipsis,
    height: 17 / 11,
  );

  static final TextStyle dishCardRatingValue = TextStyle(
    color: AppColors.black,
    fontSize: 11.0,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w400,
    overflow: TextOverflow.ellipsis,
    height: 17 / 11,
  );

  /* DishCard End */

  /* IngredientCard End */

  /* StepCard Start */
  static final TextStyle stepCardTitle = TextStyle(
    color: AppColors.labelColor,
    fontSize: 11.0,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w600,
    overflow: TextOverflow.ellipsis,
    height: 17 / 11,
  );

  static final TextStyle stepCardDescription = TextStyle(
    color: AppColors.gray3,
    fontSize: 11.0,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w600,
    overflow: TextOverflow.ellipsis,
    height: 17 / 11,
  );

  /* StepCard End */

  /* SearchRecipeFilterBottomSheet Start */
  static final TextStyle searchRecipeFilterBottomSheetTitle = TextStyle(
    color: AppColors.black,
    fontSize: 14.0,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w600,
    overflow: TextOverflow.ellipsis,
    height: 21 / 14,
  );

  static final TextStyle searchRecipeFilterBottomSheetSubtitle = TextStyle(
    color: AppColors.black,
    fontSize: 14.0,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w600,
    overflow: TextOverflow.ellipsis,
    height: 21 / 14,
  );

  /* SearchRecipeFilterBottomSheet End */

  /* SignInScreen Start */
  static final TextStyle signInScreenTitle = TextStyle(
    color: AppColors.black,
    fontSize: 30.0,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w600,
    overflow: TextOverflow.ellipsis,
    height: 45 / 30,
  );

  static final TextStyle signInScreenSubTitle = TextStyle(
    color: AppColors.black,
    fontSize: 20.0,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w400,
    overflow: TextOverflow.ellipsis,
    height: 30 / 20,
  );

  static final TextStyle signInScreenForgotPassword = TextStyle(
    color: AppColors.secondary100,
    fontSize: 11.0,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w400,
    overflow: TextOverflow.ellipsis,
    height: 17 / 11,
  );

  static final TextStyle signInScreenOrSignInWith = TextStyle(
    color: AppColors.gray4,
    fontSize: 11.0,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w500,
    overflow: TextOverflow.ellipsis,
    height: 17 / 11,
  );

  static final TextStyle signInScreenSignUpFirst = TextStyle(
    color: AppColors.black,
    fontSize: 11.0,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w500,
    overflow: TextOverflow.ellipsis,
    height: 17 / 11,
  );

  static final TextStyle signInScreenSignUpSecond = TextStyle(
    color: AppColors.secondary100,
    fontSize: 11.0,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w500,
    overflow: TextOverflow.ellipsis,
    height: 17 / 11,
  );

  /* SignInScreen End */

  /* SignUpScreen Start */
  static final TextStyle signUpScreenTitle = TextStyle(
    color: AppColors.black,
    fontSize: 20.0,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w600,
    overflow: TextOverflow.ellipsis,
    height: 30 / 20,
  );

  static final TextStyle signUpScreenSubTitle = TextStyle(
    color: AppColors.labelColor,
    fontSize: 11.0,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w400,
    overflow: TextOverflow.ellipsis,
    height: 17 / 11,
  );

  /* SignUpScreen End */

  /* HomeScreen Start */
  static final TextStyle homeScreenTitle = TextStyle(
    color: AppColors.black,
    fontSize: 20,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w600,
    overflow: TextOverflow.ellipsis,
    height: 30 / 20,
  );

  static final TextStyle homeScreenSubTitle = TextStyle(
    color: AppColors.gray3,
    fontSize: 11,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w400,
    overflow: TextOverflow.ellipsis,
    height: 17 / 11,
  );

  /* HomeScreen End */

  /* SavedRecipeScreen Start */
  static final TextStyle savedRecipeScreenTitle = TextStyle(
    color: AppColors.labelColor,
    fontSize: 18.0,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w600,
    overflow: TextOverflow.ellipsis,
    height: 27 / 18,
  );

  /* SavedRecipeScreen End */

  /* SplashScreen Start */
  static final TextStyle splashScreenLogoTitle = TextStyle(
    color: AppColors.white,
    fontSize: 18.0,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w600,
    height: 27 / 18,
  );

  static final TextStyle splashScreenLogoSubtitle = TextStyle(
    color: AppColors.white,
    fontSize: 50.0,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w600,
    height: 60 / 50,
  );

  /* SplashScreen End */

  /* SearchRecipeScreen Start */
  static final TextStyle searchInputFieldHint = TextStyle(
    color: AppColors.gray4,
    fontSize: 11.0,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w400,
    overflow: TextOverflow.ellipsis,
    height: 17 / 11,
  );

  static final TextStyle searchScreenTitle = TextStyle(
    color: AppColors.neutral100,
    fontSize: 18.0,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w600,
    overflow: TextOverflow.ellipsis,
    height: 27 / 18,
  );

  static final TextStyle searchScreenSubtitle = TextStyle(
    color: AppColors.black,
    fontSize: 16.0,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w600,
    overflow: TextOverflow.ellipsis,
    height: 24 / 16,
  );

  static final TextStyle searchScreenSearchResult = TextStyle(
    color: AppColors.gray3,
    fontSize: 11.0,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w400,
    overflow: TextOverflow.ellipsis,
    height: 17 / 11,
  );

  /* SearchRecipeScreen End */

  /* IngredientScreen Start */
  static final TextStyle ingredientScreenRecipeName = TextStyle(
    color: AppColors.black,
    fontSize: 14.0,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w600,
    overflow: TextOverflow.ellipsis,
    height: 20.5 / 14,
  );

  static final TextStyle ingredientScreenRecipeReviewCount = TextStyle(
    color: AppColors.gray3,
    fontSize: 14.0,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w400,
    overflow: TextOverflow.ellipsis,
    height: 20 / 14,
  );

  static final TextStyle ingredientScreenRecipeCreatorName = TextStyle(
    color: AppColors.labelColor,
    fontSize: 14.0,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w600,
    overflow: TextOverflow.ellipsis,
    height: 21 / 14,
  );

  static final TextStyle ingredientScreenRecipeCreatorLocation = TextStyle(
    color: AppColors.gray3,
    fontSize: 11.0,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w400,
    overflow: TextOverflow.ellipsis,
    height: 17 / 11,
  );

  static final TextStyle ingredientScreenRecipeServe = TextStyle(
    color: AppColors.gray3,
    fontSize: 11.0,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w400,
    overflow: TextOverflow.ellipsis,
    height: 17 / 11,
  );

  static final TextStyle ingredientScreenRecipeItemCount = TextStyle(
    color: AppColors.gray3,
    fontSize: 11.0,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w400,
    overflow: TextOverflow.ellipsis,
    height: 17 / 11,
  );

  /* IngredientScreen End */

  /* PopupMenu Start */
  static final TextStyle popupMenuTitle = TextStyle(
    color: AppColors.labelColor,
    fontSize: 14.0,
    fontFamily: FontFamilyType.poppins.fontFamilyName,
    fontWeight: FontWeight.w400,
    overflow: TextOverflow.ellipsis,
    height: 21 / 14,
  );
  /* PopupMenu End */
}
