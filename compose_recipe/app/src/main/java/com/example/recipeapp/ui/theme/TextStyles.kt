package com.example.recipeapp.ui.theme

import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.FontStyle
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.sp

/* InputField START */
val inputFiledLabelTextStyle = TextStyle(
    fontFamily = poppins,
    fontWeight = FontWeight.Normal,
    fontSize = 14.sp,
    fontStyle = FontStyle.Normal,
    color = LabelColor
)

val inputFiledHintTextStyle = TextStyle(
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