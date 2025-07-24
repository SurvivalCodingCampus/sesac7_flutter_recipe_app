abstract class Routes {
  static const String main = '/main';
  static const String savedRecipes = '/saved-recipes';
  static const String searchRecipes = '/search-recipes';
  static const String ingredient = '/ingredient';
  static const String ingredientWithId = '/ingredient/:id';

  static String getIngredientWithId(int id) => '$ingredient/$id';
}
