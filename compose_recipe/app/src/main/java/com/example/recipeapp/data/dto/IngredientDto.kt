package com.example.recipeapp.data.dto

import kotlinx.serialization.Serializable

@Serializable
class IngredientDto(
    val id: Int? = null,
    val name: String? = null,
    val image: String? = null
)