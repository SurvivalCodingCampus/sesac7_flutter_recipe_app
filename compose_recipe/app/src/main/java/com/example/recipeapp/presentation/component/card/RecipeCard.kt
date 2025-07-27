package com.example.recipeapp.presentation.component.card

import android.util.Log
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.aspectRatio
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.offset
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Star
import androidx.compose.material.icons.outlined.BookmarkBorder
import androidx.compose.material.icons.outlined.Timer
import androidx.compose.material3.Icon
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import coil.compose.AsyncImage
import com.example.recipeapp.data.model.Ingredient
import com.example.recipeapp.data.model.Ingredients
import com.example.recipeapp.data.model.Recipe
import com.example.recipeapp.ui.theme.Black
import com.example.recipeapp.ui.theme.Gray4
import com.example.recipeapp.ui.theme.Primary80
import com.example.recipeapp.ui.theme.Rating
import com.example.recipeapp.ui.theme.Secondary20
import com.example.recipeapp.ui.theme.White
import com.example.recipeapp.ui.theme.recipeCadRecipeChefName
import com.example.recipeapp.ui.theme.recipeCadRecipeName
import com.example.recipeapp.ui.theme.recipeCadRecipeTime
import com.example.recipeapp.ui.theme.recipeCardRatingButtonTitle

@Composable
fun RecipeCard(
    modifier: Modifier = Modifier,
    recipe: Recipe,
    onBookmarkChanged: () -> Unit,
) {
    Box(
        modifier = modifier
            .aspectRatio(315f / 150f)
            .clip(shape = RoundedCornerShape(10.dp))
    ) {
        AsyncImage(
            model = recipe.image,
            modifier = Modifier
                .fillMaxSize(),
            contentScale = ContentScale.Crop,
            contentDescription = null
        )
        Box(
            modifier = Modifier
                .background(
                    brush = Brush.verticalGradient(
                        colors = listOf(
                            Color.Transparent,
                            Black
                        ),
                        startY = 75f,
                        endY = Float.POSITIVE_INFINITY,

                        )
                )
                .fillMaxSize()
        )
        Box(
            modifier = Modifier
                .align(Alignment.TopEnd)
                .offset(x = (-10).dp, y = 10.dp),
        ) {
            Row(
                modifier = Modifier
                    .background(
                        color = Secondary20,
                        shape = RoundedCornerShape(
                            size = 20.dp
                        )
                    )
                    .padding(horizontal = 7.dp, vertical = 2.dp),
                verticalAlignment = Alignment.CenterVertically
            ) {
                Icon(
                    Icons.Default.Star,
                    modifier = Modifier
                        .size(8.dp),
                    tint = Rating,
                    contentDescription = null,
                )
                Spacer(
                    modifier = Modifier
                        .width(3.dp)
                )
                Text(
                    text = recipe.rating.toString(),
                    style = recipeCardRatingButtonTitle
                )
            }
        }
        Box(
            modifier = Modifier
                .fillMaxSize()
        ) {
            Column(
                modifier = Modifier
                    .align(Alignment.BottomStart)
                    .offset(x = 10.dp, y = (-10).dp)
            ) {
                Text(
                    text = recipe.name,
                    modifier = Modifier
                        .width(200.dp),
                    style = recipeCadRecipeName,
                    maxLines = 2
                )
                Text(
                    text = "By ${recipe.chef}",
                    style = recipeCadRecipeChefName,
                    maxLines = 1
                )
            }
            Row(
                modifier = Modifier
                    .offset(x = (-10).dp, y = (-10).dp)
                    .align(Alignment.BottomEnd)
            ) {
                Row(
                    modifier = Modifier
                        .padding(vertical = 3.5.dp),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Icon(
                        Icons.Outlined.Timer,
                        modifier = Modifier
                            .size(17.dp),
                        contentDescription = null,
                        tint = Gray4
                    )
                    Spacer(modifier = Modifier.width(5.dp))
                    Text(
                        text = recipe.time,
                        style = recipeCadRecipeTime
                    )
                }
                Spacer(modifier = Modifier.width(10.dp))
                Box(
                    modifier = Modifier
                        .background(
                            shape = CircleShape,
                            color = White
                        )
                        .padding(4.dp)
                        .clickable {
                            onBookmarkChanged()
                        },
                    contentAlignment = Alignment.Center
                ) {
                    Icon(
                        Icons.Outlined.BookmarkBorder,
                        modifier = Modifier
                            .size(16.dp),
                        tint = Primary80,
                        contentDescription = null
                    )
                }
            }
        }
    }
}

@Preview
@Composable
fun RecipeCardPreview() {
    val mockRecipe = Recipe(
        "Indian",
        1,
        "spice roasted chicken with flavored rice",
        "https://cdn.pixabay.com/photo/2017/11/10/15/04/steak-2936531_1280.jpg",
        "Chef John",
        "20 min",
        4.0,
        listOf(
            Ingredients(
                Ingredient(
                    3,
                    "Pork",
                    "https://cdn.pixabay.com/photo/2019/12/20/14/44/meat-4708596_1280.jpg"
                ),
                500,
            ),
            Ingredients(
                Ingredient(
                    9,
                    "Onion",
                    "https://cdn.pixabay.com/photo/2013/02/21/19/14/onion-bulbs-84722_1280.jpg"
                ),
                50,
            ),
        )
    )
    RecipeCard(
        recipe = mockRecipe,
        onBookmarkChanged = {
            Log.d("TAG", "RecipeCardPreview: Click!!")
        }
    )
}