package com.example.recipeapp.presentation.component.text_field

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.text.BasicTextField
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.focus.onFocusChanged
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.example.recipeapp.ui.theme.Gray4
import com.example.recipeapp.ui.theme.Primary80
import com.example.recipeapp.ui.theme.White
import com.example.recipeapp.ui.theme.inputFieldHintTextStyle
import com.example.recipeapp.ui.theme.inputFieldLabelTextStyle

@Composable
fun InputField(
    modifier: Modifier = Modifier,
    label: String,
    placeHolder: String,
    value: String = "",
    onValueChange: (String) -> Unit
) {
    var isFocused by remember { mutableStateOf(false) }

    Box(
        modifier = modifier
    ) {
        Column {
            Text(
                label,
                modifier = Modifier
                    .height(21.dp),
                style = inputFieldLabelTextStyle,
                maxLines = 1
            )
            Spacer(
                modifier = Modifier
                    .height(5.dp)
            )
            BasicTextField(
                value = value,
                modifier = Modifier
                    .fillMaxWidth()
                    .background(color = White, shape = RoundedCornerShape(10.dp))
                    .onFocusChanged {
                        isFocused = it.isFocused
                    },
                onValueChange = onValueChange,
                decorationBox = { innerTextField ->
                    Box(
                        Modifier
                            .border(
                                width = 1.5.dp,
                                color = if (isFocused) Primary80 else Gray4,
                                shape = RoundedCornerShape(10.dp)
                            )
                            .padding(horizontal = 20.dp, vertical = 19.dp)
                    ) {
                        if (value.isEmpty()) {
                            Text(
                                text = placeHolder,
                                style = inputFieldHintTextStyle,
                            )
                        }
                        innerTextField()
                    }
                }
            )
        }
    }
}

@Composable
@Preview(/*showBackground = true*/)
fun InputFiledPreview() {
    var text by remember { mutableStateOf("") }
    Box(
        modifier = Modifier
            .fillMaxSize()
            .padding(horizontal = 30.dp),
        contentAlignment = Alignment.Center,
    ) {
        InputField(
            label = "label",
            placeHolder = "placeHolder",
            value = text,
            onValueChange = {
                text = it
            }
        )
    }
}