package com.example.recipeapp.presentation.component.button

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.example.recipeapp.ui.theme.Gray4
import com.example.recipeapp.ui.theme.Rating
import com.example.recipeapp.ui.theme.ratingDialogButtonTitle

@Composable
fun RatingDialogButton(
    modifier: Modifier = Modifier,
    buttonActive: Boolean,
    onTap: () -> Unit
) {
    Box(
        modifier = modifier
            .height(20.dp)
            .background(
                color = if (buttonActive) Rating else Gray4,
                shape = RoundedCornerShape(size = 6.dp)
            )
            .padding(horizontal = 20.dp, vertical = 4.dp)
            .clickable(buttonActive) {
                onTap()
            },
        contentAlignment = Alignment.Center
    ) {
        Text(
            text = "Send",
            style = ratingDialogButtonTitle
        )
    }
}

@Preview
@Composable
fun RatingDialogButtonPreview() {
    RatingDialogButton(
        buttonActive = true,
        onTap = {
            print("검색")
            // 검색
        }
    )
}
