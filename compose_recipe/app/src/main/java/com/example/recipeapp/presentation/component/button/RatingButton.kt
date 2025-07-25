package com.example.recipeapp.presentation.component.button

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Star
import androidx.compose.material3.Icon
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.example.recipeapp.ui.theme.Primary100
import com.example.recipeapp.ui.theme.Primary80
import com.example.recipeapp.ui.theme.White
import com.example.recipeapp.ui.theme.selectedRatingTitle
import com.example.recipeapp.ui.theme.unSelectedRatingTitle

@Composable
fun RatingButton(
    modifier: Modifier = Modifier,
    ratingButtonTitle: String,
    isSelected: Boolean,
    onValueChange: (Boolean) -> Unit
) {
    Box(
        modifier = modifier
            .height(28.dp)
            .border(
                width = 1.dp,
                color = if (isSelected) Primary100 else Primary80,
                shape = RoundedCornerShape(size = 10.dp)
            )
            .background(
                color = if (isSelected) Primary100 else White,
                shape = RoundedCornerShape(size = 10.dp)
            )
            .padding(horizontal = 10.dp, vertical = 5.dp)
            .clickable {
                onValueChange(!isSelected)
            }
    ) {
        Row(
            verticalAlignment = Alignment.CenterVertically,
            horizontalArrangement = Arrangement.Center
        ) {
            Text(
                text = ratingButtonTitle,
                style = if (isSelected) selectedRatingTitle else unSelectedRatingTitle
            )
            Spacer(modifier = Modifier.width(5.dp))
            Icon(
                Icons.Default.Star,
                contentDescription = null,
                modifier = modifier
                    .width(18.dp)
                    .height(18.dp),
                tint = if (isSelected) White else Primary80
            )
        }
    }
}

@Preview
@Composable
fun RatingButtonPreview() {
    var isSelected by remember { mutableStateOf(false) }

    RatingButton(
        ratingButtonTitle = "5",
        isSelected = isSelected
    ) {
        isSelected = it
    }
}