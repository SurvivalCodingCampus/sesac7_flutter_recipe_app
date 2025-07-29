package com.example.recipeapp.data.dto

import kotlinx.serialization.Serializable

@Serializable
class RecipesDto(
    val recipes: List<RecipeDto>?
)