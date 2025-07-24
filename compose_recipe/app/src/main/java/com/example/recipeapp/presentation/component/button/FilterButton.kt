package com.example.recipeapp.presentation.component.button

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.shape.RoundedCornerShape
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
import com.example.recipeapp.ui.theme.selectedFilterTitle
import com.example.recipeapp.ui.theme.unSelectedFilterTitle

@Composable
fun FilterButton(
    modifier: Modifier = Modifier,
    filterTitle: String,
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
            .clickable {
                onValueChange(!isSelected)
            },
        contentAlignment = Alignment.Center
    ) {
        Text(
            modifier = Modifier
                .padding(vertical = 5.dp, horizontal = 10.dp),
            text = filterTitle,
            style = if (isSelected) selectedFilterTitle else unSelectedFilterTitle
        )
    }
}

@Preview
@Composable
fun FilterButtonPreview() {
    var isSelected by remember { mutableStateOf(false) }

    FilterButton(
        filterTitle = "Text",
        isSelected = isSelected
    ) {
        isSelected = it
    }
}
