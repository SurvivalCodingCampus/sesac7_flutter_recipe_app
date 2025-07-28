package com.example.recipeapp.data.mapper

import com.example.recipeapp.data.dto.IngredientsDto
import com.example.recipeapp.data.model.Ingredients

fun IngredientsDto.toModel(): Ingredients {
    return Ingredients(
        ingredient = this.ingredient!!.toModel(),
        amount = this.amount!!
    )
}

fun Ingredients.toDto(): IngredientsDto {
    return IngredientsDto(
        ingredient = this.ingredient.toDto(),
        amount = this.amount
    )
}