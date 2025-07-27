package com.example.recipeapp.data.model

data class Recipe(
    val category: String,
    val id: Int,
    val name: String,
    val image: String,
    val chef: String,
    val time: String,
    val rating: Double,
    val ingredients: List<Ingredients>
)