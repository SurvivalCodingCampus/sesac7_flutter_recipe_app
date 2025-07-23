import 'package:flutter_recipe_app/01_stateless/data/model/recipe.dart';
import 'package:flutter_recipe_app/01_stateless/data/repository/bookmark_recipe_repository.dart';

class MockBookmarkRecipeRepositoryImpl implements BookmarkRecipeRepository {
  final List<Recipe> _bookmarked = [
    Recipe(
      id: 0,
      name: "Traditional spare ribs baked",
      author: "Chef John",
      image: "https://placehold.co/600x400.jpg",
      duration: 20,
      rating: 4.0,
    ),
    Recipe(
      id: 1,
      name: "spice roasted chicken with flavored rice",
      author: "Mark Kelvin",
      image: "https://placehold.co/600x400.jpg",
      duration: 20,
      rating: 4.0,
    ),
    Recipe(
      id: 2,
      name: "Spicy fried rice mix chicken bali",
      author: "Spicy Nelly",
      image: "https://placehold.co/600x400.jpg",
      duration: 20,
      rating: 4.0,
    ),
    Recipe(
      id: 3,
      name:
          "Lamb chops with fruity couscous and mint but now with extra long title so that the string cannot possibly fit into the textbox but lets see how the box handles this super long text",
      author: "Spicy Nelly",
      image: "https://placehold.co/600x400.jpg",
      duration: 20,
      rating: 5.0,
    ),
  ];

  @override
  Future<List<Recipe>> getBookmarkedRecipes() async {
    return List.unmodifiable(_bookmarked);
  }

  @override
  Future<bool> addBookmarkRecipe(int index) async {
    // TO DO
    return true;
  }

  @override
  Future<bool> removeBookmarkRecipe(int index) async {
    try {
      _bookmarked.removeAt(index);
      return true;
    } catch (e) {
      return false;
    }
  }
}
