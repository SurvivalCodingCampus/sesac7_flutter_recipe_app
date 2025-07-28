package com.example.recipeapp.data.mapper

import com.example.recipeapp.data.dto.RecipesDto
import com.example.recipeapp.data.model.Recipes

fun RecipesDto.toModel(): Recipes {
    return Recipes(
        recipes = this.recipes?.map { it.toModel() } ?: emptyList()
    )
}

fun Recipes.toDto(): RecipesDto {
    return RecipesDto(
        recipes = this.recipes.map { it.toDto() }
    )
}