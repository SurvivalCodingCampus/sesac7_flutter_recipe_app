package com.example.recipeapp.ui.theme

import androidx.compose.material3.Typography
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.Font
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontStyle
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.sp
import com.example.recipeapp.R

val poppins = FontFamily(
    Font(R.font.poppins_black, FontWeight.Black, FontStyle.Normal),
    Font(R.font.poppins_bold, FontWeight.Bold, FontStyle.Normal),
    Font(R.font.poppins_extra_bold, FontWeight.ExtraBold, FontStyle.Normal),
    Font(R.font.poppins_extra_light, FontWeight.ExtraLight, FontStyle.Normal),
    Font(R.font.poppins_light, FontWeight.Light, FontStyle.Normal),
    Font(R.font.poppins_medium, FontWeight.Medium, FontStyle.Normal),
    Font(R.font.poppins_regular, FontWeight.Normal, FontStyle.Normal),
    Font(R.font.poppins_semi_bold, FontWeight.SemiBold, FontStyle.Normal),
    Font(R.font.poppins_thin, FontWeight.Thin, FontStyle.Normal)
)

val poppinsItalic = FontFamily(
    Font(R.font.poppins_black_italic, FontWeight.Black, FontStyle.Italic),
    Font(R.font.poppins_bold_italic, FontWeight.Bold, FontStyle.Italic),
    Font(R.font.poppins_extra_bold_italic, FontWeight.ExtraBold, FontStyle.Italic),
    Font(R.font.poppins_extra_light_italic, FontWeight.ExtraLight, FontStyle.Italic),
    Font(R.font.poppins_italic, FontWeight.Normal, FontStyle.Italic),
    Font(R.font.poppins_light_italic, FontWeight.Light, FontStyle.Italic),
    Font(R.font.poppins_medium_italic, FontWeight.Medium, FontStyle.Italic),
    Font(R.font.poppins_semi_bold_italic, FontWeight.SemiBold, FontStyle.Italic),
    Font(R.font.poppins_thin_italic, FontWeight.Thin, FontStyle.Italic)
)

// Set of Material typography styles to start with
val Typography = Typography(
    bodyLarge = TextStyle(
        fontFamily = FontFamily.Default,
        fontWeight = FontWeight.Normal,
        fontSize = 16.sp,
        lineHeight = 24.sp,
        letterSpacing = 0.5.sp
    )
)

/* Button Component START */
val ButtonTitleTypography = Typography(
    titleSmall = TextStyle(
        fontFamily = poppins,
        fontWeight = FontWeight.SemiBold,
        fontSize = 11.sp,
        fontStyle = FontStyle.Normal,
        color = White
    ),
    titleMedium = TextStyle(
        fontFamily = poppins,
        fontWeight = FontWeight.SemiBold,
        fontSize = 16.sp,
        fontStyle = FontStyle.Normal,
        color = White
    ),
    titleLarge = TextStyle(
        fontFamily = poppins,
        fontWeight = FontWeight.SemiBold,
        fontSize = 16.sp,
        fontStyle = FontStyle.Normal
    )
)
/* Button Component END */