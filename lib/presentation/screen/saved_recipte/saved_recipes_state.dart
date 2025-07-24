import 'package:flutter_recipe_app/data/model/recipe.dart';
import 'package:flutter_recipe_app/data/model/user.dart';

class SavedRecipesState {
  final List<Recipe> recipes;
  final List<User> users;

  SavedRecipesState({
    this.recipes = const [],
    this.users = const [],
  });

  SavedRecipesState copyWith({
    List<Recipe>? recipes,
    List<User>? users,
  }) {
    return SavedRecipesState(
      recipes: recipes ?? this.recipes,
      users: users ?? this.users,
    );
  }
}
