package com.example.recipeapp.data.repository

import com.example.recipeapp.core.Result
import com.example.recipeapp.core.enum.NetworkErrorType
import com.example.recipeapp.data.model.Recipe

interface RecipeRepository {
    suspend fun getRecipes(): Result<List<Recipe>, NetworkErrorType>
    suspend fun findRecipeById(id: Int): Result<Recipe, NetworkErrorType>
    suspend fun getSavedRecipes(): Result<List<Recipe>, NetworkErrorType>
}