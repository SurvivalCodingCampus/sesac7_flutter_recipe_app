import 'package:flutter_recipe_app/01_stateless/data/model/recipe.dart';
import 'package:flutter_recipe_app/01_stateless/data/repository/saved_recipes_repository.dart';

class MockSavedRecipesRepositoryImpl implements SavedRecipesRepository {
  @override
  Future<List<Recipe>> getRecipes() async {
    return [
      Recipe(
          name: "Traditional spare ribs baked",
          author: "Chef John",
          image:  "https://placehold.co/600x400.jpg",
          duration: 20,
          rating: 4.0
      ),
      Recipe(
          name: "spice roasted chicken with flavored rice",
          author: "Mark Kelvin",
          image:  "https://placehold.co/600x400.jpg",
          duration: 20,
          rating: 4.0
      ),
      Recipe(
          name: "Spicy fried rice mix chicken bali",
          author: "Spicy Nelly",
          image:  "https://placehold.co/600x400.jpg",
          duration: 20,
          rating: 4.0
      ),
      Recipe(
          name: "Lamb chops with fruity couscous and mint but now with extra long title so that the string cannot possibly fit into the textbox but lets see how the box handles this super long text",
          author: "Spicy Nelly",
          image:  "https://placehold.co/600x400.jpg",
          duration: 20,
          rating: 5.0
      ),
    ];
  }

}