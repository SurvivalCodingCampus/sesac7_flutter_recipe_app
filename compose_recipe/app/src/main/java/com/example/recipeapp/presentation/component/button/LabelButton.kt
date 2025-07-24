package com.example.recipeapp.presentation.component.button

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.example.recipeapp.ui.theme.Primary100
import com.example.recipeapp.ui.theme.White
import com.example.recipeapp.ui.theme.tabsSelectedLabelTitle
import com.example.recipeapp.ui.theme.tabsUnSelectedLabelTitle

@Composable
fun LabelButton(
    modifier: Modifier = Modifier,
    labelName: String,
    isSelected: Boolean,
    onValueChange: (Boolean) -> Unit
) {
    Box(
        modifier = modifier
            .height(33.dp)
            .background(
                color = if (isSelected) Primary100 else White,
                shape = RoundedCornerShape(size = 10.dp)
            )
            .padding(horizontal = 12.dp, vertical = 8.dp)
            .clickable {
                onValueChange(!isSelected)
            },
        contentAlignment = Alignment.Center
    ) {
        Text(
            text = labelName,
            style = if (isSelected) tabsSelectedLabelTitle else tabsUnSelectedLabelTitle,
            textAlign = TextAlign.Center
        )
    }
}

@Preview
@Composable
fun LabelButtonPreview() {
    var isSelected by remember { mutableStateOf(false) }

    LabelButton(
        labelName = "Label",
        isSelected = isSelected
    ) {
        isSelected = it
    }
}