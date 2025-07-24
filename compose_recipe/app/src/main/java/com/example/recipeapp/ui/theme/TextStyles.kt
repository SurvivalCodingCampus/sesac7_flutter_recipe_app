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