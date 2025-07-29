package com.example.recipeapp.presentation.component.dialog

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Star
import androidx.compose.material.icons.outlined.StarOutline
import androidx.compose.material3.BasicAlertDialog
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Icon
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
import androidx.compose.ui.window.DialogProperties
import com.example.recipeapp.core.enum.RatingType
import com.example.recipeapp.presentation.component.button.RatingDialogButton
import com.example.recipeapp.ui.theme.Rating
import com.example.recipeapp.ui.theme.White
import com.example.recipeapp.ui.theme.ratingDialogTitle

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun RatingDialog(
    modifier: Modifier = Modifier,
    onSendButtonClick: () -> Unit
) {
    var currentRatingType by remember { mutableStateOf(RatingType.GRADE_ZERO) }

    BasicAlertDialog(
        modifier = modifier
            .width(170.dp)
            .height(91.dp)
            .background(
                color = White,
                shape = RoundedCornerShape(
                    size = 10.dp
                )
            ),
        onDismissRequest = {},
        properties = DialogProperties(usePlatformDefaultWidth = false)
    ) {
        Column {
            Text(
                text = "Rate recipe",
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(top = 10.dp, bottom = 5.dp),
                style = ratingDialogTitle,
                textAlign = TextAlign.Center
            )
            Box(
                modifier = Modifier
                    .fillMaxWidth(),
                contentAlignment = Alignment.Center
            ) {
                Row(
                    modifier = Modifier
                        .padding(vertical = 2.dp),
                    horizontalArrangement = Arrangement.spacedBy(10.dp)
                ) {
                    for (i in listOf<RatingType>(
                        RatingType.GRADE_ONE,
                        RatingType.GRADE_TWO,
                        RatingType.GRADE_THREE,
                        RatingType.GRADE_FOUR,
                        RatingType.GRADE_FIVE
                    )) {
                        Icon(
                            if (i.value <= currentRatingType.value)
                                Icons.Default.Star
                            else
                                Icons.Outlined.StarOutline,
                            modifier = Modifier
                                .size(20.dp)
                                .clickable {
                                    currentRatingType = i
                                },
                            tint = Rating,
                            contentDescription = null
                        )
                    }
                }
            }
            Box(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(top = 5.dp, bottom = 10.dp),
                contentAlignment = Alignment.Center
            ) {
                RatingDialogButton(
                    buttonActive = currentRatingType != RatingType.GRADE_ZERO,
                    onTap = onSendButtonClick
                )
            }
        }
    }
}

@Preview
@Composable
fun RatingDialogPreview() {
    RatingDialog(
        onSendButtonClick = {

        }
    )
}