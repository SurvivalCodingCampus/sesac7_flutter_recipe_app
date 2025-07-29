package com.example.recipeapp.data.dto

import kotlinx.serialization.Serializable

@Serializable
class IngredientsDto(
    val ingredient: IngredientDto? = null,
    val amount: Int? = null
)