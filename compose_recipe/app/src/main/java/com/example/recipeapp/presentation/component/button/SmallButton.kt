package com.example.recipeapp.presentation.component.button

import android.util.Log
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.gestures.detectTapGestures
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.height
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
import androidx.compose.ui.draw.clip
import androidx.compose.ui.input.pointer.pointerInput
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.example.recipeapp.ui.theme.ButtonTitleTypography
import com.example.recipeapp.ui.theme.Gray4
import com.example.recipeapp.ui.theme.Primary100

@Composable
fun SmallButton(
    modifier: Modifier = Modifier,
    title: String,
    onClick: () -> Unit
) {
    var isTapDown by remember { mutableStateOf(false) }
    Box(
        modifier = modifier
            .width(174.dp)
            .height(37.dp)
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
        Text(
            text = title,
            style = ButtonTitleTypography.titleSmall,
            maxLines = 1,
            overflow = TextOverflow.Ellipsis
        )
    }
}

@Preview
@Composable
fun SmallButtonPreview() {
    SmallButton(title = "Button") {
        Log.d("TAG", "SmallButtonPreview: Click!")
    }
}