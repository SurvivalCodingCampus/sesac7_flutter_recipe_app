package com.example.recipeapp.ui.theme

import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.FontStyle
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.sp

/* InputField START */
val inputFieldLabelTextStyle = TextStyle(
    fontFamily = poppins,
    fontWeight = FontWeight.Normal,
    fontSize = 14.sp,
    fontStyle = FontStyle.Normal,
    color = LabelColor
)

val inputFieldHintTextStyle = TextStyle(
    fontFamily = poppins,
    fontWeight = FontWeight.Normal,
    fontSize = 11.sp,
    fontStyle = FontStyle.Normal,
    color = Gray4
)
/* InputField END */

/* Tabs Label START */
val tabsSelectedLabelTitle = TextStyle(
    fontFamily = poppins,
    fontWeight = FontWeight.SemiBold,
    fontSize = 11.sp,
    fontStyle = FontStyle.Normal,
    color = White
)

val tabsUnSelectedLabelTitle = TextStyle(
    fontFamily = poppins,
    fontWeight = FontWeight.SemiBold,
    fontSize = 11.sp,
    fontStyle = FontStyle.Normal,
    color = Primary80
)
/* Label END */

/* FilterButton START */
val selectedFilterTitle = TextStyle(
    fontFamily = poppins,
    fontWeight = FontWeight.Normal,
    fontSize = 11.sp,
    fontStyle = FontStyle.Normal,
    color = White,
    lineHeight = 17.sp
)

val unSelectedFilterTitle = TextStyle(
    fontFamily = poppins,
    fontWeight = FontWeight.Normal,
    fontSize = 11.sp,
    fontStyle = FontStyle.Normal,
    color = Primary80,
    lineHeight = 17.sp
)
/* FilterButton END */

/* RatingButton START */
val selectedRatingTitle = TextStyle(
    fontFamily = poppins,
    fontWeight = FontWeight.Normal,
    fontSize = 11.sp,
    fontStyle = FontStyle.Normal,
    color = White,
    lineHeight = 17.sp
)

val unSelectedRatingTitle = TextStyle(
    fontFamily = poppins,
    fontWeight = FontWeight.Normal,
    fontSize = 11.sp,
    fontStyle = FontStyle.Normal,
    color = Primary80,
    lineHeight = 17.sp
)
/* RatingButton END */

/* RatingDialog START */
val ratingDialogButtonTitle = TextStyle(
    fontFamily = poppins,
    fontWeight = FontWeight.Normal,
    fontSize = 8.sp,
    fontStyle = FontStyle.Normal,
    color = White,
    lineHeight = 12.sp
)

val ratingDialogTitle = TextStyle(
    fontFamily = poppins,
    fontWeight = FontWeight.Normal,
    fontSize = 11.sp,
    fontStyle = FontStyle.Normal,
    color = LabelColor,
    lineHeight = 17.sp
)
/* RatingDialog END */

/* RecipeCard START */
val recipeCardRatingButtonTitle = TextStyle(
    fontFamily = poppins,
    fontWeight = FontWeight.Normal,
    fontSize = 8.sp,
    fontStyle = FontStyle.Normal,
    color = Black,
    lineHeight = 12.sp
)

val recipeCadRecipeName = TextStyle(
    fontFamily = poppins,
    fontWeight = FontWeight.SemiBold,
    fontSize = 14.sp,
    fontStyle = FontStyle.Normal,
    color = White,
    lineHeight = 21.sp
)
val recipeCadRecipeChefName = TextStyle(
    fontFamily = poppins,
    fontWeight = FontWeight.Normal,
    fontSize = 8.sp,
    fontStyle = FontStyle.Normal,
    color = Gray4,
    lineHeight = 12.sp
)
val recipeCadRecipeTime = TextStyle(
    fontFamily = poppins,
    fontWeight = FontWeight.Normal,
    fontSize = 11.sp,
    fontStyle = FontStyle.Normal,
    color = Gray4,
    lineHeight = 17.sp
)
/* RecipeCard END */

/* Ingredients START */
val ingredientCardTitle = TextStyle(
    fontFamily = poppins,
    fontWeight = FontWeight.SemiBold,
    fontSize = 16.sp,
    fontStyle = FontStyle.Normal,
    color = LabelColor,
    lineHeight = 24.sp
)
val ingredientCardAmount = TextStyle(
    fontFamily = poppins,
    fontWeight = FontWeight.Normal,
    fontSize = 14.sp,
    fontStyle = FontStyle.Normal,
    color = Gray3,
    lineHeight = 21.sp
)
/* Ingredients END */