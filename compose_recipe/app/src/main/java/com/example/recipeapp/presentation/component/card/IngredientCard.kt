package com.example.recipeapp.presentation.component.card

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import coil.compose.AsyncImage
import com.example.recipeapp.data.model.Ingredient
import com.example.recipeapp.data.model.Ingredients
import com.example.recipeapp.ui.theme.Gray4
import com.example.recipeapp.ui.theme.White
import com.example.recipeapp.ui.theme.ingredientCardAmount
import com.example.recipeapp.ui.theme.ingredientCardTitle

@Composable
fun IngredientCard(
    modifier: Modifier = Modifier,
    ingredients: Ingredients
) {
    Box(
        modifier = modifier
            .fillMaxWidth()
            .background(
                color = Gray4,
                shape = RoundedCornerShape(10.dp)
            )
            .padding(vertical = 12.dp, horizontal = 15.dp)
    ) {
        Row(
            verticalAlignment = Alignment.CenterVertically
        ) {
            Box(
                modifier = Modifier
                    .background(
                        color = White,
                        shape = RoundedCornerShape(10.dp)
                    )
                    .padding(all = 6.dp)
            ) {
                AsyncImage(
                    model = ingredients.ingredient.image,
                    modifier = Modifier
                        .size(40.dp),
                    contentDescription = null,
                    contentScale = ContentScale.Crop
                )
            }
            Spacer(modifier = Modifier.width(16.dp))
            Text(
                text = ingredients.ingredient.name,
                style = ingredientCardTitle,
                maxLines = 1
            )
            Spacer(modifier = Modifier.weight(1f))
            Text(
                text = "${ingredients.amount}g",
                style = ingredientCardAmount,
                maxLines = 1
            )
        }
    }
}

@Preview
@Composable
fun IngredientCardPreview() {
    val mockIngredient = Ingredients(
        Ingredient(
            3,
            "Pork",
            "https://cdn.pixabay.com/photo/2019/12/20/14/44/meat-4708596_1280.jpg"
        ),
        500,
    )
    IngredientCard(
        ingredients = mockIngredient
    )
}