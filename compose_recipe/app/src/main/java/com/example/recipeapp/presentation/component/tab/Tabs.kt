package com.example.recipeapp.presentation.component.tab

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableIntStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.example.recipeapp.data.model.Label
import com.example.recipeapp.presentation.component.button.LabelButton
import com.example.recipeapp.ui.theme.White

@Composable
fun Tabs(
    modifier: Modifier = Modifier,
    labels: List<Label>,
    selectedIndex: Int,
    onValueChange: (Int) -> Unit
) {
    Box(
        modifier = modifier
            .height(58.dp)
            .fillMaxWidth()
            .background(
                color = White
            )
            .padding(vertical = 12.dp, horizontal = 20.dp),
        contentAlignment = Alignment.Center
    ) {
        Row(
            horizontalArrangement = Arrangement.spacedBy(7.dp),
        ) {
            labels.forEachIndexed { index, label ->
                LabelButton(
                    modifier = Modifier.weight(1f),
                    labelName = label.labelTitle,
                    isSelected = index == selectedIndex
                ) {
                    onValueChange(index)
                }
            }
        }
    }
}

@Preview
@Composable
fun TabsPreview() {
    var selectedIndex by remember { mutableIntStateOf(0) }
    val labels = listOf(
        Label("Label 1"),
        Label("Label 2"),
        Label("Label 3")
    )
    Tabs(
        labels = labels,
        selectedIndex = selectedIndex
    ) {
        selectedIndex = it
    }
}