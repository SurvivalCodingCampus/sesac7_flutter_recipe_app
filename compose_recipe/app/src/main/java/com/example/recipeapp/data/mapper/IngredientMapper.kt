package com.example.recipeapp.data.mapper

import com.example.recipeapp.data.dto.IngredientDto
import com.example.recipeapp.data.model.Ingredient

fun IngredientDto.toModel(): Ingredient {
    return Ingredient(
        id = this.id!!,
        name = this.name!!,
        image = this.image!!
    )
}

fun Ingredient.toDto(): IngredientDto {
    return IngredientDto(
        id = this.id,
        name = this.name,
        image = this.image
    )
}