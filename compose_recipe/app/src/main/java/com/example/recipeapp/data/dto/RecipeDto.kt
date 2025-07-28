package com.example.recipeapp.data.dto

import kotlinx.serialization.Serializable

@Serializable
class RecipeDto(
    val category: String? = null,
    val id: Int? = null,
    val name: String? = null,
    val image: String? = null,
    val chef: String? = null,
    val time: String? = null,
    val rating: Double? = null,
    val ingredients: List<IngredientsDto>? = null
)