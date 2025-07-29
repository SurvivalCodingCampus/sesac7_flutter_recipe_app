package com.example.recipeapp.data.mapper

import com.example.recipeapp.data.dto.RecipeDto
import com.example.recipeapp.data.model.Recipe

fun RecipeDto.toModel(): Recipe {
    return Recipe(
        category = this.category!!,
        id = this.id!!,
        name = this.name!!,
        image = this.image!!,
        chef = this.chef!!,
        time = this.time!!,
        rating = this.rating!!,
        ingredients = this.ingredients?.map { it.toModel() } ?: emptyList()
    )
}

fun Recipe.toDto(): RecipeDto {
    return RecipeDto(
        category = this.category,
        id = this.id,
        name = this.name,
        image = this.image,
        chef = this.chef,
        time = this.time,
        rating = this.rating,
        ingredients = this.ingredients.map { it.toDto() }
    )
}