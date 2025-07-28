import 'package:flutter_recipe_app/01_stateless/data/model/recipe.dart';
import 'package:flutter_recipe_app/01_stateless/data/repository/recipe_repository.dart';

class MockRecipeRepositoryImpl implements RecipeRepository {
  final List<Recipe> _recipes = [
    Recipe(
      id: 0,
      name: "Traditional spare ribs baked",
      author: "Chef John",
      image: "https://placehold.co/600x400.jpg",
      duration: 20,
      rating: 4.0,
      categories: {"Korean", "Chinese", "Japanese"},
    ),
    Recipe(
      id: 1,
      name: "spice roasted chicken with flavored rice",
      author: "Mark Kelvin",
      image: "https://placehold.co/600x400.jpg",
      duration: 20,
      rating: 4.0,
      categories: {"Korean"},
    ),
    Recipe(
      id: 2,
      name: "Spicy fried rice mix chicken bali",
      author: "Spicy Nelly",
      image: "https://placehold.co/600x400.jpg",
      duration: 20,
      rating: 4.0,
      categories: {"Chinese"},
    ),
    Recipe(
      id: 3,
      name:
      "Lamb chops with fruity couscous and mint but now with extra long title so that the string cannot possibly fit into the textbox but lets see how the box handles this super long text",
      author: "Spicy Nelly",
      image: "https://placehold.co/600x400.jpg",
      duration: 20,
      rating: 5.0,
      categories: {"Japanese"},
    ),
  ];

  @override
  Future<List<Recipe>> getRecipes() async {
    return List.unmodifiable(_recipes);
  }

  @override
  Future<Recipe> getRecipeById(int id) async {
    return _recipes[id];
  }

  @override
  Future<bool> addBookmarkRecipe(int id) async {
    if(await isBookmarked(id)) {
      return false;
    }
    else {
      _recipes[id] = _recipes[id].copyWith(isBookmarked: true);
      return true;
    }
  }

  @override
  Future<List<Recipe>> getBookmarkedRecipes() async {
    return _recipes.where((e) => e.isBookmarked).toList();
  }

  @override
  Future<bool> isBookmarked(int id) async {
    return _recipes[id].isBookmarked;
  }

  @override
  Future<bool> removeBookmarkRecipe(int id) async {
    if(await isBookmarked(id)) {
      _recipes[id] = _recipes[id].copyWith(isBookmarked: false);
      return true;
    }
    else {
      return false;
    }
  }
}
