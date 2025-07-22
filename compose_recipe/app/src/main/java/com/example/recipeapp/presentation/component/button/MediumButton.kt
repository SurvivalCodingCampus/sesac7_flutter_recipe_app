package com.example.recipeapp.presentation.component.button

import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.gestures.detectTapGestures
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowForward
import androidx.compose.material3.Icon
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.input.pointer.pointerInput
import androidx.compose.ui.text.style.LineHeightStyle
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.example.recipeapp.ui.theme.ButtonTitleTypography
import com.example.recipeapp.ui.theme.Gray4
import com.example.recipeapp.ui.theme.Primary100
import com.example.recipeapp.ui.theme.White
import kotlin.math.cos

@Composable
fun MediumButton(modifier: Modifier = Modifier, title: String, onClick: () -> Unit) {
    var isTapDown by remember { mutableStateOf(false) }
    Box(
        modifier = modifier
            .width(243.dp)
            .height(54.dp)
            .clip(RoundedCornerShape(10.dp))
            .background(if (isTapDown) Gray4 else Primary100)
            .pointerInput(Unit) {
                detectTapGestures(onPress = {
                    isTapDown = true
                    tryAwaitRelease()
                    isTapDown = false
                    onClick()
                })
            },
        contentAlignment = Alignment.Center
    ) {
        Row(
            verticalAlignment = Alignment.CenterVertically,
            horizontalArrangement = Arrangement.Center
        ) {
            Box(
                modifier = modifier
                    .width(114.dp)
                    .height(24.dp),
                contentAlignment = Alignment.Center
            ) {
                Text(
                    text = title,
                    style = ButtonTitleTypography.titleMedium,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis,
                )
            }
            Spacer(
                modifier = modifier
                    .width(9.dp)
            )
            Icon(
                modifier = modifier
                    .size(20.dp),
                imageVector = Icons.Default.ArrowForward,
                contentDescription = null,
                tint = White
            )
        }
    }
}

@Composable
@Preview
fun MediumButtonPreview() {
    MediumButton(title = "Button", onClick = {
        print("Click!")
    })
}